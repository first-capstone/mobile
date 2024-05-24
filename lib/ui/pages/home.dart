import 'package:flutter/material.dart';

class UnionHomePage extends StatefulWidget {
  const UnionHomePage({super.key});

  @override
  State<UnionHomePage> createState() => _UnionHomepageState();
}

class _UnionHomepageState extends State<UnionHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("This is Home Page!"),
        ],
      ),
    );
  }
}
