import 'package:flutter/material.dart';
import 'fetch_video_data.dart';

ValueNotifier<List<String>> filteredFolderVideos =
    ValueNotifier([]); //----------------->each folder videos listed

getFolderVideos(String path) {
  filteredFolderVideos.value.clear();
  List<String> matchedVideoPath = [];

  List<String> splittedMatchedVideoPath = [];

  var splitted = path.split('/');

  for (String eachpath in fetchedVideosPath) {//"fetchedvideospath " contains all paths that fetched from that native
                                              //kotline code and here we seperate them base d the "path" of the foldre list
    if (eachpath.startsWith(path)) {
      matchedVideoPath.add(eachpath);
    }
  }

  for (String newPath in matchedVideoPath) {
    splittedMatchedVideoPath = newPath.split('/');
    if (splittedMatchedVideoPath[splitted.length].endsWith('.mp4') ||
        splittedMatchedVideoPath[splitted.length].endsWith('.mkv')) {
      filteredFolderVideos.value.add(newPath);
    }
  }

  // notify listeners if needed\
}
