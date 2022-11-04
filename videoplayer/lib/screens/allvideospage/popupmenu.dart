import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';

Widget popupmenu(BuildContext context) {
  return PopupMenuButton(
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
