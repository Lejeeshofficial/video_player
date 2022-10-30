//import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'fetch_video_data.dart';

ValueNotifier<List<String>> fetchedFolders = ValueNotifier([]); //folder list
List<String> temp = []; //temp directory for folder funcion

Future loadFolderList() async {
  fetchedFolders.value.clear();
  for (String path in fetchedVideosPath) {
    temp.add(path.substring(
        0,
        path.lastIndexOf(
            '/'))); // ---------->here that "subString " is used to dived that full string
    //from "0 th " index and last indext which is equal to "/"..so we get that name of that vides
  }
  fetchedFolders.value = temp.toSet().toList();
  // .toSet()
  // .toList(); //-----> here "toSet()" is used to avoid the repeating values and "tolist()" is used to list that output.
  log('888888888   $fetchedFolders');//-->here we get only 3 type of folder bcz repeatation is not possible due to "toSet()"
}
