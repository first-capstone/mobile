import 'package:union/utils/model/comment.dart';
import 'package:union/utils/model/profile.dart';

class Article {
  final Profile author;
  final String content;
  final String timestamp;
  final int upCount;
  final List<String> imageUrls;
  final List<Comment> comments;
  final bool isStarred;
  final bool isReported;
  final bool isAnonymous;

  Article({
    required this.author,
    required this.content,
    required this.timestamp,
    required this.upCount,
    required this.imageUrls,
    required this.comments,
    this.isStarred = false,
    this.isReported = false,
    this.isAnonymous = false,
  });
}
