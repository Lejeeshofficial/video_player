import 'dart:async';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class DataManager {
  DataManager({required this.flickManager, required this.url});
  int currentPlaying = 0;
  final FlickManager flickManager;
  //final List<String> url;
  final List<String> url;
  late Timer videoChangeTimer;

  String getNextVideo() {
    //------>plays next video
    currentPlaying++;
    return url[currentPlaying];
  }

  bool hasNextVideo() {
    //------------>checks the next video is there or not
    return currentPlaying != url.length - 1;
  }

  bool hasPreviousVideo() {
    //------->checks the previous video is there or not
    return currentPlaying != 0;
  }

  skipToNextVideo([Duration? duration]) {
    //-------->skip to next video
    if (hasNextVideo()) {
      flickManager.handleChangeVideo(
          VideoPlayerController.network(url[currentPlaying + 1]),
          videoChangeDuration: duration);

      currentPlaying++;
    }
  }

  skipTopreviousVideo() {
    if (hasPreviousVideo()) {
      currentPlaying--;
      flickManager.handleChangeVideo(
          VideoPlayerController.network(url[currentPlaying]));
    }
  }

  cancelVideoPlayingTimer({required bool playNext}) {
    if (playNext != true) {
      currentPlaying--;
    }
    flickManager.flickVideoManager
        ?.cancelVideoAutoPlayTimer(playNext: playNext);
  }
}
