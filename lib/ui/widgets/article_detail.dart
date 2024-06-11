import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:union/utils/model/comment.dart';
import 'package:union/utils/model/profile.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({
    super.key,
    required this.profileImageUrl,
    required this.username,
    required this.school,
    required this.timestamp,
    required this.imageUrls,
    required this.content,
    required this.upCount,
    required this.isStarred,
    required this.isReported,
    required this.isAnonymous,
    required this.comments,
  });

  final String profileImageUrl;
  final String username;
  final String school;
  final String timestamp;
  final List<String> imageUrls;
  final String content;
  final int upCount;
  final bool isStarred;
  final bool isReported;
  final bool isAnonymous;
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
  int activeIndex = 0;

  int anonymousCounter = 1;
  Map<String, int> anonymousUsers = {};

  Widget imageSlider(path, index) => Container(
        width: MediaQuery.of(context).size.width <
                MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.width <
                MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Image.network(
          path,
          fit: BoxFit.contain,
        ),
      );

  Widget indicator() => Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        alignment: Alignment.bottomCenter,
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.imageUrls.length,
          effect: JumpingDotEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: Colors.white,
            dotColor: Colors.white.withOpacity(0.6),
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    isUpped = widget.isStarred;
    isReported = widget.isReported;
    upCount = widget.upCount;
    comments = widget.comments;

    for (var comment in comments) {
      if (comment.isAnnonymous) {
        _assignAnonymousNumber(comment.author.username);
      }
      if (comment.replies != null) {
        for (var reply in comment.replies!) {
          if (reply.isAnnonymous) {
            _assignAnonymousNumber(reply.author.username);
          }
        }
      }
    }
  }

  void _assignAnonymousNumber(String username) {
    if (!anonymousUsers.containsKey(username)) {
      anonymousUsers[username] = anonymousCounter++;
    }
  }

  final String dummyDefaultProfileImageUrl =
      "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg";

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
                      SizedBox(height: 1.h),
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
                              Text(
                                  widget.isAnonymous ? "유니버스" : widget.username,
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
                      if (widget.imageUrls.isNotEmpty)
                        Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: MediaQuery.of(context).size.width <
                                          MediaQuery.of(context).size.height
                                      ? MediaQuery.of(context).size.width
                                      : MediaQuery.of(context).size.height,
                                  enableInfiniteScroll: false,
                                  initialPage: 0,
                                  viewportFraction: 1,
                                  enlargeCenterPage: false,
                                  onPageChanged: (index, reason) =>
                                      setState(() {
                                    activeIndex = index;
                                  }),
                                ),
                                itemCount: widget.imageUrls.length,
                                itemBuilder: (context, index, realIndex) {
                                  final url = widget.imageUrls[index];
                                  return imageSlider(url, index);
                                },
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: indicator())
                            ]),
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
                      SizedBox(
                        height: 4.5.h,
                        child: Row(
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 0.5.h),
                        child: Text('UP $upCount개',
                            style: const TextStyle(color: Colors.grey)),
                      ),
                      const Divider(),
                      comments.isEmpty
                          ? const Center(
                              child: Text('댓글이 없습니다. 첫번째 댓글을 남겨보세요!'),
                            )
                          : Column(
                              children: [
                                for (var i = 0; i < comments.length; i++)
                                  _buildComment(
                                    index: i,
                                    avatarUrl: comments[i].author.avatarUrl,
                                    username: comments[i].author.username,
                                    school: comments[i].author.school,
                                    text: comments[i].text,
                                    timestamp: comments[i].timestamp,
                                    isAnnonymous: comments[i].isAnnonymous,
                                    replies: [
                                      for (var j = 0;
                                          j <
                                              (comments[i].replies?.length ??
                                                  0);
                                          j++)
                                        _buildReply(
                                          commentIndex: i,
                                          replyIndex: j,
                                          avatarUrl: comments[i]
                                              .replies![j]
                                              .author
                                              .avatarUrl,
                                          username: comments[i]
                                              .replies![j]
                                              .author
                                              .username,
                                          school: comments[i]
                                              .replies![j]
                                              .author
                                              .school,
                                          text: comments[i].replies![j].text,
                                          timestamp:
                                              comments[i].replies![j].timestamp,
                                          isAnnonymous: comments[i]
                                              .replies![j]
                                              .isAnnonymous,
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
                            Comment newComment = Comment(
                              author: Profile(
                                school: "배재대학교",
                                avatarUrl: dummyDefaultProfileImageUrl,
                                username: '유니온',
                              ),
                              text: _commentController.text,
                              isAnnonymous: isAnonymous,
                              timestamp:
                                  "${now.month > 9 ? now.month : "0${now.month}"}/${now.day > 9 ? now.day : "0${now.day}"} ${now.hour > 9 ? now.hour : "0${now.hour}"}:${now.minute > 9 ? now.minute : "0${now.minute}"}",
                            );
                            if (newComment.isAnnonymous) {
                              _assignAnonymousNumber(
                                  newComment.author.username);
                            }
                            comments.add(newComment);
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
    required int index,
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
                      isAnnonymous
                          ? "유니버스 ${anonymousUsers[username]} ($school)"
                          : "$username ($school)",
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
    required int commentIndex,
    required int replyIndex,
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
                  isAnnonymous
                      ? "유니버스 ${anonymousUsers[username]} ($school)"
                      : "$username ($school)",
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
