import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UnionLoginPage extends StatefulWidget {
  const UnionLoginPage({super.key});

  @override
  State<UnionLoginPage> createState() => _UnionLoginPageState();
}

class _UnionLoginPageState extends State<UnionLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo_blue.png",
            width: 50.w,
          ),

          // 입력 필드
          Container(
            width: 80.w,
            height: 30.sp,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 2.w),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[600],
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "아이디",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            width: 80.w,
            height: 30.sp,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 2.w),
                  child: Icon(
                    Icons.lock,
                    color: Colors.grey[600],
                  ),
                ),
                const Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "비밀번호",
                    ),
                  ),
                ),
              ],
            ),
          ),
          // create a sign in button
          SizedBox(height: 2.h),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 118, 143, 248),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: SizedBox(
              width: 75.w,
              height: 25.sp,
              child: Center(
                child: Text(
                  "로그인",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: Text(
              "게스트로 로그인",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16.sp,
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          SizedBox(height: 16.h),
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
            onPressed: () {},
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
