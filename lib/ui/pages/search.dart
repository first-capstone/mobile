import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:union/ui/widgets/article_preview.dart';
import 'package:union/ui/widgets/search_univ.dart';
import 'package:union/ui/widgets/tabbar.dart';
import 'package:union/utils/data/dummy.dart';

class UnionSearchPage extends StatefulWidget {
  const UnionSearchPage({Key? key}) : super(key: key);

  @override
  State<UnionSearchPage> createState() => _UnionSearchPageState();
}

class _UnionSearchPageState extends State<UnionSearchPage>
    with SingleTickerProviderStateMixin {
  late TextEditingController searchController;
  late final TabController tabController;

  String keyword = "";

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
    _tabSetting();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    tabController.dispose();
  }

  void _tabSetting() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 1.5.h),
            child: Center(
              child: SizedBox(
                width: 85.w,
                height: 5.h,
                child: SearchBar(
                  onChanged: (String x) {
                    setState(() {
                      keyword = x;
                    });
                  },
                  controller: searchController,
                  leading: Row(
                    children: [
                      SizedBox(width: 1.w),
                      FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 0.55.cm,
                      ),
                    ],
                  ),
                  trailing: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.xmark,
                      ),
                    ),
                  ],
                  shadowColor: WidgetStateProperty.all(Colors.transparent),
                  shape: WidgetStateProperty.all(
                    const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  hintText: "검색",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: SizedBox(
              width: 80.w,
              child: Text(
                '"${searchController.text}"의 검색 결과',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          ColoredBox(
            color: Colors.transparent,
            child: TabBar(
              controller: tabController,
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: const Text("학교"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: const Text("게시글"),
                ),
              ],
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 17.sp,
              ),
              unselectedLabelColor: Colors.grey[400],
              indicatorColor: Color.fromARGB(255, 129, 217, 255),
              indicatorSize: TabBarIndicatorSize.tab,
              // unselectedLabelColor: Colors.grey[400],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: dummyUnivList
                          .where((univ) => univ.univName.contains(keyword))
                          .toList(),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: dummyArticleList
                      .where((univ) =>
                          univ.author.school.contains(keyword) ||
                          univ.content.contains(keyword))
                      .length,
                  itemBuilder: (context, index) {
                    return ArticlePreview(
                      profileImageUrl: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .author
                          .avatarUrl,
                      username: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .author
                          .username,
                      school: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .author
                          .school,
                      timestamp: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .timestamp,
                      imageUrls: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .imageUrls,
                      content: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .content,
                      upCount: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .upCount,
                      comments: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .comments,
                      isUpped: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .isStarred,
                      isReported: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .isReported,
                      isAnonymous: dummyArticleList
                          .where((univ) =>
                              univ.author.school.contains(keyword) ||
                              univ.content.contains(keyword))
                          .toList()[index]
                          .isAnonymous,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
