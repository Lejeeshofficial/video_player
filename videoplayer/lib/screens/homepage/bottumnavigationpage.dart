import 'package:flutter/material.dart';
import 'package:videoplayer/screens/allvideospage/allvideosscreen.dart';
import 'package:videoplayer/screens/favpage/favscreen.dart';
import 'package:videoplayer/screens/playlistpage/playlistpage.dart';
import 'package:videoplayer/screens/searchpage/searchpage.dart';
 
 
class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentselectedindex = 0;

  List pages = [
    ScreenAllvideos(), FavScreen(), ScreenPlaylist(), ScreenSearch()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
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
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.white,
          currentIndex: currentselectedindex,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentselectedindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_library,
                  // color: Colors.white,
                ),
                label: 'Videos'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  // color: Colors.white,
                ),
                label: 'Favourites'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.playlist_add_check_circle_outlined,
                  // color: Colors.white,
                ),
                label: 'Playlist'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                  //color: Colors.white,
                ),
                label: 'Search'),
          ],
        ),
      ),
      body: pages[currentselectedindex],
    );
  }
}
