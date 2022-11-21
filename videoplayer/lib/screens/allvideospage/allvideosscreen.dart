import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:simple_gradient_text/simple_graart';
import 'package:videoplayer/Fetchingfies/fetch_video_data.dart';
import 'package:videoplayer/Fetchingfies/video_with_info.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/dropdowndummi.dart';
import 'package:videoplayer/screens/allvideospage/sortfunctions.dart';
import 'package:videoplayer/screens/allvideospage/hivethumbnail.dart';
import 'package:videoplayer/screens/allvideospage/popupmenu.dart';
import 'package:videoplayer/screens/allvideospage/popupmenu2.dart';
import 'package:videoplayer/screens/homepage/thumbnail.dart';
import 'package:videoplayer/screens/recently/recentfile.dart';
import 'package:videoplayer/screens/recently/recently.dart';
import 'package:videoplayer/screens/searchpage/searchdeligate.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer2.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer3lastoption.dart';

class ScreenAllvideos extends StatefulWidget {
  const ScreenAllvideos({super.key});

  @override
  State<ScreenAllvideos> createState() => _ScreenAllvideos();
}

class _ScreenAllvideos extends State<ScreenAllvideos> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      // recentlistDB.isEmpty ? SizedBox() : recentlypart(context);
      recentlistDB.isEmpty ? SizedBox() : Recentfile();
    });

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          // child: SizedBox(width: 10,),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF240E8B),
                  Color(0xFF787FF6),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.1, 1.0]),
          ),
        ),
        title: Text(
          'videos',
          style: GoogleFonts.podkova(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        actions: [
          SizedBox(child: SortDropdown()),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchVideos());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //---------------calling recently tabs
                // recentlistDB.isEmpty ? SizedBox() : recentlypart(context),
                recentlistDB.isEmpty ? SizedBox() : Recentfile(),

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                      child: Container(
                        width: 150,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Color(0xFF787FF6),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'All Videos  ',
                            style: GoogleFonts.podkova(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                //  -----------------------------next-------------------///
                Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable:
                          fetchedVideosWithInfo, //---->database listener
                      builder: (context, List<dynamic> videolist, child) {
                        return videolist.isEmpty
                            ? const Text('NO Videos')
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 4 / 3,
                                ),
                                itemCount: videolist.length, //----->video count
                                itemBuilder: ((context, index) {
                                  log(">>>>>===>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${videolist.length}");
                                  // VideoplayerModel? videovariable =
                                  //     videoDB.getAt(index);
                                  return GridTile(
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                GestureDetector(
                                                  onTap: (() {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            // VideoPlay(
                                                            //     videoLink:
                                                            //         videolist[
                                                            //                 index]
                                                            //             .path)
                                                            AssetPlayerWidget2(
                                                          index: index,
                                                          list:
                                                              fetchedVideosPath,
                                                          urlpassed:
                                                              videolist[index]
                                                                  .path,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: 160,
                                                        height: 110,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                        child: FutureBuilder(
                                                          future:
                                                              // getHiveThumbnail(
                                                              //     videolist[
                                                              //             index]
                                                              //         .path!,
                                                              //     index),
                                                              // getThumbnail(
                                                              //     videolist[
                                                              //             index]
                                                              //         .toString()),
                                                              // getHiveThumbnail(
                                                              //     videovariable!,
                                                              //     index), //------------->hivethumbnail calling
                                                              // future:
                                                              getThumbnail(
                                                                  videolist[
                                                                          index]
                                                                      .path),
                                                          builder: ((context,
                                                              snapshot) {
                                                            return snapshot
                                                                    .hasData
                                                                ? Container(
                                                                    width: 100,
                                                                    height: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50), //20
                                                                    ),
                                                                    child: Image
                                                                        .file(
                                                                      File(snapshot
                                                                          .data!),
                                                                      // File(videovariable
                                                                      //     .thumbnail),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    width: 100,
                                                                    height: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      image: const DecorationImage(
                                                                          image: AssetImage(
                                                                              'lib/assets/play button.jpg'),
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  );
                                                          }),
                                                        ),
                                                      ),
                                                      const Positioned(
                                                        left: 65,
                                                        top: 40,
                                                        child: Icon(
                                                          Icons
                                                              .play_circle_outline,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  top: -5,
                                                  right: -10,
                                                  child: PopupmenuBotton2(
                                                    context: context,
                                                    // path: videovariable!
                                                    //     .videoPath,
                                                    path: videolist[index].path,
                                                    index: index,
                                                  ), // second popup menu botton to add fav and playlist
                                                ),
                                                Positioned(
                                                  right: 5,
                                                  bottom: 5,
                                                  child: Text(
                                                    formatTime(videolist[index]
                                                        .duration),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ), // second popup menu botton to add fav and playlist
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .45,
                                              child: Text(
                                                videolist[index]
                                                    .title
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.deepPurple),
                                              ),
                                            ),

                                            // Text(
                                            //   videovariable.videoName
                                            //       .toString(),
                                            //   overflow: TextOverflow.ellipsis,
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
