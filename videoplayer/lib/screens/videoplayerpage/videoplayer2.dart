import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:path/path.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer/Fetchingfies/load_folder_video.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/screens/recently/recentlistfun.dart';
import 'package:videoplayer/screens/videoplayerpage/datamanager.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayercontrols.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AssetPlayerWidget2 extends StatefulWidget {
  AssetPlayerWidget2({
    Key? key,
    required this.list,
    required this.index,
    required this.urlpassed,
  }) : super(key: key);
  int index;
  var list;
  dynamic urlpassed;

  @override
  State<AssetPlayerWidget2> createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget2> {
  //List<String> url = filteredFolderVideos.value;
  late FlickManager
      flickManager; //------------------>this is the instance of the FlickManager video player package
  late DataManager dataManager;

  @override
  void initState() {
    super.initState();
    int index = widget.index;
    String videopath = widget.urlpassed;
    List<String> urls = widget.list;
    RecentListModel obj = RecentListModel(recentPath: videopath);
    getRecentStatus(path: videopath);
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.file(
          File(
              videopath), //---------------1--------->flickManager got that path of that video various with index
        ),
        onVideoEnd: () {
          dataManager.skipToNextVideo(Duration(seconds: 5));
        });

    dataManager = DataManager(flickManager: flickManager, url: urls);
  }

  @override
  void dispose() {
    flickManager.dispose();

    super.dispose();
  }

  skipToVideo(String url) {
    flickManager.handleChangeVideo(VideoPlayerController.file(File(url)));
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          flickManager.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager?.autoResume();
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: FlickVideoPlayer(
              flickManager: flickManager,
              preferredDeviceOrientationFullscreen: const [
                // DeviceOrientation.portraitUp,
                DeviceOrientation.landscapeLeft,

                //  DeviceOrientation.landscapeRight,
              ],
              flickVideoWithControls: FlickVideoWithControls(
                //  videoFit: BoxFit.cover,
                controls: VideoPlayerWidget(dataManager: dataManager),
              ),
              flickVideoWithControlsFullscreen: FlickVideoWithControls(
                // videoFit: BoxFit.cover,
                controls: VideoPlayerWidget(dataManager: dataManager),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
