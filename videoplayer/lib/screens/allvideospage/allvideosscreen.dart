import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:simple_gradient_text/simple_graart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:videoplayer/Fetchingfies/fetch_video_data.dart';
import 'package:videoplayer/Fetchingfies/video_with_info.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/popup.dart';
import 'package:videoplayer/screens/favpage/favscreen.dart';
import 'package:videoplayer/screens/homepage/settingscreen.dart';
import 'package:videoplayer/screens/playlistpage/partymixfav.dart';
import 'package:videoplayer/screens/playlistpage/playlistpage.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';

class ScreenAllvideos extends StatefulWidget {
  const ScreenAllvideos({super.key});

  @override
  State<ScreenAllvideos> createState() => _ScreenAllvideos();
}

class _ScreenAllvideos extends State<ScreenAllvideos> {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: SafeArea(
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      shape: BoxShape.rectangle),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: GradientText(
                              colors: const [
                                Color(0xFF240E8B),
                                Color(0xFF787FF6),
                              ],
                              'Recently Played...',
                              style: GoogleFonts.podkova(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ),

                      ///-----------------------Recently viewed_---------------///

                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .94,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenPartyMix()),
                              );
                            },
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              size: 20,
                              color: Colors.purple[900],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .21,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            InkWell(
                                              onTap: (() {}),
                                              child: Container(
                                                width: 300,
                                                height: 170,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'lib/assets/party2.jpeg'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Text(
                                                'Prince and Queen',
                                                style: GoogleFonts.podkova(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 25,
                                              left: 10,
                                              child: Text(
                                                'Sam Joseph',
                                                style: GoogleFonts.podkova(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              top: 0,
                                              child: PopupMenuButton(
                                                icon: const Icon(
                                                  Icons.more_vert_outlined,
                                                  size: 23,
                                                  color: Colors.white,
                                                ),
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    onTap: () async {
                                                      await Future.delayed(
                                                        Duration(seconds: 0),
                                                      );
                                                      DialogBoxremove(context);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Remove',
                                                          style: GoogleFonts
                                                              .podkova(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18,
                                                            color: Colors
                                                                .purple[900],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Icon(
                                                          Icons.delete,
                                                          size: 20,
                                                          color: Colors
                                                              .purple[900],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Positioned(
                                                width: 300,
                                                height: 170,
                                                // left: 55,
                                                // top: 28,
                                                child: Center(
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons
                                                        .play_circle_outline),
                                                    iconSize: 30,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                        child: Row(
                          children: [
                            for (int i = 0; i <= 77; i++)
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
                      ),
                    ],
                  ),
                ),
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
                            'All Videos',
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

                //-----------------------------next-------------------///
                Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable:
                          videoDB.listenable(), //---->database listener
                      builder: (context, videolist, child) {
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
                                itemCount:
                                    videolist.values.length, //----->video count
                                itemBuilder: ((context, index) {
                                  log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${videolist.values.length}");
                                  VideoplayerModel? videovariable =
                                      videoDB.getAt(index);
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
                                                              AssetPlayerWidget(
                                                            index: index,
                                                            urlpassed:
                                                                fetchedVideosPath,
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                    child: Container(
                                                      width: 160,
                                                      height: 110,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: FutureBuilder(
                                                        future:
                                                            getHiveThumbnail(
                                                                videovariable!,
                                                                index),
                                                        builder: ((context,
                                                            snapshot) {
                                                          return snapshot
                                                                  .hasData
                                                              ? Container(
                                                                  width: 100,
                                                                  height: 70,
                                                                  child: Image
                                                                      .file(
                                                                    File(videovariable
                                                                        .thumbnail),
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
                                                                            10),
                                                                    image: const DecorationImage(
                                                                        image: AssetImage(
                                                                            'lib/assets/play button.jpg'),
                                                                        fit: BoxFit
                                                                            .cover),
                                                                  ),
                                                                );
                                                        }),
                                                      ),
                                                    )),
                                                Positioned(
                                                  top: 4,
                                                  left: 120,
                                                  child:

                                                      ///------------------pop up menu-------------///

                                                      PopupMenuButton(
                                                    icon: const Icon(
                                                      Icons.more_vert_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    itemBuilder: ((context) => [
                                                              PopupMenuItem(
                                                                onTap:
                                                                    () async {
                                                                  final navigator =
                                                                      Navigator.of(
                                                                          context);
                                                                  await Future.delayed(
                                                                      Duration(
                                                                          seconds:
                                                                              0));
                                                                  navigator
                                                                      .push(
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              FavScreen(),
                                                                    ),
                                                                  );
                                                                  favVideoSanckbar(
                                                                      context);
                                                                },
                                                                value: 0,
                                                                child: Row(
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .favorite_border_outlined,
                                                                      size: 18,
                                                                      color: Colors
                                                                          .deepPurple,
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Add To Favourites',
                                                                      style: GoogleFonts.podkova(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              Colors.deepPurple),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              PopupMenuItem(
                                                                onTap:
                                                                    (() async {
                                                                  final navigator =
                                                                      Navigator.of(
                                                                          context);
                                                                  await Future
                                                                      .delayed(
                                                                    Duration(
                                                                        seconds:
                                                                            0),
                                                                  );
                                                                  playlistbottomsheet(
                                                                      context);
                                                                }),
                                                                value: 1,
                                                                child: Row(
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .playlist_add_check_circle_outlined,
                                                                      size: 18,
                                                                      color: Colors
                                                                          .deepPurple,
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Add To Playlist',
                                                                      style: GoogleFonts.podkova(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              Colors.deepPurple),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ]
                                                        // ),

                                                        ),
                                                    color: Colors.grey[50],
                                                    offset: Offset(-0, 0),
                                                  ),

                                                  //---------------------------------------------/
                                                ),
                                              ],
                                            ),
                                            Text(
                                              videovariable!.videoName
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.podkova(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue[900]),
                                            ),
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
                // ),

                ///-------------------////-------------------------------------//
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getHiveThumbnail(VideoplayerModel video, int index) async {
    if (video.thumbnail.isNotEmpty) {
      return '';
    } else {
      final fileName = await VideoThumbnail.thumbnailFile(
        video: video.videoPath.toString(),
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
        quality: 100,
      );
      video.thumbnail = fileName.toString();
      videoDB.putAt(index, video);
      return fileName!;
    }
  }
}
