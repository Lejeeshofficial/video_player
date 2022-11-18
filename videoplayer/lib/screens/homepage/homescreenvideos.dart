import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:videoplayer/Fetchingfies/load_folder_video.dart';
import 'package:videoplayer/screens/allvideospage/sortfunctions.dart';
import 'package:videoplayer/screens/allvideospage/popupmenu.dart';
import 'package:videoplayer/screens/allvideospage/popupmenu2.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';
import 'package:videoplayer/screens/favpage/favpopupmenu.dart';
import 'package:videoplayer/screens/favpage/favscreen.dart';
import 'package:videoplayer/screens/homepage/popupmenu3.dart';
import 'package:videoplayer/screens/homepage/popupmenuhome.dart';
import 'package:videoplayer/screens/homepage/thumbnail.dart';
import 'package:videoplayer/screens/playlistpage/playlistpage.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';

class ScreenFolderVideos extends StatefulWidget {
  ScreenFolderVideos({Key? key, required this.index, required this.folderPath})
      : super(key: key);
  var folderPath;

  int index;

  @override
  State<ScreenFolderVideos> createState() => _ScreenFolderVideosState();
}

class _ScreenFolderVideosState extends State<ScreenFolderVideos> {
  @override
  void initState() {
    getFolderVideos(widget.folderPath);
    // TODO: implement initState
    super.initState();
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
        title: Text(
          'All Videos',
          style: GoogleFonts.podkova(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///------------------listview builder----------------//
            ValueListenableBuilder(
              valueListenable:
                  filteredFolderVideos, //all videos listed in this value notifier
              builder: (context, value1, child) {
                return value1.isEmpty
                    ? Center(
                        child: Text(
                          'No videos..',
                          style: GoogleFonts.podkova(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 22),
                        ),
                      )
                    //-----------------------videos listing -------------------------------------------------------------//
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return Row(
                            children: [
                              for (int i = 0; i <= 75; i++)
                                i.isEven
                                    ? Container(
                                        width: 5,
                                        height: 2,
                                        color: Colors.blue[900],
                                      )
                                    : Container(
                                        width: 5,
                                        height: 2,
                                        color: Colors.white,
                                      ),
                            ],
                          );
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: value1.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AssetPlayerWidget(
                                      index: index,
                                      urlpassed: value1,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    10), //-------------------------------..
                                              ),
                                              child: FutureBuilder(
                                                future:
                                                    getThumbnail(value1[index]),
                                                builder: (context,
                                                        AsyncSnapshot<String?>
                                                            snapshot) =>
                                                    snapshot.hasData
                                                        ? Container(
                                                            width: 100,
                                                            height: 70,
                                                            child: Image.file(
                                                              File(snapshot
                                                                  .data!),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )
                                                        : Container(
                                                            width: 100,
                                                            height: 70,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              image: const DecorationImage(
                                                                  image: AssetImage(
                                                                      'lib/assets/play button.jpg'),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            ),
                                                          ),
                                              ),
                                            ),
                                            const Positioned(
                                              left: 40,
                                              top: 25,
                                              child: Icon(
                                                Icons.play_circle_outline,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .5,
                                              child: Text(
                                                value1[index]
                                                    .toString()
                                                    .split('/')
                                                    .last,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.podkova(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue[900],
                                                ),
                                              ),
                                            ),
                                            //  Positioned(
                                            //       right: 5,
                                            //       bottom: 5,
                                            //       child: Text(
                                            //         formatTime(videolist[index].Duration
                                            //             ),
                                            //         style: const TextStyle(
                                            //             fontSize: 15,
                                            //             fontWeight:
                                            //                 FontWeight.bold,
                                            //             color: Colors.white),
                                            //       ), // second popup menu botton to add fav and playlist
                                            //     ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child:
                                              // PopupmenuBotton2(
                                              //   context: context,
                                              //   path: value1[index],
                                              //   index: index,
                                              // ),
                                              PopupmenuBottonhome(
                                                  context: context,
                                                  path: value1[index],
                                                  index: index),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
