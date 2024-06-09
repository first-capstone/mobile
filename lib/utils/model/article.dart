import 'package:union/utils/model/comment.dart';
import 'package:union/utils/model/profile.dart';

class Article {
  final Profile author;
  final String content;
  final String timestamp;
  final int upCount;
  final String? imageUrl;
  final List<Comment> comments;
  final bool isStarred;
  final bool isReported;

  Article({
    required this.author,
    required this.content,
    required this.timestamp,
    required this.upCount,
    this.imageUrl,
    required this.comments,
    this.isStarred = false,
    this.isReported = false,
  });
}
