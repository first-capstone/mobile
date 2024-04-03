import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:union/ui/pages/feed.dart';
import 'package:union/ui/pages/login.dart';
import 'package:union/utils/secure_storage.dart';

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
          home: const UnionHomePage(title: 'Union'),
        );
      },
    );
  }
}

class UnionHomePage extends StatefulWidget {
  const UnionHomePage({super.key, required this.title});

  final String title;

  @override
  State<UnionHomePage> createState() => _UnionHomePageState();
}

class _UnionHomePageState extends State<UnionHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SecureStorage().storage.read(key: "auto_login"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null ||
                snapshot.data == "" ||
                // ignore: unrelated_type_equality_checks
                snapshot.data == false) {
              return const UnionLoginPage();
            } else {
              return const UnionFeedPage();
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
