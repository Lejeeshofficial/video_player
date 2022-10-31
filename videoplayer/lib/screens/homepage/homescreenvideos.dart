import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:videoplayer/Fetchingfies/load_folder_video.dart';
import 'package:videoplayer/screens/favpage/favscreen.dart';
import 'package:videoplayer/screens/playlistpage/playlistpage.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';

class ScreenFolderVideos extends StatefulWidget {
  ScreenFolderVideos({Key? key, required this.index, required this.folderPath})
      : super(key: key);
  var folderPath;

  int index;

  @override
  State<ScreenFolderVideos> createState() => _ScreenFolderVideosState();
}

class _ScreenFolderVideosState extends State<ScreenFolderVideos> {
  @override
  void initState() {
    getFolderVideos(widget.folderPath);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF240E8B),
                Color(0xFF787FF6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.1, 1],
            ),
          ),
        ),
        title: Text(
          'All Videos',
          style: GoogleFonts.podkova(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),

            ///------------------listview builder----------------//
            ValueListenableBuilder(
              valueListenable:
                  filteredFolderVideos, //all videos listed in this value notifier
              builder: (context, value1, child) {
                return value1.isEmpty
                    ? Center(
                        child: Text(
                          'No videos..',
                          style: GoogleFonts.podkova(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 22),
                        ),
                      )
                    //-----------------------videos listing -------------------------------------------------------------//
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return Row(
                            children: [
                              for (int i = 0; i <= 75; i++)
                                i.isEven
                                    ? Container(
                                        width: 5,
                                        height: 2,
                                        color: Colors.blue[900],
                                      )
                                    : Container(
                                        width: 5,
                                        height: 2,
                                        color: Colors.white,
                                      ),
                            ],
                          );
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: value1.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AssetPlayerWidget(
                                      index: index,
                                      urlpassed: value1[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            // image: const DecorationImage(
                                            //     image: AssetImage(
                                            //         'lib/assets/image1.png'),
                                            //     fit: BoxFit.cover),
                                          ),
                                          child: FutureBuilder(
                                            future: getThumbnail(value1[index]),
                                            builder: (context,
                                                    AsyncSnapshot<String?>
                                                        snapshot) =>
                                                snapshot.hasData
                                                    ? Image.file(
                                                        File(snapshot.data!),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Container(
                                                        width: 100,
                                                        height: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image: const DecorationImage(
                                                              image: AssetImage(
                                                                  'lib/assets/play button.jpg'),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .5,
                                              child: Text(
                                                value1[index]
                                                    .toString()
                                                    .split('/')
                                                    .last,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.podkova(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue[900],
                                                ),
                                              ),
                                            ),
                                            // const SizedBox(
                                            //   height: 2,
                                            // ),
                                            // Text(
                                            //   'John Sam',
                                            //   style: GoogleFonts.podkova(
                                            //       fontSize: 13,
                                            //       fontWeight: FontWeight.w500,
                                            //       color: Colors.blueGrey),
                                            // ),
                                            // Text(
                                            //   '22:25',
                                            //   style: GoogleFonts.podkova(
                                            //       fontSize: 13,
                                            //       fontWeight: FontWeight.w500,
                                            //       color: Colors.blueGrey),
                                            // ),
                                            // const SizedBox(
                                            //   height: 20,
                                            // ),
                                          ],
                                        ),
                                        // const SizedBox(
                                        //   width: 47,
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: PopupMenuButton(
                                            icon: const Icon(
                                              Icons.more_vert_outlined,
                                              color: Colors.deepPurple,
                                            ),
                                            itemBuilder: ((context) => [
                                                      PopupMenuItem(
                                                        onTap: () async {
                                                          final navigator =
                                                              Navigator.of(
                                                                  context);
                                                          await Future.delayed(
                                                              Duration(
                                                                  seconds: 0));
                                                          navigator.push(
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      FavScreen(),
                                                            ),
                                                          );
                                                          favVideoSanckbar(
                                                              context);
                                                        },
                                                        value: 0,
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .favorite_border_outlined,
                                                              size: 18,
                                                              color: Colors
                                                                  .deepPurple,
                                                            ),
                                                            const SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Add To Favourites',
                                                              style: GoogleFonts.podkova(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .deepPurple),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      PopupMenuItem(
                                                        onTap: (() async {
                                                          final navigator =
                                                              Navigator.of(
                                                                  context);
                                                          await Future.delayed(
                                                            Duration(
                                                                seconds: 0),
                                                          );
                                                          playlistbottomsheet(
                                                              context);
                                                        }),
                                                        value: 1,
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .playlist_add_check_circle_outlined,
                                                              size: 18,
                                                              color: Colors
                                                                  .deepPurple,
                                                            ),
                                                            const SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Add To Playlist',
                                                              style: GoogleFonts.podkova(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .deepPurple),
                                                            )
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
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),

                                    ///-----------------1st doted line small-----------////

                                    // Row(
                                    //   children: [
                                    //     Row(
                                    //       children: [
                                    //         for (int i = 0; i <= 3; i++)
                                    //           i.isEven
                                    //               ? Container(
                                    //                   width: 5,
                                    //                   height: 2,
                                    //                   color: Colors.blue[900],
                                    //                 )
                                    //               : Container(
                                    //                   width: 5,
                                    //                   height: 2,
                                    //                   color: Colors.white,
                                    //                 ),
                                    //       ],
                                    //     ),
                                    //   ],
                                    // ),
                                    // Container(
                                    //   width: 70,
                                    //   height: 20,
                                    //   decoration: BoxDecoration(
                                    //     borderRadius:
                                    //         BorderRadius.circular(10),
                                    //     color: Colors.blue[50],
                                    //   ),
                                    //   child: Center(
                                    //     child: Text(
                                    //       '22:45',
                                    //       style: GoogleFonts.podkova(
                                    //           fontSize: 13,
                                    //           fontWeight: FontWeight.w500,
                                    //           color: Colors.black87),
                                    //     ),
                                    //   ),
                                    // ),
                                    ////-----------------Doted LIne---------------------/////

                                    // Row(
                                    //   children: [
                                    //     for (int i = 1; i <= 70; i++)
                                    //       i.isEven
                                    //           ? Container(
                                    //               width: 5,
                                    //               height: 2,
                                    //               color: Colors.blue[900],
                                    //             )
                                    //           : Container(
                                    //               width: 5,
                                    //               height: 2,
                                    //               color: Colors.white,
                                    //             ),
                                    //   ],
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

//----------------------------------------thumbnail generator-----------------------------------------------------//
  Future<String> getThumbnail(String tumbnail) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: tumbnail,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      quality: 100,
    );
    return fileName!;
  }
  //-------------------------------------------------------------------------------------------------------//

  void DialogBoxremove(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: Text(
          'Remove ?',
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

  void snackBarremove(BuildContext context) {
    final snackbar = SnackBar(
      backgroundColor: Colors.purple[100],
      behavior: SnackBarBehavior.floating,
      content: Text(
        'Item is removed successfully',
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

  void callplaylist(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => ScreenPlaylist()),
      ),
    );
    snackBarplaylist(context);
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
}
