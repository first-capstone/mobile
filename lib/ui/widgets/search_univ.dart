import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';

class SearchUniv extends StatefulWidget {
  const SearchUniv({
    super.key,
    required this.logoPath,
    required this.univName,
    required this.isFollow,
  });

  final String logoPath;
  final String univName;
  final bool isFollow;

  @override
  State<SearchUniv> createState() => _SearchUnivState();
}

class _SearchUnivState extends State<SearchUniv> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black38, // You can customize the border color
              width: 1.0, // Customize the border width
            ),
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
      child: SizedBox(
        height: 5.5.h,
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
            Text(
              widget.univName,
              style: TextStyle(
                fontSize: 0.45.cm,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
