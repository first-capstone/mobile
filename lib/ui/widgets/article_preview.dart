import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:union/ui/widgets/article_detail.dart';
import 'package:union/utils/model/comment.dart';

class ArticlePreview extends StatefulWidget {
  const ArticlePreview({
    super.key,
    required this.profileImageUrl,
    required this.username,
    required this.school,
    required this.timestamp,
    required this.imageUrls,
    required this.content,
    required this.upCount,
    required this.isUpped,
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
  final bool isUpped;
  final bool isReported;
  final bool isAnonymous;
  final List<Comment> comments;

  @override
  State<ArticlePreview> createState() => _ArticlePreviewState();
}

class _ArticlePreviewState extends State<ArticlePreview> {
  bool isUpped = false;
  bool isReported = false;
  int upCount = 0;
  int activeIndex = 0;

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
        SizedBox(height: 1.h),
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
                Text(widget.isAnonymous ? "유니버스" : widget.username,
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
        if (widget.imageUrls.isNotEmpty)
          Stack(alignment: Alignment.bottomCenter, children: <Widget>[
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
                onPageChanged: (index, reason) => setState(() {
                  activeIndex = index;
                }),
              ),
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index, realIndex) {
                final url = widget.imageUrls[index];
                return imageSlider(url, index);
              },
            ),
            Align(alignment: Alignment.bottomCenter, child: indicator())
          ]),
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
                        imageUrls: widget.imageUrls,
                        content: widget.content,
                        upCount: upCount,
                        isStarred: isUpped,
                        isReported: isReported,
                        isAnonymous: widget.isAnonymous,
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
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
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
                  imageUrls: widget.imageUrls,
                  content: widget.content,
                  upCount: upCount,
                  isStarred: isUpped,
                  isReported: isReported,
                  isAnonymous: widget.isAnonymous,
                ),
                allowSnapshotting: false,
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
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
