import 'package:flutter/cupertino.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';

bool boolrec = false;
getRecentStatus({required String path}) {
  List<RecentListModel> recList = recentlistDB.values.toList();
  Iterable<RecentListModel> list =
      recList.where((element) => element.recentPath == path);

  if (list.isEmpty) {
    var recobj = RecentListModel(recentPath: path);
    recentlistDB.add(recobj);
  } else {
    boolrec = true;
  }
}

getListrecent() {
  List<RecentListModel> objList = recentlistDB.values.toList();
  List<String> videopath = [];
  for (RecentListModel obj in objList) {
    videopath.add(obj.recentPath);
  }
  return videopath;
}
