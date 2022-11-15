import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';

editplaylistname({required context, required index}) {
  final textcontroller = TextEditingController();

  return showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        title: Text(
          'Edit',
          style: GoogleFonts.podkova(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        content: TextFormField(
          controller: textcontroller,
          decoration: const InputDecoration(
            hintText: 'Updated name',
            hintStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                label: Text(
                  'Cancel',
                  style: GoogleFonts.podkova(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  PlaylistNameModel obj1 =
                      PlaylistNameModel(addPlaylist: textcontroller.text);

                  playlistnameDB.putAt(index, obj1);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.update,
                  color: Colors.green,
                ),
                label: Text(
                  'Update',
                  style: GoogleFonts.podkova(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      );
    }),
  );
}
