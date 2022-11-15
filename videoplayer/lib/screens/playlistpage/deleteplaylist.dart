import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';

void DialogBoxDelete(BuildContext context, index) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      title: Text(
        'Delete ?',
        style: GoogleFonts.podkova(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.purple[900],
        ),
      ),
      content: Text(
        'Are you sure !!',
        style: GoogleFonts.podkova(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.purple[900],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'No',
            style: GoogleFonts.podkova(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.purple[900],
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            //  playlistvideoDB.clear();
            playlistnameDB.deleteAt(index);

            snackBarremove(context);
          },
          child: Text(
            'Yes',
            style: GoogleFonts.podkova(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.purple[900],
            ),
          ),
        ),
      ],
    ),
  );
  // Navigator.pop(context);
}

void snackBarDelete(BuildContext context) {
  final snackbar = SnackBar(
    backgroundColor: Colors.purple[100],
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Item is Deleted successfully',
      style: GoogleFonts.podkova(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Colors.purple[900],
      ),
    ),
  );
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
