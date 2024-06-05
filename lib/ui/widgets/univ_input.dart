import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/utils/model/response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UnivInput extends StatefulWidget {
  List<UniversityOnlyName>? universities;
  UnivInput({super.key, required this.universities});

  @override
  State<UnivInput> createState() => _UnivInputState();
}

class _UnivInputState extends State<UnivInput> {
  UniversityOnlyName? selectedUniversity;

  String currentText = "";
  Future<List<UniversityOnlyName>> suggestionsCallback(String pattern) async =>
      widget.universities!.where((univ) {
        final nameLower = univ.univName.toLowerCase().split(' ').join('');
        final patternLower = pattern.toLowerCase().split(' ').join('');
        return nameLower.contains(patternLower);
      }).toList();
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<UniversityOnlyName>(
        suggestionsCallback: suggestionsCallback,
        builder: (context, controller, focusNode) {
          _textEditingController = controller;
          return TextField(
            controller: _textEditingController,
            focusNode: focusNode,
            autofocus: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: -2.5.w),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              icon: const FaIcon(
                FontAwesomeIcons.graduationCap,
              ),
              iconColor: Colors.grey[500],
              labelText: "대학교",
              floatingLabelStyle: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          );
        },
        itemBuilder: (context, univ) {
          return ListTile(
            title: Text(
              univ.univName,
            ),
          );
        },
        onSelected: (univ) {
          setState(() {
            _textEditingController.text = univ.univName;
          });
        },
        emptyBuilder: (value) {
          return const ListTile(
            title: Text("대학교를 찾을 수 없습니다."),
          );
        });
  }
}
