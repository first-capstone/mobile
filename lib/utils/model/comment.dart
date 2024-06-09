import 'package:union/utils/model/profile.dart';

class Comment {
  final Profile author;
  final String text;
  final String timestamp;
  final List<Comment>? replies;

  Comment({
    required this.author,
    required this.text,
    required this.timestamp,
    this.replies,
  });
}
