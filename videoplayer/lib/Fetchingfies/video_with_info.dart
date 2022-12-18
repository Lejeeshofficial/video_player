import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import '../../main.dart';
import 'fetch_video_data.dart';

final videoInfo =
    FlutterVideoInfo(); // BY using "FlutterVideoInfo" package we get the all information of video
ValueNotifier<List<VideoData>> fetchedVideosWithInfo =
    ValueNotifier([]); //videos with info

Future getVideoWithInfo() async {
  // videoDB.clear();
  List<VideoplayerModel> modelList =
      []; //it is a another list to store Bellow details..
  VideoplayerModel videoObj;
  // fetchedVideosWithInfo.value.clear();
  for (int i = 0; i < fetchedVideosPath.length; i++) {
    //"fetchedvideospath" it is the main path
    var info = await videoInfo.getVideoInfo(fetchedVideosPath[
        i]); //BY using "Videoinfo" we collect the all fetchedVideopath and stored in "info"
    videoObj = VideoplayerModel(
        //"videoObj" is the object of our "VidoeplayerModel" class
        videoPath: '${info!.path}',
        videoName: '${info.title}',
        folderPath: '',
        thumbnail: '',
        isFav: false);
    modelList.add(videoObj); //Here we stores
    fetchedVideosWithInfo.value
        .add(info); //this is "listener" and here we add the values

  }
  fetchedVideosWithInfo.notifyListeners();
  //------------adding data to database------------------------------//
  videoDB.addAll(modelList);
}
