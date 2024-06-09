import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:union/utils/data/dummy.dart';
import 'package:union/utils/model/comment.dart';
import 'package:union/utils/model/profile.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({
    super.key,
    required this.profileImageUrl,
    required this.username,
    required this.school,
    required this.timestamp,
    this.imageUrl,
    required this.content,
    required this.upCount,
    required this.isStarred,
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
  final bool isStarred;
  final bool isReported;
  final List<Comment> comments;

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  final TextEditingController _commentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool isAnonymous = true;
  bool isUpped = false;
  bool isReported = false;
  int upCount = 0;
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      isUpped = widget.isStarred;
      isReported = widget.isReported;
      upCount = widget.upCount;
      comments = widget.comments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세보기'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const SizedBox(width: 16),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(widget.profileImageUrl),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.username,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(widget.school,
                                  style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const Spacer(),
                          Text(widget.timestamp,
                              style: const TextStyle(color: Colors.grey)),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 16),
                      if (widget.imageUrl != null)
                        Image.network(widget.imageUrl!),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              widget.content,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              isUpped
                                  ? FontAwesomeIcons.solidHeart
                                  : FontAwesomeIcons.heart,
                            ),
                            color: isUpped ? Colors.red : Colors.grey,
                            onPressed: () => {
                              setState(() {
                                isUpped = !isUpped;
                                upCount = isUpped ? upCount + 1 : upCount - 1;
                              })
                            },
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const FaIcon(
                                FontAwesomeIcons.circleExclamation),
                            color: Colors.red,
                            onPressed: () => {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        child: Text('UP $upCount개',
                            style: const TextStyle(color: Colors.grey)),
                      ),
                      const Divider(),
                      comments.isEmpty
                          ? const Center(
                              child: Text('댓글이 없습니다.'),
                            )
                          : Column(
                              children: [
                                for (var comment in comments)
                                  _buildComment(
                                    avatarUrl: comment.author.avatarUrl,
                                    username: comment.author.username,
                                    school: comment.author.school,
                                    text: comment.text,
                                    timestamp: comment.timestamp,
                                    isAnnonymous: comment.isAnnonymous,
                                    replies: [
                                      for (var reply in comment.replies ?? [])
                                        _buildReply(
                                          avatarUrl: reply.author.avatarUrl,
                                          username: reply.author.username,
                                          school: reply.author.school,
                                          text: reply.text,
                                          timestamp: reply.timestamp,
                                          isAnnonymous: reply.isAnnonymous,
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: isAnonymous,
                        onChanged: (value) {
                          setState(() {
                            isAnonymous = value!;
                          });
                        },
                      ),
                      const Text('익명'),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          decoration: const InputDecoration(
                            hintText: '댓글을 입력하세요.',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.send),
                        color: Colors.grey,
                        onPressed: () {
                          DateTime now = DateTime.now();
                          setState(() {
                            comments.add(
                              Comment(
                                author: Profile(
                                  school: "배재대학교",
                                  avatarUrl: dummyDefaultProfileImageUrl,
                                  username: '유니온',
                                ),
                                text: _commentController.text,
                                isAnnonymous: isAnonymous,
                                timestamp:
                                    "${now.month > 10 ? now.month : "0${now.month}"}/${now.day > 10 ? now.day : "0${now.day}"} ${now.hour > 10 ? now.hour : "0${now.hour}"}:${now.minute > 10 ? now.minute : "0${now.minute}"}",
                              ),
                            );
                            _commentController.clear();
                          });
                          _scrollController.jumpTo(
                              _scrollController.position.maxScrollExtent + 100);
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildComment({
    required String avatarUrl,
    required String username,
    required String school,
    required String text,
    required String timestamp,
    required List<Widget> replies,
    required bool isAnnonymous,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${isAnnonymous ? "유니버스" : username} ($school)",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(text),
                    Text(
                      timestamp,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ...replies,
        ],
      ),
    );
  }

  Widget _buildReply({
    required String avatarUrl,
    required String username,
    required String school,
    required String text,
    required String timestamp,
    required bool isAnnonymous,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(3),
            child: const Icon(
              FontAwesomeIcons.reply,
              size: 20,
              color: Colors.grey,
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${isAnnonymous ? "유니버스" : username} ($school)",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(text),
                Text(
                  timestamp,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
