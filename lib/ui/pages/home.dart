import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/ui/modal/new_article.dart';
import 'package:union/ui/pages/alerts.dart';

import 'package:union/ui/widgets/article_preview.dart';
import 'package:union/ui/widgets/drawer.dart';
import 'package:union/utils/data/dummy.dart';
import 'package:union/utils/model/article.dart';
import 'package:union/utils/model/profile.dart';

class UnionHomePage extends StatefulWidget {
  const UnionHomePage({super.key});

  @override
  State<UnionHomePage> createState() => _UnionHomepageState();
}

class _UnionHomepageState extends State<UnionHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  final data = dummyArticleList;

  void addArticle(String content, bool isAnonymouse) {
    DateTime now = DateTime.now();
    setState(() {
      data.insert(
        0,
        Article(
          author: Profile(
            avatarUrl:
                'https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg', // Default avatar URL
            username: '유니온',
            school: '배재대학교',
          ),
          timestamp:
              "${now.month > 9 ? now.month : "0${now.month}"}/${now.day > 9 ? now.day : "0${now.day}"} ${now.hour > 9 ? now.hour : "0${now.hour}"}:${now.minute > 9 ? now.minute : "0${now.minute}"}",
          imageUrls: [], // No image URLs by default
          content: content,
          upCount: 0,
          comments: [],
          isStarred: false,
          isReported: false,
          isAnonymous: isAnonymouse,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const UnionDrawer(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        shadowColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Image.asset("assets/images/logo_blue_no.png", width: 13.w),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const FaIcon(
            FontAwesomeIcons.bars,
          ),
          iconSize: 21.sp, // MenuBar Icon
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
            iconSize: 21.sp,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  builder: (BuildContext context) => AlertPage(),
                  allowSnapshotting: false,
                ),
              );
            },
            icon: const FaIcon(
              FontAwesomeIcons.bell,
            ),
            iconSize: 21.sp,
          ),
        ],
      ),
      body: data.isEmpty
          ? const Center(
              child: Text('이곳은 조용하네요.'),
            )
          : ListView.builder(
              controller: _scrollController,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ArticlePreview(
                  profileImageUrl: data[index].author.avatarUrl,
                  username: data[index].author.username,
                  school: data[index].author.school,
                  timestamp: data[index].timestamp,
                  imageUrls: data[index].imageUrls,
                  content: data[index].content,
                  upCount: data[index].upCount,
                  comments: data[index].comments,
                  isUpped: data[index].isStarred,
                  isReported: data[index].isReported,
                  isAnonymous: data[index].isAnonymous,
                );
              },
            ),
      floatingActionButton:
          CustomFab(controller: _scrollController, addArticle: addArticle),
    );
  }
}

class CustomFab extends StatefulWidget {
  const CustomFab(
      {super.key, required this.controller, required this.addArticle});

  final ScrollController controller;
  final Function(String content, bool isAnonymouse) addArticle;

  @override
  State<CustomFab> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  bool isVisible = true;

  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible != false) {
          setState(() {
            isVisible = false;
          });
        }
      } else {
        if (isVisible != true) {
          setState(() {
            isVisible = true;
          });
        }
      }
    });
    super.initState();
  }

  void _showPopup() {
    showCupertinoModalPopup(
      context: context,
      // builder: (BuildContext context) {
      //   return NewArticle(addArticle: widget.addArticle);
      // },
      builder: (context) => ScaffoldMessenger(
        child: NewArticle(addArticle: widget.addArticle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: FloatingActionButton(
        onPressed: _showPopup,
        child: const FaIcon(
          FontAwesomeIcons.pen,
        ),
      ),
    );
  }
}
