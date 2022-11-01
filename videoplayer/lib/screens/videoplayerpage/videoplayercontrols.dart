import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:video_player/video_player.dart';
import 'package:videoplayer/screens/favpage/favscreen.dart';
import 'package:videoplayer/screens/playlistpage/playlistpage.dart';
import 'package:videoplayer/screens/videoplayerpage/datamanager.dart';

class VideoPlayerWidget extends StatelessWidget {
  //final VideoPlayerController controller;

  var dataManager;

  double  fontSize;

  double iconSize;
  VideoPlayerWidget(
      {Key? key,
      
      this.iconSize = 20,
      this.fontSize = 12,
      this.dataManager})
      : super(key: key);

  @override
  
  Widget build(BuildContext ctx) {
    FlickVideoManager flickVideoManager = Provider.of<FlickVideoManager>(ctx);
    return Stack(
      children: <Widget>[
        Positioned(
          child: FlickAutoHideChild(
            child: Container(color: Colors.black38),
          ),
        ),
        Positioned(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: flickVideoManager.nextVideoAutoPlayTimer != null
                    ? FlickAutoPlayCircularProgress(
                        colors: FlickAutoPlayTimerProgressColors(
                          backgroundColor: Colors.white30,
                          color: Colors.deepPurple,
                        ),
                      )
                    : FlickAutoHideChild(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  dataManager.skipTopreviousVideo( ); //skiptoNextvideo
                                },
                                child: Icon(
                                  Icons.skip_previous,
                                  color: dataManager!.hasPreviousVideo()
                                      ? Colors.white
                                      : Colors.white38,
                                  size: 35,
                                ),
                              ),
                            ),
                        const    Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlickPlayToggle(size: 50),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  dataManager!.skipToNextVideo();
                                },
                                child: Icon(
                                  Icons.skip_next,
                                  color: dataManager!.hasNextVideo()
                                      ? Colors.white
                                      : Colors.white38,
                                  size: 35,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
        Positioned(
          child: FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          FlickCurrentPosition(
                            fontSize: fontSize,
                          ),
                          Text(
                            ' / ',
                            style: TextStyle(
                                color: Colors.white, fontSize: fontSize),
                          ),
                          FlickTotalDuration(
                            fontSize: fontSize,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlickFullScreenToggle(
                        size: iconSize,
                      ),
                    ],
                  ),
                  FlickVideoProgressBar(
                    flickProgressBarSettings: FlickProgressBarSettings(
                      height: 5,
                      handleRadius: 5,
                      curveRadius: 50,
                      backgroundColor: Colors.white24,
                      bufferedColor: Colors.white38,
                      playedColor: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  

  //-----------------------all snack bar and popups---------------------------//

  void snackBar(BuildContext context) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red[200],
      content: Text(
        'Item deleted Successfully',
        style: GoogleFonts.podkova(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.purple[900],
        ),
      ),
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.purple[900],
        onPressed: () {
          // Navigator.pop(context);
        },
      ),
    );
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void favVideoSanckbar(BuildContext context) {
    final snackbar = SnackBar(
      backgroundColor: Colors.green[200],
      behavior: SnackBarBehavior.floating,
      content: Text(
        'Item added to Favourites',
        style: GoogleFonts.podkova(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.purple[900],
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void DialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: Text(
          'Delete ?',
          style: GoogleFonts.podkova(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.purple[900]),
        ),
        content: Text(
          'Are you sure !!',
          style: GoogleFonts.podkova(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.purple[900],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'NO',
              style: GoogleFonts.podkova(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.purple[900],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              snackBar(context);
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
  }

  void playlistbottomsheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.pink[50],
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .35,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.purple[900],
                      ),
                    ),
                    const SizedBox(
                      width: 72,
                    ),
                    Text(
                      'Add to Playlist',
                      style: GoogleFonts.podkova(
                        fontSize: 20,
                        color: Colors.purple[900],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
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
                      'Weekend Fav',
                      style: GoogleFonts.podkova(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.purple[900],
                      ),
                    ),
                    const SizedBox(
                      width: 140,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        callplaylist(context);
                        await Future.delayed(
                          Duration(seconds: 0),
                        );

                        // Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: ((context) => ScreenPlaylist()),
                        //   ),
                        // );
                        // snackBarplaylist(context);
                      },
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
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
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
                      'Party Mix',
                      style: GoogleFonts.podkova(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.purple[900],
                      ),
                    ),
                    const SizedBox(
                      width: 167,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        callplaylist(context);
                      },
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
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.purple[900],
                        ),
                        shadowColor: MaterialStateProperty.all(Colors.purple),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenPlaylist()),
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 25,
                      ),
                      label: Text(
                        'Create a playlist',
                        style: GoogleFonts.podkova(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void snackBarplaylist(BuildContext context) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green[200],
      content: Text(
        'Item added successfully',
        style: GoogleFonts.podkova(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.purple[900],
        ),
      ),
    );
    // Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void callplaylist(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => ScreenPlaylist()),
      ),
    );
    snackBarplaylist(context);
  }

  //-----------------------------------------------------------------------------//
}
