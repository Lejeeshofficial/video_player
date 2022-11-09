import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/hivethumbnail.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';
import 'package:videoplayer/screens/favpage/favpopupmenu.dart';
import 'package:videoplayer/screens/favpage/widgets.dart';
import 'package:videoplayer/screens/homepage/bottumnavigationpage.dart';
import 'package:videoplayer/screens/homepage/thumbnail.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

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
        // backgroundColor:const Color(0xFF6E012A),
        // leading:const Icon(Icons.ondemand_video_outlined,size: 10,),
        title: Row(
          children: [
            // const SizedBox(
            //   width: 120,
            // ),
            Text(
              'Favourites',
              style: GoogleFonts.podkova(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.favorite_border_outlined,
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
                  builder: (context) => BottomNavigationScreen(),
                ),
              );
            },
            iconSize: 30,
            icon: const Icon(Icons.add_circle_outline_rounded),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        // centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                GradientText(
                  'My Favourites..',
                  style: GoogleFonts.podkova(
                      fontSize: 20, fontWeight: FontWeight.w700),
                  colors: const [
                    Color(0xFF240E8B),
                    Color(0xFF787FF6),
                  ],
                ),

                //----------------listview--------------//
                Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: favvideoDB
                          .listenable(), //importing package ' package:hive_flutter/hive_flutter.dart'
                      builder: (context, videolist, child) {
                        return videolist.isEmpty
                            ? Center(
                                child: Text(
                                'No Videos',
                                style: GoogleFonts.podkova(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ))
                            : ListView.builder(
                                itemCount: videolist.values.length,
                                itemBuilder: ((context, index) {
                                  FavVideoModel? videovariable =
                                      favvideoDB.getAt(index);
                                  return InkWell(
                                    onTap: () {
                                      List<String> result;
                                      result =
                                          getList(videolist.values.toList());
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AssetPlayerWidget(
                                                  index: index,
                                                  urlpassed: result),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 0),
                                      child: ListTile(
                                        leading: Container(
                                          width: 120,
                                          height:
                                              120, //---------------------->70
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: FutureBuilder(
                                            future: getThumbnail(
                                              videovariable!.favVideoPath
                                                  .toString(),
                                            ),
                                            builder: (context, snapshot) =>
                                                snapshot.hasData
                                                    ? Stack(
                                                        children: [
                                                          Container(
                                                            width: 120,
                                                            height:
                                                                100, //-------------------->80
                                                            child: Image.file(
                                                              File(snapshot
                                                                  .data!),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          const Positioned(
                                                              child: Center(
                                                            child: Icon(
                                                              Icons
                                                                  .play_circle_outline,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ))
                                                        ],
                                                      )
                                                    : Container(
                                                        width: 120,
                                                        height:
                                                            120, //--------------------->80
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image:
                                                              const DecorationImage(
                                                                  image:
                                                                      AssetImage(
                                                                    'lib/assets/play button.jpg',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover),
                                                        ),
                                                      ),
                                          ),
                                        ),
                                        title: Text(
                                          videovariable.favVideoPath
                                              .toString()
                                              .split('/')
                                              .last,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.podkova(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue[900],
                                          ),
                                        ),
                                        trailing: favpopupmenu(index: index),
                                      ),
                                    ),
                                  );
                                }),
                              );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
