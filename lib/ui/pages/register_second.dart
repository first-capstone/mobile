import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';

import 'package:union/ui/widgets/univ_dropdown.dart';
import 'package:union/utils/form_checker.dart';
import 'package:union/utils/requester.dart';

class UnionRegisterSecondPage extends StatefulWidget {
  const UnionRegisterSecondPage({super.key});

  @override
  State<UnionRegisterSecondPage> createState() =>
      _UnionRegisterSecondPageState();
}

class _UnionRegisterSecondPageState extends State<UnionRegisterSecondPage> {
  final _userEmailTextFormKey = GlobalKey<FormState>();
  late TextEditingController _userEmailController;

  String? errorEmailText;

  @override
  void initState() {
    super.initState();
    _userEmailController = TextEditingController();
    errorEmailText = null;
  }

  @override
  void dispose() {
    super.dispose();
    _userEmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getUnivNameList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Error occured: ${snapshot.error.toString()}")
                  ],
                ),
              );
            } else {
              if (snapshot.data!.statusCode == 404) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("No Data Available"),
                    ],
                  ),
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
                        child: Form(
                          key: _userEmailTextFormKey,
                          onChanged: () {
                            setState(() {
                              errorEmailText =
                                  validateEmail(_userEmailController.text);
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
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    Color.fromARGB(
                                        _userEmailController.text != "" &&
                                                errorEmailText == null
                                            ? 0xFF
                                            : 0x88,
                                        118,
                                        143,
                                        248),
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
                          errorEmailText ?? "",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      UnivDropdown(universities: snapshot.data!.univList)
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
