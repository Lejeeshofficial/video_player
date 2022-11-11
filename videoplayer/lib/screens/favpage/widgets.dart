import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';

bool boolfav = false;

getList(List<FavVideoModel> objList) {
  List<String> videoPath = [];
  for (FavVideoModel obj in objList) {
    videoPath.add(obj.favVideoPath);
  }
  return videoPath;
}

// getfavStatus({required path}) {
//   List<FavVideoModel> favList = favvideoDB.values.toList();

//   List<FavVideoModel> result =
//       favList.where((checking) => checking.favVideoPath == path).toList();

//   if (result.isEmpty) {
//     var favobj = FavVideoModel(favVideoPath: path);
//     favvideoDB.add(favobj);
//   } else {
//     boolfav = true;
//   }
// }

Widget getfavStatusname({required path, required context, required indexee}) {
  List<FavVideoModel> favList = favvideoDB.values.toList();
  List<VideoplayerModel> allsongs = videoDB.values.toList();

  List<FavVideoModel> result =
      favList.where((checking) => checking.favVideoPath == path).toList();

  if (result.isEmpty) {
    var favobj = FavVideoModel(favVideoPath: path);
    // favvideoDB.add(favobj);
    return InkWell(
      onTap: () {
        favvideoDB.add(favobj);
        favVideoSanckbar(context);
        Navigator.pop(context);
      },
      child: Text(
        'Add To Favourites',
        style: GoogleFonts.podkova(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple),
      ),
    );
  } else {
    return InkWell(
      onTap: () async {
        if (favvideoDB.length < 1) {
          favvideoDB.clear();
          //setstate((){});
        } else {
          int currentindex = favList.indexWhere(
              (element) => element.favVideoPath == allsongs[indexee].videoPath);
          //  await favvideoDB.deleteAt(currentindex);
          DialogBoxremove(context, currentindex);
        }

        // DialogBoxremove(context, index);
      },
      child: Text(
        'Remove From Favourites',
        style: GoogleFonts.podkova(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple),
      ),
    );
  }
}
