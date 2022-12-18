import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:videoplayer/screens/allvideospage/sortfunctions.dart';

class SortDropdown extends StatefulWidget {
  SortDropdown({Key? key}) : super(key: key);

  @override
  State<SortDropdown> createState() => _SortDropdownState();
}

class _SortDropdownState extends State<SortDropdown> {
  String dropdownValue = 'A to Z';
  List<String> items = [
    'A to Z',
    'Duration',
    // 'Date',
    // 'FileSize',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      borderRadius: BorderRadius.circular(10),
      dropdownColor: Colors.black,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
      elevation: 16,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      onChanged: (newValue) {
        log(newValue!);
        switch (newValue) {
          case "A to Z":
            sortAlphabetical();
            break;
          case "Duration":
            sortByDuration();
            break;
        }
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: items.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
