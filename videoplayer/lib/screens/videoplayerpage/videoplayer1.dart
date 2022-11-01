import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:path/path.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer/Fetchingfies/load_folder_video.dart';
import 'package:videoplayer/screens/videoplayerpage/datamanager.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayercontrols.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AssetPlayerWidget extends StatefulWidget {
  AssetPlayerWidget({Key? key, required this.index, required this.urlpassed})
      : super(key: key);
  int index;

  String urlpassed;

  @override
  State<AssetPlayerWidget> createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  List<String> url = filteredFolderVideos.value;
  late FlickManager
      flickManager; //------------------>this is the instance of the FlickManager video player package
  late DataManager dataManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.file(
          File(url[widget
              .index]), //------------------------>flickManager got that path of that video various with index
        ),
        onVideoEnd: () {
          dataManager.skipToNextVideo(Duration(seconds: 5));
        });

    dataManager = DataManager(flickManager: flickManager, url: url);
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
    return
        // appBar: AppBar(
        //   flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [
        //           Color(0xFF240E8B),
        //           Color(0xFF787FF6),
        //         ],
        //         begin: Alignment.topLeft,
        //         end: Alignment.topRight,
        //         stops: [0.1, 1],
        //       ),
        //     ),
        //   ),
        //   title: Row(
        //     children: [
        //       // const SizedBox(
        //       //   width: 80,
        //       // ),
        //       Text(
        //         'Videos',
        //         style: GoogleFonts.podkova(
        //             color: Colors.white,
        //             fontSize: 20,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ],
        //   ),
        // ),
        VisibilityDetector(
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
