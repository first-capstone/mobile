import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:union/ui/pages/school_evaluation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';

class SearchUniv extends StatefulWidget {
  SearchUniv({
    super.key,
    required this.logoPath,
    required this.univName,
    this.isFollow = false,
  });

  final String logoPath;
  final String univName;
  bool isFollow;

  @override
  State<SearchUniv> createState() => _SearchUnivState();
}

class _SearchUnivState extends State<SearchUniv> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).push(
          CupertinoPageRoute<bool>(
            builder: (BuildContext context) => const SchoolEvaluationPage(),
            allowSnapshotting: false,
          ),
        );
      },
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black12, // You can customize the border color
              width: 1.0, // Customize the border width
            ),
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
      child: SizedBox(
        height: 6.h,
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle, // Use rectangle shape
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage(widget.logoPath),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Text(
                widget.univName,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 0.45.cm,
                  color: Colors.black54,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.isFollow = !widget.isFollow;
                    });
                  },
                  child: Text(
                    widget.isFollow ? "팔로잉" : "팔로우",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      Size(18.w, 3.h),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      widget.isFollow
                          ? Color.fromARGB(255, 193, 204, 212)
                          : Color.fromARGB(255, 129, 217, 255),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
