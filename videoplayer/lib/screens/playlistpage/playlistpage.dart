import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/allvideosscreen.dart';
import 'package:videoplayer/screens/allvideospage/popupmenu.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';
import 'package:videoplayer/screens/homepage/bottumnavigationpage.dart';
import 'package:videoplayer/screens/playlistpage/deleteplaylist.dart';
import 'package:videoplayer/screens/playlistpage/partymixfav.dart';
import 'package:videoplayer/screens/playlistpage/playlistvideoslist.dart';
import 'package:videoplayer/screens/playlistpage/popupremove.dart';
import 'package:videoplayer/screens/playlistpage/weekendfav.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';

class ScreenPlaylist extends StatelessWidget {
  const ScreenPlaylist({super.key});

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
            //  const SizedBox(
            //   width: 125,
            // ),
            Text(
              'Playlists',
              style: GoogleFonts.podkova(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.playlist_add_check_circle_outlined,
              size: 25,
              color: Colors.white,
            )
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreenAllvideos(),
                ),
              );
            },
            icon: const Icon(Icons.add_circle_outline_rounded),
            iconSize: 30,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        // centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: playlistnameDB.listenable(),
        builder: (context, value, child) {
          return playlistnameDB.isEmpty
              ? Center(
                  child: Text(
                    'No Playlist created',
                    style: GoogleFonts.podkova(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              : Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: playlistnameDB.values.length,
                      itemBuilder: (context, index) {
                        PlaylistNameModel? playlistobjname =
                            playlistnameDB.getAt(index);
                        return Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GradientText(
                                    playlistobjname!.addPlaylist,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.podkova(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                    colors: const [
                                      Color(0xFF240E8B),
                                      Color(0xFF787FF6),
                                    ],
                                  ),

                                  popupmenueditandremove(context,
                                      index), //-------------->edit and remove playlist
                                ],
                              ),

                              ///------------------------line 2---------------///

                              Row(
                                children: [
                                  for (int i = 0; i <= 73; i++)
                                    i.isEven
                                        ? Container(
                                            width: 5,
                                            height: 2,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                          )
                                        : Container(
                                            width: 5,
                                            height: 2,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                          ),
                                ],
                              ),

                              ///-----------------------line 2 close---------------------////

                              const SizedBox(
                                height: 05,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 290,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      playlistvideoDB.clear();
                                    },
                                    child: GradientText(
                                      'Clear All',
                                      style: GoogleFonts.podkova(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                      colors: const [
                                        Color(0xFF240E8B),
                                        Color(0xFF787FF6),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 05,
                              ),
                              playlistvideos(
                                  playlistpath: playlistobjname.addPlaylist),

                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  for (int i = 0; i <= 73; i++)
                                    Container(
                                      width: 5,
                                      height: 2,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}
