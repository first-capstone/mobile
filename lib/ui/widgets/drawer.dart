import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UnionDrawer extends StatelessWidget {
  const UnionDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Theme(
            data: ThemeData(
              dividerColor: Colors.transparent,
              dividerTheme: const DividerThemeData(
                color: Colors.transparent,
              ),
            ),
            child: UserAccountsDrawerHeader(
              arrowColor: Colors.transparent,
              currentAccountPicture: CircleAvatar(
                // 현재 계정 이미지 set
                // backgroundImage: AssetImage('assets/profile.png'),
                backgroundImage: const NetworkImage(
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
                ),
                backgroundColor: Colors.white,
                onBackgroundImageError: (exception, stackTrace) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
              // otherAccountsPictures: const <Widget>[],
              accountName: const Text('유니온'),
              accountEmail: const Text('union@email.com'),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
            ),
          ), // 프로필

          Padding(
            padding: EdgeInsets.only(top: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.account_circle_rounded,
                      color: Colors.grey[850],
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "계정",
                      style: TextStyle(
                          fontSize: 0.5.cm, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey[350],
                  height: 1.5.h,
                  indent: 0.6.cm,
                  endIndent: 0.6.cm,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    children: [
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "정보수정", //이메일,연락처,이름,학교
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "로그아웃",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "회원탈퇴",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.article_sharp,
                      color: Colors.grey[850],
                    ),
                    SizedBox(width: 4.w),
                    Text("게시물", style: TextStyle(fontSize: 0.45.cm))
                  ],
                ),
                Divider(
                  color: Colors.grey[350],
                  height: 1.5.h,
                  indent: 0.6.cm,
                  endIndent: 0.6.cm,
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    children: [
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "BEST 게시물", //이메일,연락처,이름,학교
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "찜한 게시물",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "내가 작성한 게시물",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.settings,
                      color: Colors.grey[850],
                    ),
                    SizedBox(width: 4.w),
                    Text("설정", style: TextStyle(fontSize: 0.45.cm))
                  ],
                ),
                Divider(
                  color: Colors.grey[350],
                  height: 1.5.h,
                  indent: 0.6.cm,
                  endIndent: 0.6.cm,
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    children: [
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "알림 설정",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "암호 설정",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.question_answer,
                      color: Colors.grey[850],
                    ),
                    SizedBox(width: 4.w),
                    Text("이용 안내", style: TextStyle(fontSize: 0.45.cm))
                  ],
                ),
                Divider(
                  color: Colors.grey[350],
                  height: 1.5.h,
                  indent: 0.6.cm,
                  endIndent: 0.6.cm,
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    children: [
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "1:1 문의하기",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "공지사항",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "서비스 이용약관",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "개인정보 처리방침",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "청소년 보호정책",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        minTileHeight: 0.2.h,
                        title: Text(
                          "오픈소스 라이선스",
                          style: TextStyle(fontSize: 0.35.cm),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
