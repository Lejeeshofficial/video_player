import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer/Fetchingfies/load_folder_video.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayerwidgets.dart';

class AssetPlayerWidget extends StatefulWidget {
  AssetPlayerWidget({Key? key, required this.index, required this.url})
      : super(key: key);
  int index;

  String url;


  @override
  State<AssetPlayerWidget> createState() => _AssetPlayerWidgetState();
}


class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  VideoPlayerController? controller;
  
 List<String> url = filteredFolderVideos.value;

  @override
  void initState() {
     
    super.initState();
    controller = VideoPlayerController.file(File(url[widget.index]))
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => controller!.play());
  }

  @override
  void dispose() {
    controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF240E8B),
                Color(0xFF787FF6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.1, 1],
            ),
          ),
        ),
        title: Row(
          children: [
            // const SizedBox(
            //   width: 80,
            // ),
            Text(
              'Videos',
              style: GoogleFonts.podkova(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 0,
          ),
          VideoPlayerWidget(controller: controller!),
        ],
      ),
    );
  }
}
