import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';

import 'package:union/utils/model/response.dart';
import 'package:union/utils/form_checker.dart';
import 'package:union/ui/dialog/dialog.dart';
import 'package:union/utils/requester.dart';

class UnionRegisterPage extends StatefulWidget {
  const UnionRegisterPage({super.key});

  @override
  State<UnionRegisterPage> createState() => _UnionRegisterPageState();
}

class _UnionRegisterPageState extends State<UnionRegisterPage> {
  final _userIDTextFormKey = GlobalKey<FormState>();
  final _userPasswordTextFormKey = GlobalKey<FormState>();
  final _userPasswordConfirmTextFormKey = GlobalKey<FormState>();
  final _userNicknameTextFormKey = GlobalKey<FormState>();
  final _userPhoneTextFormKey = GlobalKey<FormState>();
  final _userEmailTextFormKey = GlobalKey<FormState>();
  late TextEditingController _userIDController;
  late TextEditingController _userPasswordController;
  late TextEditingController _userPasswordConfirmController;
  late TextEditingController _userNicknameController;
  late TextEditingController _userPhoneController;
  late TextEditingController _userEmailController;

  String? errorIDText;
  String? errorPasswordText;
  String? errorPasswordConfirmText;
  String? errorNicknameText;
  String? errorPhoneText;
  String? errorEmailText;

  @override
  void initState() {
    super.initState();
    _userIDController = TextEditingController();
    _userPasswordController = TextEditingController();
    _userPasswordConfirmController = TextEditingController();
    _userNicknameController = TextEditingController();
    _userPhoneController = TextEditingController();
    _userEmailController = TextEditingController();
    errorIDText = null;
    errorPasswordText = null;
    errorPasswordConfirmText = null;
    errorNicknameText = null;
    errorPhoneText = null;
    errorEmailText = null;
  }

  @override
  void dispose() {
    super.dispose();
    _userIDController.dispose();
    _userPasswordController.dispose();
    _userPasswordConfirmController.dispose();
    _userNicknameController.dispose();
    _userPhoneController.dispose();
    _userEmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                child: Form(
                  key: _userIDTextFormKey,
                  onChanged: () {
                    setState(() {
                      errorIDText = validateID(_userIDController.text);
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _userIDController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: -1.w),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            icon: const FaIcon(
                              FontAwesomeIcons.solidUser,
                            ),
                            iconColor: Colors.grey[500],
                            labelText: "아이디",
                            floatingLabelStyle: TextStyle(
                              fontSize: 18.sp,
                            ),
                            hintText: "아이디 입력",
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _userIDController.text != "" &&
                                errorIDText == null
                            ? () async {
                                GeneralResponse result = await checkDuplicate(
                                    "id", _userIDController.text);
                                String resultTitle = "";
                                String resultContent = "";
                                switch (result.statusCode) {
                                  case 200:
                                    resultTitle = "축하합니다!";
                                    resultContent = result.message;
                                    break;
                                  case 409:
                                    resultTitle = "중복된 아이디";
                                    resultContent = result.message;
                                    break;
                                  case 422:
                                    resultTitle = "클라이언트 오류";
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
                            : null,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Color.fromARGB(
                                _userIDController.text != "" &&
                                        errorIDText == null
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
                          child: Center(
                            child: Text(
                              "중복 확인",
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
                  errorIDText ?? "",
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
                  key: _userPasswordTextFormKey,
                  onChanged: () {
                    setState(() {
                      errorPasswordText =
                          validatePassword(_userPasswordController.text);
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
                            contentPadding: EdgeInsets.only(left: -1.w),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            icon: const FaIcon(
                              FontAwesomeIcons.lock,
                            ),
                            iconColor: Colors.grey[500],
                            labelText: "비밀번호",
                            floatingLabelStyle: TextStyle(
                              fontSize: 18.sp,
                            ),
                            hintText: "비밀번호 입력",
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
              Container(
                width: 80.w,
                padding: EdgeInsets.only(left: 4.w, right: 2.w),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _userPasswordConfirmTextFormKey,
                  onChanged: () {
                    setState(() {
                      errorPasswordConfirmText = validatePasswordConfirm(
                          _userPasswordController.text,
                          _userPasswordConfirmController.text);
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _userPasswordConfirmController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: -1.w),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            icon: const FaIcon(
                              FontAwesomeIcons.lock,
                            ),
                            iconColor: Colors.grey[500],
                            labelText: "비밀번호 재입력",
                            floatingLabelStyle: TextStyle(
                              fontSize: 18.sp,
                            ),
                            hintText: "비밀번호를 다시 입력",
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
                  errorPasswordConfirmText ?? "",
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
                  key: _userNicknameTextFormKey,
                  onChanged: () {
                    setState(() {
                      errorNicknameText =
                          validateNickname(_userNicknameController.text);
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _userNicknameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: -1.w),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            icon: const FaIcon(
                              FontAwesomeIcons.tags,
                            ),
                            iconColor: Colors.grey[500],
                            labelText: "닉네임",
                            floatingLabelStyle: TextStyle(
                              fontSize: 18.sp,
                            ),
                            hintText: "닉네임 입력",
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _userNicknameController.text != "" &&
                                errorNicknameText == null
                            ? () async {
                                GeneralResponse result = await checkDuplicate(
                                    "nickname", _userNicknameController.text);
                                String resultTitle = "";
                                String resultContent = "";
                                switch (result.statusCode) {
                                  case 200:
                                    resultTitle = "축하합니다!";
                                    resultContent = result.message;
                                    break;
                                  case 409:
                                    resultTitle = "중복된 닉네임";
                                    resultContent = result.message;
                                    break;
                                  case 422:
                                    resultTitle = "클라이언트 오류";
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
                            : null,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Color.fromARGB(
                                _userNicknameController.text != "" &&
                                        errorNicknameText == null
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
                          child: Center(
                            child: Text(
                              "중복 확인",
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
                  errorNicknameText ?? "",
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
                  key: _userPhoneTextFormKey,
                  onChanged: () {
                    setState(() {
                      errorPhoneText = validatePhone(_userPhoneController.text);
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _userPhoneController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: -1.w),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            icon: FaIcon(
                              FontAwesomeIcons.mobileScreenButton,
                              size: Adaptive.sp(25),
                            ),
                            iconColor: Colors.grey[500],
                            labelText: "전화번호",
                            floatingLabelStyle: TextStyle(
                              fontSize: 18.sp,
                            ),
                            hintText: "000-0000-0000",
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
                  errorPhoneText ?? "",
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
                    setState(() {
                      errorEmailText = validateEmail(_userEmailController.text);
                    });
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
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Color.fromARGB(
                                _userEmailController.text != "" &&
                                        errorEmailText == null
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
                  errorEmailText ?? "",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Color.fromARGB(
                        _userIDController.text != "" &&
                                _userPasswordController.text != "" &&
                                _userPasswordConfirmController.text != "" &&
                                _userNicknameController.text != "" &&
                                _userPhoneController.text != "" &&
                                _userEmailController.text != "" &&
                                errorIDText == null &&
                                errorPasswordText == null &&
                                errorPasswordConfirmText == null &&
                                errorNicknameText == null &&
                                errorPhoneText == null &&
                                errorEmailText == null
                            ? 0xFF
                            : 0x88,
                        118,
                        143,
                        248),
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
        ),
      ),
    );
  }
}
