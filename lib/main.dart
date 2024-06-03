import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:union/ui/pages/register_second.dart';

import 'package:union/utils/secure_storage.dart';
import 'package:union/ui/pages/login.dart';
import 'package:union/ui/pages/home.dart';

void main() {
  runApp(const UnionApp());
}

class UnionApp extends StatelessWidget {
  const UnionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Union',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 118, 143, 248)),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const UnionMainPage(title: 'Union'),
        );
      },
    );
  }
}

class UnionMainPage extends StatefulWidget {
  const UnionMainPage({super.key, required this.title});

  final String title;

  @override
  State<UnionMainPage> createState() => _UnionMainPageState();
}

class _UnionMainPageState extends State<UnionMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SecureStorage().storage.read(key: "auto_login"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != "true") {
              return const UnionLoginPage();
            } else {
              return const UnionHomePage();
            }
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('로그인 정보 확인중...'),
                  SizedBox(height: 16.sp),
                  const CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
