// import 'package:file_manager/enums/sort_by.dart';
// import 'package:flutter/cupertino.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:videoplayer/Fetchingfies/video_with_info.dart';

String dropdownValue = 'Duration';

Widget dropdownmenusort(context) {
  return DropdownButton(
    borderRadius: BorderRadius.circular(20),
    dropdownColor: Colors.black,
    icon: const Icon(
      Icons.sort_outlined,
      color: Colors.white,
    ),
    elevation: 16,
    style: const TextStyle(color: Colors.white),
    items: ['A to Z', 'Duration', 'Date', 'FileSize'].map((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value),
      );
    }).toList(),
    onChanged: (String? newValue) {
      switch (newValue) {
        case "A to Z":
          sortAlphabetical();
          log('////================>Clicks A TO Z');
          break;
        case "Duration":
          sortByDuration();
          break;
        case "Date":
          sortByDate();
          break;
        case "FileSize":
          sortBySize();
          break;
      }
    },
  );
}

sortAlphabetical() {
  fetchedVideosWithInfo.value.sort(
    ((a, b) {
      return a.title!.toLowerCase().compareTo(b.title!.toLowerCase());
    }),
  );
  log(fetchedVideosWithInfo.toString());
  log("-------------->>>>A TO Z reaches the line");
}

sortByDuration() {
  fetchedVideosWithInfo.value.sort(
    ((a, b) {
      return a.duration!.compareTo(b.duration!);
    }),
  );
  fetchedVideosWithInfo.notifyListeners();
}

sortByDate() {
  fetchedVideosWithInfo.value.sort(
    ((a, b) {
      return a.date!.compareTo(b.date!);
    }),
  );
  fetchedVideosWithInfo.notifyListeners();
}

sortBySize() {
  fetchedVideosWithInfo.value.sort(
    ((a, b) {
      return a.filesize!.compareTo(b.filesize!);
    }),
  );

  fetchedVideosWithInfo.notifyListeners();
}

String formatTime(double? time) {
  Duration duration = Duration(milliseconds: time!.round());
  return [duration.inHours, duration.inMinutes, duration.inSeconds]
      .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
      .join(':');
}
