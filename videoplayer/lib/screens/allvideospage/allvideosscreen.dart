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
import 'package:videoplayer/screens/allvideospage/hivethumbnail.dart';
import 'package:videoplayer/screens/allvideospage/popupmenu.dart';
import 'package:videoplayer/screens/allvideospage/popupmenu2.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';
import 'package:videoplayer/screens/favpage/favscreen.dart';
import 'package:videoplayer/screens/homepage/settingscreen.dart';
import 'package:videoplayer/screens/homepage/thumbnail.dart';
import 'package:videoplayer/screens/playlistpage/partymixfav.dart';
import 'package:videoplayer/screens/playlistpage/playlistpage.dart';
import 'package:videoplayer/screens/recently/recently.dart';
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
                recentlistDB.isEmpty
                    ? SizedBox()
                    : recentlypart(
                        context), //---------------calling recently tabs

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
                                  log(">>>>>prayag>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${videolist.values.length}");
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
                                                          future: getHiveThumbnail(
                                                              videovariable!,
                                                              index), //------------->hivethumbnail calling
                                                          // future: getThumbnail(
                                                          //     videovariable!
                                                          //         .videoPath),
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
                                                    path:
                                                        videovariable.videoPath,
                                                    index: index,
                                                  ), // second popup menu botton to add fav and playlist
                                                ),
                                              ],
                                            ),
                                            Text(
                                              videovariable.videoName
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
