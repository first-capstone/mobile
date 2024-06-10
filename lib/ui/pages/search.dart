import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:union/ui/widgets/search_univ.dart';

class UnionSearchPage extends StatefulWidget {
  const UnionSearchPage({super.key});

  @override
  State<UnionSearchPage> createState() => _UnionSearchPageState();
}

class _UnionSearchPageState extends State<UnionSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 1.5.h),
          child: Center(
            child: SizedBox(
              width: 85.w,
              height: 5.h,
              child: SearchBar(
                leading: Row(
                  children: [
                    SizedBox(width: 1.w),
                    FaIcon(FontAwesomeIcons.search, size: 0.55.cm),
                  ],
                ),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
                shape: WidgetStateProperty.all(
                  const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                hintText: "검색",
              ),
            ),
          ),
        ),
        const SingleChildScrollView(
          child: Column(
            children: [
              SearchUniv(
                  logoPath:
                      "https://i.namu.wiki/i/qf-gKUtHQD7tB9REirpR3yhtZjIIGTFwv8m9N_5wMjkmE_xDknkuJFREtF7n8-n76EyGV5FWzEU6TQL1GrSnEg.webp",
                  univName: "ICT 폴리텍대학 (경기도)",
                  isFollow: false),
            ],
          ),
        ),
      ],
    );
  }
}
