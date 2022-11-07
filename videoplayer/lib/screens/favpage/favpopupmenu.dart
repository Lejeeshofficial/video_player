import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';

favpopupmenu({required index}) {
  return PopupMenuButton(
    icon: const Icon(
      Icons.more_vert_outlined,
      color: Colors.deepPurple,
    ),
    iconSize: 23,
    itemBuilder: (context) => [
      PopupMenuItem(
        onTap: () async {
          await Future.delayed(
            Duration(seconds: 0),
          );
          DialogBoxremove(context, index);

          //
        },
        child: Row(
          children: [
            Text(
              'Remove',
              style: GoogleFonts.podkova(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.purple[900],
              ),
            ),
            const SizedBox(
              width: 20,
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
