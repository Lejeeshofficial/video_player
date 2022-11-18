import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/sortfunctions.dart';
import 'package:videoplayer/screens/allvideospage/popupmenu.dart';
import 'package:videoplayer/screens/homepage/thumbnail.dart';
import 'package:videoplayer/screens/playlistpage/partymixfav.dart';
import 'package:videoplayer/screens/recently/recentlistfun.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';

Widget recentlypart(context) {
  return Container(
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
                'Recently Played (${recentlistDB.length})',
                style: GoogleFonts.podkova(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .35,
            ),
            InkWell(
              onTap: () {
                // popupmenurecentlistalldelte(context);
                recentlistDB.clear();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'Clear All',
                  style: GoogleFonts.podkova(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: ValueListenableBuilder(
            valueListenable: recentlistDB.listenable(),
            builder: (context, value, child) {
              return Container(
                height: MediaQuery.of(context).size.height * .21,
                child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: recentlistDB.length,
                    itemBuilder: (context, index) {
                      RecentListModel? obj = recentlistDB.getAt(index);
                      List<String> list1 = getListrecent();
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: (() {
                                      List<String> list = getListrecent();

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AssetPlayerWidget(
                                                  index: index,
                                                  urlpassed: list),
                                        ),
                                      );
                                    }),
                                    child: FutureBuilder(
                                      future: getThumbnail(obj!.recentPath),
                                      builder: (context, snapshot) => snapshot
                                              .hasData
                                          ? SizedBox(
                                              width: 300,
                                              height: 170,
                                              child: Image.file(
                                                File(snapshot.data!),
                                                fit: BoxFit.cover,
                                              ))
                                          : Container(
                                              width: 300,
                                              height: 170,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'lib/assets/play button.jpg'),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Text(
                                      obj.recentPath.split('/').last,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.podkova(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // Positioned(
                                  //   bottom: 5,
                                  //   right: 5,
                                  //   child: Text(
                                  //     //formatTime(),
                                  //     style: GoogleFonts.podkova(
                                  //       fontSize: 14,
                                  //       fontWeight: FontWeight.w500,
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: popupmenurecentlist(
                                        context, index), // popup menu button
                                  ),
                                  Container(
                                    child: Positioned(
                                      width: 300,
                                      height: 170,
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.play_circle_outline),
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
              );
            },
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
  );
}
