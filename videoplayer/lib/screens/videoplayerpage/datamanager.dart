import 'dart:async';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class DataManager {
  DataManager({required this.flickManager, required this.url});
  int currentPlaying = 0;
  final FlickManager flickManager;
  final List<String> url;

  late Timer videoChangeTimer;

  String getNextVideo() {
    currentPlaying++;
    return url[currentPlaying];
  }

  bool hasNextVideo() {
    return currentPlaying != url.length - 1;
  }

  bool hasPreviousVideo() {
    return currentPlaying != 0;
  }

  skipToNextVideo([Duration? duration]) {
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
