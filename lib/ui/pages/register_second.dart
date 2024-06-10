import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:union/ui/pages/login.dart';

import 'package:union/ui/widgets/univ_input.dart';
import 'package:union/utils/form_checker.dart';
import 'package:union/utils/model/response.dart';
import 'package:union/utils/requester.dart';
import 'package:union/utils/secure_storage.dart';
import 'package:union/ui/dialog/dialog.dart';

class UnionRegisterSecondPage extends StatefulWidget {
  const UnionRegisterSecondPage({Key? key}) : super(key: key);

  @override
  State<UnionRegisterSecondPage> createState() =>
      _UnionRegisterSecondPageState();
}

class _UnionRegisterSecondPageState extends State<UnionRegisterSecondPage> {
  final _userEmailTextFormKey = GlobalKey<FormState>();
  final _verifyCodeTextFormKey = GlobalKey<FormState>();
  final _userSIDTextFormKey = GlobalKey<FormState>();
  late StreamController<List<UniversityOnlyName>> _univStream;

  late TextEditingController _userEmailController;
  late TextEditingController _verifyCodeController;
  late TextEditingController _userSIDController;
  late UniversityOnlyName selectedUniv = UniversityOnlyName(
      uUuid: "e5be0c09-de40-410e-99f4-3c9e426c63ac", univName: "배재대학교");

  String? errorEmailText;
  String? verifyTimer;
  int verifyCode = 1704;
  bool called = false;
  bool verified = false;

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
    _userEmailController = TextEditingController();
    _verifyCodeController = TextEditingController();
    _userSIDController = TextEditingController();
    errorEmailText = null;
    _univStream = StreamController<List<UniversityOnlyName>>();
    _loadUnivs();
  }

  @override
  void dispose() {
    super.dispose();
    _userEmailController.dispose();
    _verifyCodeController.dispose();
  }

  void checkErrorEmail(String email) {
    setState(() {
      errorEmailText = validateEmail(email);
    });
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
                    children: [
                      SizedBox(height: 5.h),
                      Image.asset(
                        "assets/images/logo_blue_no.png",
                        width: 30.w,
                      ),
                      SizedBox(height: 3.h),
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
                          "",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 80.w,
                        padding: EdgeInsets.only(left: 4.w, right: 2.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Form(
                          key: _userEmailTextFormKey,
                          onChanged: () {
                            checkErrorEmail(_userEmailController.text);
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _userEmailController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: -1.w),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    icon: const FaIcon(
                                      FontAwesomeIcons.solidEnvelope,
                                    ),
                                    iconColor: Colors.grey[500],
                                    labelText: "이메일",
                                    floatingLabelStyle: TextStyle(
                                      fontSize: 18.sp,
                                    ),
                                    hintText: "20240101@example.ac.kr",
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  setState(() {
                                    called = true;
                                  });
                                  UnivCertResponse response = await checkEmail(
                                      "2261050@pcu.ac.kr", "배재대학교");

                                  print(response.statusCode ?? "");
                                  print(response.message ?? "");
                                  String resultTitle;
                                  String resultContent;

                                  switch (true) {
                                    case true:
                                      resultTitle = "인증 요청 성공";
                                      resultContent = "메일 인증 요청을 전송하였습니다!";
                                      break;

                                    case false:
                                      resultTitle = "인증 요청 실패";
                                      resultContent =
                                          "메일 인증 요청을 실패하였습니다. ${response.statusCode}";
                                      break;
                                  }
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
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    Color.fromARGB(
                                      (_userEmailController.text.isNotEmpty &&
                                              errorEmailText == null &&
                                              !called)
                                          ? 0xFF
                                          : 0x88,
                                      118,
                                      143,
                                      248,
                                    ),
                                  ),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: SizedBox(
                                  child: Center(
                                    child: Text(
                                      "인증 요청",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                    ),
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
                          errorEmailText ?? "",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 80.w,
                        padding: EdgeInsets.only(left: 4.w, right: 2.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Form(
                          onChanged: () {
                            setState(() {});
                          },
                          key: _verifyCodeTextFormKey,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _verifyCodeController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: -1.w),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    icon: const FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                    ),
                                    iconColor: Colors.grey[500],
                                    labelText: "인증코드(4자리)",
                                    floatingLabelStyle: TextStyle(
                                      fontSize: 18.sp,
                                    ),
                                    hintText: "0000",
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  String resultTitle;
                                  String resultContent;
                                  switch (
                                      int.parse(_verifyCodeController.text) ==
                                          verifyCode) {
                                    case true:
                                      resultTitle = "인증 성공";
                                      resultContent = "메일 인증에 성공하였습니다!";
                                      setState(() {
                                        verified = true;
                                      });
                                      break;

                                    case false:
                                      resultTitle = "인증 실패";
                                      resultContent = "메일 인증에 실패하였습니다.";
                                      break;
                                  }
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
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    Color.fromARGB(
                                      (_verifyCodeController.text != "" &&
                                              !verified)
                                          ? 0xFF
                                          : 0x88,
                                      118,
                                      143,
                                      248,
                                    ),
                                  ),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: SizedBox(
                                  child: Center(
                                    child: Text(
                                      "메일 인증",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                    ),
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
                          "",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 80.w,
                        padding: EdgeInsets.only(left: 4.w, right: 2.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Form(
                          key: _userSIDTextFormKey,
                          onChanged: () {
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _userSIDController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: -1.w),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    icon: const FaIcon(
                                      FontAwesomeIcons.calendarDays,
                                    ),
                                    iconColor: Colors.grey[500],
                                    labelText: "입학년도",
                                    floatingLabelStyle: TextStyle(
                                      fontSize: 18.sp,
                                    ),
                                    hintText: "0000",
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
                          "",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      TextButton(
                        onPressed: () async {
                          GeneralResponse result = await register(
                              await SecureStorage()
                                      .storage
                                      .read(key: "user_id") ??
                                  "",
                              await SecureStorage()
                                      .storage
                                      .read(key: "password") ??
                                  "",
                              await SecureStorage()
                                      .storage
                                      .read(key: "nickname") ??
                                  "",
                              _userEmailController.text,
                              await SecureStorage()
                                      .storage
                                      .read(key: "phone") ??
                                  "",
                              "e5be0c09-de40-410e-99f4-3c9e426c63ac",
                              _userSIDController.text);
                          String resultTitle = "";
                          String resultContent = "";
                          bool success = false;
                          switch (result.statusCode) {
                            case 200:
                              success = true;
                              resultTitle = "회원가입 성공";
                              resultContent = result.message;
                              break;
                            case 401:
                              resultTitle = "회원가입 실패";
                              resultContent = result.message;
                              break;
                            case 409:
                              resultTitle = "데이터 충돌";
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
                          createSmoothDialog(
                              // ignore: use_build_context_synchronously
                              context,
                              resultTitle,
                              Text(resultContent),
                              TextButton(
                                child: Text(success ? "확인" : "닫기"),
                                onPressed: () async {
                                  if (!success) {
                                    Navigator.pop(context);
                                    try {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                    } catch (e) {
                                      return;
                                    }
                                  } else {
                                    try {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UnionLoginPage(),
                                        ),
                                      );
                                    } catch (e) {
                                      return;
                                    }
                                  }
                                  return;
                                },
                              ),
                              null,
                              false);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Color.fromARGB(
                                verified && _userSIDController.text.isNotEmpty
                                    ? 0xFF
                                    : 0x88,
                                118,
                                143,
                                248),
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: 70.w,
                          height: 25.sp,
                          child: Center(
                            child: Text(
                              "회원가입",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
