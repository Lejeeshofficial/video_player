import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer/screens/videoplayerwidgets.dart';

class AssetPlayerWidget extends StatefulWidget {
  const AssetPlayerWidget({super.key});

  @override
  State<AssetPlayerWidget> createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  VideoPlayerController? controller;
  final dataSource = 'lib/assets/video1.mp4';

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(dataSource)
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
      body:Column(
        children: [
          SizedBox(height: 0,),
          VideoPlayerWidget(controller: controller!),
        ],
      ) ,
    );
    
  }
}
