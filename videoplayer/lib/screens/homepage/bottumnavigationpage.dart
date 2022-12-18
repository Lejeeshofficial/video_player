// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/getx/videocotroller.dart';
import 'package:videoplayer/screens/allvideospage/allvideosscreen.dart';
import 'package:videoplayer/screens/favpage/favscreen.dart';
import 'package:videoplayer/screens/homepage/homescreen.dart';
import 'package:videoplayer/screens/playlistpage/playlistpage.dart';
import 'package:videoplayer/screens/searchpage/searchpage.dart';

class BottomNavigationScreen extends StatelessWidget {
  final videocontroller = Get.put(VideoController());
  BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.home),
      const Icon(Icons.video_library_sharp),
      const Icon(Icons.favorite_border_outlined),
      const Icon(Icons.playlist_add_check_circle_outlined)
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Color(0xFF3366FF),
              // Color(0xFF00CCFF),
              Color(0xFF240E8B),
              Color(0xFF787FF6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
          ),
        ),
        child: Obx(
          () => CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 700),
            color: const Color(0xFFEFEFEF),
            backgroundColor: Colors.transparent,
            // buttonBackgroundColor: Colors.white,
            items: items,
            height: 55,

            index: videocontroller.TabIndex.value,
            onTap: ((value) => videocontroller.changeTabIndex(value)),
          ),
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: videocontroller.TabIndex.value,
          children: [
            ScreenHome(),
            ScreenAllvideos(),
            const FavScreen(),
            const ScreenPlaylist(),
            //const ScreenSearch()
          ],
        ),
      ),
    );
  }
}
