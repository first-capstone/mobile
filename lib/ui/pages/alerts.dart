import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "‘배재대학교’에서 새로운 글을 올렸습니다.",
      "time": "2024.03.28 15:37",
    },
    {
      "title": "누군가 내 게시글에 UP을 달았습니다.",
      "time": "2024.03.27 17:55",
    },
    {
      "title": "새로운 대댓글이 달렸습니다.",
      "time": "2024.03.27 08:21",
    },
    {
      "title": "새로운 댓글이 달렸습니다.",
      "time": "2024.03.26 11:52",
    },
    {
      "title": "누군가 내 게시글에 UP을 달았습니다.",
      "time": "2024.03.25 18:12",
    },
  ];

  AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('알림'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.notifications, color: Colors.black),
            ),
            title: Text(notifications[index]["title"]!),
            subtitle: Text(notifications[index]["time"]!),
          );
        },
      ),
    );
  }
}
