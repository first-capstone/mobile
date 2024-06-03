import 'package:union/utils/model/response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UnivDropdown extends StatefulWidget {
  List<UniversityOnlyName>? universities;
  UnivDropdown({super.key, required this.universities});

  @override
  State<UnivDropdown> createState() => _UnivDropdownState();
}

class _UnivDropdownState extends State<UnivDropdown> {
  UniversityOnlyName? selectedUniversity;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<UniversityOnlyName>(
      decoration: InputDecoration(
        labelText: 'Select University',
        border: OutlineInputBorder(),
      ),
      value: selectedUniversity,
      items: widget.universities!.map((university) {
        return DropdownMenuItem<UniversityOnlyName>(
          value: university,
          child: Text(university.univName),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedUniversity = newValue;
        });
      },
    );
  }
}
