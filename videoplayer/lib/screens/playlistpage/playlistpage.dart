import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:videoplayer/screens/homepage/bottumnavigationpage.dart';
import 'package:videoplayer/screens/playlistpage/partymixfav.dart';
import 'package:videoplayer/screens/playlistpage/weekendfav.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';
 

class ScreenPlaylist extends StatelessWidget {
  const ScreenPlaylist({super.key});

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

        title: Row(
          children: [
            //  const SizedBox(
            //   width: 125,
            // ),
            Text(
              'Playlists',
              style: GoogleFonts.podkova(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.playlist_add_check_circle_outlined,
              size: 25,
              color: Colors.white,
            )
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigationScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add_circle_outline_rounded),
            iconSize: 30,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        // centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientText(
                      'Weekend Fav',
                      style: GoogleFonts.podkova(
                          fontSize: 20, fontWeight: FontWeight.w900),
                      colors: const [
                        Color(0xFF240E8B),
                        Color(0xFF787FF6),
                      ],
                    ),

                    ///---------------------------------///
                    PopupMenuButton(
                       icon:const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 23, 
                      itemBuilder: ((context) => [
                            PopupMenuItem(
                              onTap: (() async {
                                await Future.delayed(
                                    const Duration(seconds: 0));
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
                    ),

                    ///-------------------------------------------------//
                  ],
                ),
              ),

              ///------------------------line 2---------------///

              Row(
                children: [
                  for (int i = 0; i <= 73; i++)
                    i.isEven
                        ? Container(
                            width: 5,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 5,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                ],
              ),

              ///-----------------------line 2 close---------------------////

              const SizedBox(
                height: 05,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 343,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ScreenWeekendFav()),
                        ),
                      );
                    },
                    child: GradientText(
                      'All',
                      style: GoogleFonts.podkova(
                          fontSize: 20, fontWeight: FontWeight.w500),
                      colors: const [
                        Color(0xFF240E8B),
                        Color(0xFF787FF6),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 05,
              ),
              Container(
                height: 122,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //SizedBox(width: 10,),
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        
                                      },
                                      child: Container(
                                        width: 160,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/image1.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 120,
                                      top: 0,
                                      child: PopupMenuButton(
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
                                      ),  
                                    ),
                                    Positioned(
                                      left: 55,
                                      top: 28,
                                      child: IconButton(
                                        onPressed: () {
                                        
                                        },
                                        icon: Icon(Icons.play_circle_outline),
                                        iconSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Special Agent.OSO',
                                  style: GoogleFonts.podkova(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue[900],
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  '22:25',
                                  style: GoogleFonts.podkova(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                width: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  for (int i = 0; i <= 73; i++)
                    Container(
                      width: 5,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    )
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              ///-----------------------2nd PlayList---------------------------///

              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientText(
                      'Party Mix',
                      style: GoogleFonts.podkova(
                          fontSize: 20, fontWeight: FontWeight.w700),
                      colors: const [
                        Color(0xFF240E8B),
                        Color(0xFF787FF6),
                      ],
                    ),
                     PopupMenuButton(
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 23,
                      itemBuilder: ((context) => [
                            PopupMenuItem(
                              onTap: (() async {
                                await Future.delayed(
                                    const Duration(seconds: 0));
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
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.more_vert_outlined),
                    //   iconSize: 30,
                    //   color: Colors.deepPurple,
                    // ),
                  ],
                ),
              ),

              ///------------------------line 2---------------///

              Row(
                children: [
                  for (int i = 0; i <= 73; i++)
                    i.isEven
                        ? Container(
                            width: 5,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 5,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                ],
              ),

              ///-----------------------line 2 close---------------------////

              const SizedBox(
                height: 05,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 343,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenPartyMix()),
                      );
                    },
                    child: GradientText(
                      'All',
                      style: GoogleFonts.podkova(
                          fontSize: 20, fontWeight: FontWeight.w500),
                      colors: const [
                        Color(0xFF240E8B),
                        Color(0xFF787FF6),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 05,
              ),
              Container(
                height: 122,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: (() {
                                      
                                    }),
                                    child: Container(
                                      width: 160,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'lib/assets/party2.jpeg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 120,
                                    top: 0,
                                    child: PopupMenuButton(
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
                                    ),
                                  ),
                                  Positioned(
                                    left: 55,
                                    top: 28,
                                    child: IconButton(
                                      onPressed: () {
                                        
                                      },
                                      icon: Icon(Icons.play_circle_outline),
                                      iconSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Prince and Queen',
                                style: GoogleFonts.podkova(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[900],
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                '14:41',
                                style: GoogleFonts.podkova(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  for (int i = 0; i <= 73; i++)
                    Container(
                      width: 5,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    )
                ],
              ),
              //-------------------------2nd playlist close--------------------///
            ],
          ),
        ),
      ),
    );
  }

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

  void DialogBoxDelete(BuildContext context) {
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
}
