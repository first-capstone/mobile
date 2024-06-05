import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';

import 'package:union/ui/widgets/univ_input.dart';
import 'package:union/utils/secure_storage.dart';
import 'package:union/utils/model/response.dart';
import 'package:union/utils/form_checker.dart';
import 'package:union/ui/pages/register.dart';
import 'package:union/ui/dialog/dialog.dart';
import 'package:union/utils/requester.dart';
import 'package:union/ui/pages/home.dart';

class UnionAdminLoginPage extends StatefulWidget {
  const UnionAdminLoginPage({super.key});

  @override
  State<UnionAdminLoginPage> createState() => _UnionAdminLoginPageState();
}

class _UnionAdminLoginPageState extends State<UnionAdminLoginPage> {
  final _userPasswordTextFormKey = GlobalKey<FormState>();
  late TextEditingController _userIDController;
  late TextEditingController _userPasswordController;
  late StreamController<List<UniversityOnlyName>> _univStream;

  String? errorIDText;
  String? errorPasswordText;

  void _loadUnivs() async {
    await getUnivNameList().then((univs) {
      List<UniversityOnlyName> _univs = [];
      for (var it in univs.univList!) {
        _univs.add(it);
      }
      _univStream.add(_univs);
    });
  }

  @override
  void initState() {
    super.initState();
    _userIDController = TextEditingController();
    _userPasswordController = TextEditingController();
    errorIDText = null;
    errorPasswordText = null;
    _univStream = StreamController<List<UniversityOnlyName>>();
    _loadUnivs();
  }

  @override
  void dispose() {
    super.dispose();
    _userIDController.dispose();
    _userPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: _univStream.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error occured: ${snapshot.error.toString()}"),
                );
              } else {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No Data Available"),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15.h),
                        Image.asset(
                          "assets/images/logo_pink.png",
                          width: 55.w,
                        ),
                        SizedBox(height: 2.h),

                        // 입력 필드
                        Container(
                          width: 80.w,
                          padding: EdgeInsets.only(left: 4.w, right: 2.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: UnivInput(
                            universities: snapshot.data,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Text(
                            errorIDText ?? "",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Container(
                          width: 80.w,
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Form(
                            key: _userPasswordTextFormKey,
                            onChanged: () {
                              setState(() {
                                errorPasswordText = validatePassword(
                                    _userPasswordController.text);
                              });
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _userPasswordController,
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: -1.w),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      icon: const FaIcon(
                                        FontAwesomeIcons.key,
                                      ),
                                      iconColor: Colors.grey[500],
                                      labelText: "인증키",
                                      floatingLabelStyle: TextStyle(
                                        fontSize: 18.sp,
                                      ),
                                      hintText: "인증키 입력",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Text(
                            errorPasswordText ?? "",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _userIDController.text != "" &&
                                  _userPasswordController.text != "" &&
                                  errorIDText == null &&
                                  errorPasswordText == null
                              ? () async {
                                  ResponseWithAccessToken result = await login(
                                      _userIDController.text,
                                      _userPasswordController.text);
                                  String resultTitle = "";
                                  String resultContent = "";
                                  String token = "";
                                  bool success = false;
                                  switch (result.statusCode) {
                                    case 200:
                                      success = true;
                                      resultTitle = "로그인 성공";
                                      resultContent = result.message;
                                      token = result.accessToken ?? "";
                                      break;
                                    case 401:
                                      resultTitle = "로그인 실패";
                                      resultContent = result.message;
                                      break;
                                    case 422:
                                      resultTitle = "데이터 전송 오류";
                                      resultContent = result.message;
                                      break;
                                    case 500:
                                      resultTitle = "서버 내부 오류";
                                      resultContent = result.message;
                                      break;
                                  }
                                  if (success) {
                                    await SecureStorage().storage.write(
                                        key: "auto_login", value: "true");
                                    await SecureStorage().storage.write(
                                        key: "access_token", value: token);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const UnionHomePage(),
                                      ),
                                    );
                                  } else {
                                    createSmoothDialog(
                                        // ignore: use_build_context_synchronously
                                        context,
                                        resultTitle,
                                        Text(resultContent),
                                        TextButton(
                                          child: const Text("닫기"),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            try {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            } catch (e) {
                                              return;
                                            }
                                            return;
                                          },
                                        ),
                                        null,
                                        false);
                                  }
                                }
                              : null,
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Color.fromARGB(
                                  _userIDController.text != "" &&
                                          _userPasswordController.text != "" &&
                                          errorIDText == null &&
                                          errorPasswordText == null
                                      ? 0xFF
                                      : 0x88,
                                  255,
                                  195,
                                  195),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: SizedBox(
                            width: 74.w,
                            height: 25.sp,
                            child: Center(
                              child: Text(
                                "로그인",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 15.h),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "아이디 / 비밀번호 찾기",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UnionRegisterPage()));
                          },
                          child: Text(
                            "회원가입",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
            }),
      ),
    );
  }
}
