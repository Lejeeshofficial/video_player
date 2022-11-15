import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/popupmenu.dart';
import 'package:videoplayer/screens/homepage/thumbnail.dart';

Widget playlistvideos({required playlistpath}) {
  return ValueListenableBuilder(
    valueListenable: playlistvideoDB.listenable(),
    builder: (context, playlistvideo, child) {
      return Container(
        height: 122,
        child: ListView.builder(
          itemCount: playlistvideo.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            PlaylistVideoModel? playlistobjvideos =
                playlistvideoDB.getAt(index);
            if (playlistobjvideos?.playlistfolderName.toString() ==
                playlistpath) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(width: 10,),
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: FutureBuilder(
                                future: getThumbnail(playlistobjvideos!
                                    .playlistvideoPath
                                    .toString()),
                                builder: (context, snapshot) => snapshot.hasData
                                    ? SizedBox(
                                        width: 160,
                                        height: 90,
                                        child: Image.file(
                                          File(snapshot.data!),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Container(
                                        width: 160,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/play button.jpg'),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            Positioned(
                              left: 120,
                              top: 0,
                              child:
                                  popupmenu(context, index), //----->remove icon
                            ),
                            Positioned(
                              left: 55,
                              top: 28,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.play_circle_outline),
                                iconSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            //------------>here doubt is there that "playlistvideopath or name"
                            playlistobjvideos.playlistvideoPath
                                .toString()
                                .split('/')
                                .last,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.podkova(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          '22:25',
                          style: GoogleFonts.podkova(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      );
    },
  );
}
