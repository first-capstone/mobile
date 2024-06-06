import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';

import 'package:union/ui/widgets/drawer.dart';
import 'package:union/utils/secure_storage.dart';
import 'package:union/ui/pages/login.dart';

class UnionHomePage extends StatefulWidget {
  const UnionHomePage({super.key});

  @override
  State<UnionHomePage> createState() => _UnionHomepageState();
}

class _UnionHomepageState extends State<UnionHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const UnionDrawer(),
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Image.asset("assets/images/logo_blue_no.png", width: 13.w),
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const FaIcon(
              FontAwesomeIcons.bars,
            ),
            iconSize: 21.sp, // MenuBar Icon
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
              ),
              iconSize: 21.sp,
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.bell,
              ),
              iconSize: 21.sp,
            ),
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("This is Home Page!"),
            TextButton(
              onPressed: () async {
                SecureStorage().storage.deleteAll();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UnionLoginPage(),
                  ),
                );
              },
              child: const Text("storage 값 제거"),
            )
          ],
        ),
      ),
    );
  }
}
