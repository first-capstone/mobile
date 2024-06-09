import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/ui/widgets/article_detail.dart';
import 'package:union/utils/model/comment.dart';

class ArticlePreview extends StatefulWidget {
  const ArticlePreview({
    super.key,
    required this.profileImageUrl,
    required this.username,
    required this.school,
    required this.timestamp,
    this.imageUrl,
    required this.content,
    required this.upCount,
    required this.isUpped,
    required this.isReported,
    required this.comments,
  });

  final String profileImageUrl;
  final String username;
  final String school;
  final String timestamp;
  final String? imageUrl;
  final String content;
  final int upCount;
  final bool isUpped;
  final bool isReported;
  final List<Comment> comments;

  @override
  State<ArticlePreview> createState() => _ArticlePreviewState();
}

class _ArticlePreviewState extends State<ArticlePreview> {
  bool isUpped = false;
  bool isReported = false;
  int upCount = 0;
  // List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      isUpped = widget.isUpped;
      isReported = widget.isReported;
      upCount = widget.upCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const SizedBox(width: 16),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                widget.profileImageUrl,
              ), // Placeholder image
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.username,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.school, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const Spacer(),
            Text(widget.timestamp, style: const TextStyle(color: Colors.grey)),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 16),
        if (widget.imageUrl != null) Image.network(widget.imageUrl!),
        Row(
          children: [
            IconButton(
              icon: Icon(
                isUpped ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              ),
              color: isUpped ? Colors.red : Colors.grey,
              onPressed: () => {
                setState(() {
                  isUpped = !isUpped;
                  upCount = isUpped ? upCount + 1 : upCount - 1;
                })
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.comment),
              color: Colors.grey,
              onPressed: () => {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    builder: (BuildContext context) => ArticleDetail(
                      comments: widget.comments,
                      profileImageUrl: widget.profileImageUrl,
                      username: widget.username,
                      school: widget.school,
                      timestamp: widget.timestamp,
                      imageUrl: widget.imageUrl,
                      content: widget.content,
                      upCount: upCount,
                      isStarred: isUpped,
                      isReported: isReported,
                    ),
                    allowSnapshotting: false,
                  ),
                )
              },
            ),
            const Spacer(),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.circleExclamation),
              color: Colors.red,
              onPressed: () => {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child:
              Text('UP $upCount개', style: const TextStyle(color: Colors.grey)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute<bool>(
                builder: (BuildContext context) => ArticleDetail(
                  comments: widget.comments,
                  profileImageUrl: widget.profileImageUrl,
                  username: widget.username,
                  school: widget.school,
                  timestamp: widget.timestamp,
                  imageUrl: widget.imageUrl,
                  content: widget.content,
                  upCount: upCount,
                  isStarred: isUpped,
                  isReported: isReported,
                ),
                allowSnapshotting: false,
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.content,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
