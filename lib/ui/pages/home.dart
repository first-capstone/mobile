import 'package:flutter/material.dart';

import 'package:union/utils/secure_storage.dart';
import 'package:union/ui/pages/login.dart';

class UnionHomePage extends StatefulWidget {
  const UnionHomePage({super.key});

  @override
  State<UnionHomePage> createState() => _UnionHomepageState();
}

class _UnionHomepageState extends State<UnionHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
