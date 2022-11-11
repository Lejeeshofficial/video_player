import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';
import 'package:videoplayer/screens/playlistpage/popupremove.dart';

class Playlistpopuplist extends StatelessWidget {
  PlaylistNameModel foldername;
  int index;
  final String videopath;
  Playlistpopuplist(
      {Key? key,
      required this.foldername,
      required this.videopath,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.playlist_add_circle_outlined,
            size: 30,
            color: Colors.purple[900],
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            foldername.addPlaylist,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.podkova(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.purple[900],
            ),
          ),
          const SizedBox(
            width: 85,
          ),
          ElevatedButton(
            onPressed: (() {
              PlaylistVideoModel object = PlaylistVideoModel(
                playlistvideoPath: videopath,
                playlistfolderName: foldername.addPlaylist,
              );
              playlistvideoDB.add(object);

              Navigator.pop(context);

              callplaylist(context);
            }),
            //  () async {
            //   callplaylist(context);
            //   await Future.delayed(
            //     Duration(seconds: 0),
            //   );
            // },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.purple[900],
              ),
            ),
            child: Text(
              'Add',
              style: GoogleFonts.podkova(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          popupmenueditandremove(context, index),
          //---------------------->
        ],
      ),
    );
  }
}
