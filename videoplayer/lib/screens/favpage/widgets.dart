import 'dart:developer';

import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';

bool boolfav = false;

getList(List<FavVideoModel> objList) {
  List<String> videoPath = [];
  for (FavVideoModel obj in objList) {
    videoPath.add(obj.favVideoPath);
  }
  return videoPath;
}

getfavStatus({required path}) {
  List<FavVideoModel> favList = favvideoDB.values.toList();

  List<FavVideoModel> result =
      favList.where((checking) => checking.favVideoPath == path).toList();

  if (result.isEmpty) {
    var favobj = FavVideoModel(favVideoPath: path);
    favvideoDB.add(favobj);
    //log(result.toString());
  } else {
    boolfav = true;
  }
}
