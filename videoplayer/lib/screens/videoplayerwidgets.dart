import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:video_player/video_player.dart';
import 'package:videoplayer/screens/favscreen.dart';
import 'package:videoplayer/screens/playlistpage.dart';
import 'package:videoplayer/screens/videoplayer1.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 3
      ),
    ),
        child: controller != null && controller.value.isInitialized
            ? Container(
                alignment: Alignment.topCenter, child: BuildVideo(context))
            : Container(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              ),
      );

  Widget BuildVideo(BuildContext ctx) => Stack(
        children: [
          InkWell(
              onTap: (() {
                controller.value.isPlaying
                    ? controller.pause()
                    : controller.play();
              }),
              child: buildVideoPlayer()),
          Positioned(
            bottom: 28,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                  width: MediaQuery.of(ctx).size.width * .990,
                  child:
                      VideoProgressIndicator(controller, allowScrubbing: true)),
            ),
          ),
          Positioned(
            top: 80,
            left: 170,
            child: controller.value.isPlaying
                ? Container()
                : InkWell(
                    onTap: (() {
                      controller.play();
                    }),
                    child: const Icon(
                      Icons.play_circle_outline_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: controller.value.isPlaying
                ? Container()
                : Text(
                    'Special Agent.OSO',
                    style: GoogleFonts.podkova(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
          ),
          Positioned(
            left: 10,
            top: 35,
            child: controller.value.isPlaying
                ? Container()
                : Text(
                    'John Smith',
                    style: GoogleFonts.podkova(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
          ),
          controller.value.isPlaying
              ? Positioned(
                  top: 80,
                  left: 70,
                  child: Icon(
                    Icons.forward_10,
                    size: 40,
                    color: Colors.white.withOpacity(.5),
                  ),
                )
              : const Positioned(
                  top: 80,
                  left: 70,
                  child: Icon(
                    Icons.forward_10,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
          controller.value.isPlaying
              ? Positioned(
                  top: 80,
                  left: 270,
                  child: Icon(
                    Icons.replay_10,
                    size: 40,
                    color: Colors.white.withOpacity(.5),
                  ),
                )
              : const Positioned(
                  top: 80,
                  left: 270,
                  child: Icon(
                    Icons.replay_10,
                    size: 40,
                    color: Colors.white,
                  ),
                ),

          Positioned(
            bottom: 0,
            left: 180,
            child: controller.value.isPlaying
                ? InkWell(
                    onTap: () {
                      controller.pause();
                    },
                    child: const Icon(
                      Icons.pause_circle_outline_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      controller.play();
                    },
                    child: const Icon(
                      Icons.play_circle_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
          ),
          const Positioned(
            bottom: 0,
            left: 80,
            child: Icon(
              Icons.skip_next_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 270,
            child: Icon(
              Icons.skip_next_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 345,
            child: Icon(
              Icons.fullscreen_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 10,
            child: Icon(
              Icons.repeat_one,
              size: 30,
              color: Colors.white,
            ),
          ),

          //popupMEnuBottom------------------------------------//

          Positioned(
            right: 0,
            child: controller.value.isPlaying
                ? Container()
                : PopupMenuButton(
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white,
                    ),
                    itemBuilder: ((context) => [
                              PopupMenuItem(
                                onTap: () async {
                                  final navigator = Navigator.of(context);
                                  await Future.delayed(Duration(seconds: 0));
                                  navigator.push(
                                    MaterialPageRoute(
                                      builder: (context) => FavScreen(),
                                    ),
                                  );
                                  favVideoSanckbar(context);
                                },
                                value: 0,
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
                                onTap: (() async {
                                  final navigator = Navigator.of(context);
                                  await Future.delayed(
                                    Duration(seconds: 0),
                                  );
                                  playlistbottomsheet(context);
                                }),
                                value: 1,
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
                              PopupMenuItem(
                                onTap: (() async {
                                  await Future.delayed(
                                    Duration(seconds: 0),
                                  );

                                  DialogBox(context);
                                }),
                                value: 2,
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
                            ]
                        // ),

                        ),
                    color: Colors.grey[50],
                    offset: Offset(-0, 0),
                  ),
          ),

          //--------------------------------------------------//
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );

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
