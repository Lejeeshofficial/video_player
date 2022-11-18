import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videoplayer/application/videos_bloc.dart';
import 'package:videoplayer/screens/allvideospage/sortfunctions.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';

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
        switch (newValue) {
          case "A to Z":
            sortAlphabetical();
            break;
          case "Duration":
            sortByDuration();
            break;
          // case "Date":
          //   sortByDate();
          //   break;
          // case "FileSize":
          //   sortBySize();
        }
        setState(() {
          dropdownValue = newValue!;
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
