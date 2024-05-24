import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:union/utils/form_checker.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo_blue_no.png",
              width: 30.w,
            ),
            SizedBox(height: 5.h),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 118, 143, 248),
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
    );
  }
}
