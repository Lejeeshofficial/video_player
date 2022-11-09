import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';
import 'package:videoplayer/screens/favpage/widgets.dart';

import '../favpage/favscreen.dart';

Widget PopupmenuBotton2({required context, required path}) {
  return PopupMenuButton(
    icon: const Icon(
      Icons.more_vert_outlined,
      color: Colors.white,
    ),
    onSelected: (value) {
      if (value == 'fav') {
        getfavStatus(path: Path);
        favVideoSanckbar(context);
      }
      if (value == 'playlist') {
        playlistbottomsheet(context, path);
      }
    },
    itemBuilder: ((context) => [
              PopupMenuItem(
                // onTap: () async {
                //   final navigator = Navigator.of(context);
                //   await Future.delayed(Duration(seconds: 0));
                //   navigator.push(
                //     MaterialPageRoute(
                //       builder: (context) => FavScreen(),
                //     ),
                //   );
                //   favVideoSanckbar(context);
                // },
                value: 'fav',
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_border_outlined,
                      size: 18,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Add To Favourites',
                      style: GoogleFonts.podkova(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepPurple),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                // onTap: (() async {
                //   final navigator = Navigator.of(context);
                //   await Future.delayed(
                //     Duration(seconds: 0),
                //   );
                //   playlistbottomsheet(context);
                // }),
                value: 'playlist',
                child: Row(
                  children: [
                    const Icon(
                      Icons.playlist_add_check_circle_outlined,
                      size: 18,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Add To Playlist',
                      style: GoogleFonts.podkova(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepPurple),
                    )
                  ],
                ),
              ),
            ]
        // ),

        ),
    color: Colors.grey[50],
    offset: Offset(-0, 0),
  );
}
