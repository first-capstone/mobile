import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:union/ui/widgets/article_preview.dart';
import 'package:union/ui/widgets/drawer.dart';
import 'package:union/utils/data/dummy.dart';

class UnionHomePage extends StatefulWidget {
  const UnionHomePage({super.key});

  @override
  State<UnionHomePage> createState() => _UnionHomepageState();
}

class _UnionHomepageState extends State<UnionHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.bell,
              ),
              iconSize: 21.sp,
            ),
          ]),
      body: dummyArticleList.isEmpty
          ? const Center(
              child: Text('이곳은 조용하네요.'),
            )
          : ListView.builder(
              itemCount: dummyArticleList.length,
              itemBuilder: (context, index) {
                return ArticlePreview(
                  profileImageUrl: dummyArticleList[index].author.avatarUrl,
                  username: dummyArticleList[index].author.username,
                  school: dummyArticleList[index].author.school,
                  timestamp: dummyArticleList[index].timestamp,
                  imageUrls: dummyArticleList[index].imageUrls,
                  content: dummyArticleList[index].content,
                  upCount: dummyArticleList[index].upCount,
                  comments: dummyArticleList[index].comments,
                  isUpped: dummyArticleList[index].isStarred,
                  isReported: dummyArticleList[index].isReported,
                );
              },
            ),
    );
  }
}
