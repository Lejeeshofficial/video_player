import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';
import 'package:videoplayer/screens/playlistpage/deleteplaylist.dart';

void popupmenuremove(BuildContext context, index) {
  PopupMenuButton(
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
          DialogBoxremove(context, index);
        },
        child: Row(
          children: [
            Text(
              'Remove',
              style: GoogleFonts.podkova(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.purple[900],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.delete,
              size: 20,
              color: Colors.purple[900],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget popupmenueditandremove(BuildContext context) {
  return PopupMenuButton(
    icon: const Icon(
      Icons.more_vert_outlined,
      color: Colors.deepPurple,
    ),
    iconSize: 23,
    itemBuilder: ((context) => [
          PopupMenuItem(
            onTap: (() async {
              await Future.delayed(const Duration(seconds: 0));
            }),
            value: 1,
            // child: InkWell(
            //   onTap: () {
            //     setState(() {
            //       ScreenHome1();
            //     });
            //   },
            child: Row(
              children: [
                const Icon(
                  Icons.edit_outlined,
                  size: 18,
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  width: 08,
                ),
                Text(
                  'Edit',
                  style: GoogleFonts.podkova(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepPurple),
                )
              ],
            ),
            // ),
          ),
          PopupMenuItem(
            onTap: () async {
              final navigator = Navigator.of(context);
              await Future.delayed(
                Duration(seconds: 0),
              );
              DialogBoxDelete(context);
            },
            value: 1,
            child: Row(
              children: [
                const Icon(
                  Icons.delete,
                  size: 18,
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Delete',
                  style: GoogleFonts.podkova(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepPurple),
                ),
              ],
            ),
          ),
        ]),
    color: Colors.grey[100],
    offset: Offset(-21, 19),
    // elevation: 200,
  );
}
