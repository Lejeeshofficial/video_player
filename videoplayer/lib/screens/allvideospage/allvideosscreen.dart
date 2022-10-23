import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:videoplayer/screens/favpage/favscreen.dart';
import 'package:videoplayer/screens/homepage/settingscreen.dart';
import 'package:videoplayer/screens/playlistpage/partymixfav.dart';
import 'package:videoplayer/screens/playlistpage/playlistpage.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';
 

class ScreenAllvideos extends StatefulWidget {
  const ScreenAllvideos({super.key});

  @override
  State<ScreenAllvideos> createState() => _ScreenAllvideos();
}

class _ScreenAllvideos extends State<ScreenAllvideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          // child: SizedBox(width: 10,),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF240E8B),
                  Color(0xFF787FF6),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.1, 1.0]),
          ),
        ),
        // backgroundColor:const Color(0xFF6E012A),
        leading: const Icon(
          Icons.ondemand_video_outlined,
          size: 40,
        ),

        title: Text(
          'LXC',
          style: GoogleFonts.podkova(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    onTap: (() async {
                      await Future.delayed(const Duration(seconds: 0));
                      setState(() {
                        // BottomNavigationScreen();
                        print('object');
                      });
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
                          Icons.refresh,
                          size: 18,
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(
                          width: 08,
                        ),
                        Text(
                          'Refresh',
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
                      navigator.push(
                        MaterialPageRoute(
                          builder: (_) => ScreenSetting(),
                        ),
                      );
                    },
                    value: 1,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          size: 18,
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Setting',
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
        ],
      ),
      body: SafeArea(

        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: Column(
             // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      shape: BoxShape.rectangle),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: GradientText(
                              colors: const [
                                Color(0xFF240E8B),
                                Color(0xFF787FF6),
                              ],
                              'Recently Played...',
                              style: GoogleFonts.podkova(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
          
                      ///-----------------------Recently viewed_---------------///
          
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .94,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenPartyMix()),
                              );
                            },
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              size: 20,
                              color: Colors.purple[900],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .21,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            InkWell(
                                              onTap: (() {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: ((context) =>
                                                        AssetPlayerWidget()),
                                                  ),
                                                );
                                              }),
                                              child: Container(
                                                width: 300,
                                                height: 170,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'lib/assets/party2.jpeg'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Text(
                                                'Prince and Queen',
                                                style: GoogleFonts.podkova(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 25,
                                              left: 10,
                                              child: Text(
                                                'Sam Joseph',
                                                style: GoogleFonts.podkova(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
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
                                                          style:
                                                              GoogleFonts.podkova(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18,
                                                            color: Colors
                                                                .purple[900],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Icon(
                                                          Icons.delete,
                                                          size: 20,
                                                          color:
                                                              Colors.purple[900],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Positioned(
                                                width: 300,
                                                height: 170,
                                                // left: 55,
                                                // top: 28,
                                                child: Center(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: ((context) =>
                                                              AssetPlayerWidget()),
                                                        ),
                                                      );
                                                    },
                                                    icon: Icon(Icons
                                                        .play_circle_outline),
                                                    iconSize: 30,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Text(
                                        //   'Prince and Queen',
                                        //   style: GoogleFonts.podkova(
                                        //     fontSize: 14,
                                        //     fontWeight: FontWeight.w500,
                                        //     color: Colors.blue[900],
                                        //   ),
                                        // ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        // Text(
                                        //   '14:41',
                                        //   style: GoogleFonts.podkova(
                                        //     fontSize: 12,
                                        //     fontWeight: FontWeight.w500,
                                        //     color: Colors.grey[900],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                        child: Row(
                          children: [
                            for (int i = 0; i <= 77; i++)
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                      child: Container(
                        width: 150,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Color(0xFF787FF6),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'All Videos',
                            style: GoogleFonts.podkova(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
          
                //-----------------------------next-------------------///
                Column(
                  children: [
                  // child: Flexible(
                    // fit: FlexFit.loose,
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics( ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4 / 3,
          
                        // childAspectRatio: 4 / 3,
          
                        // maxCrossAxisExtent: 200,
                      ),
                      itemCount: 8,
                      itemBuilder: ((context, index) {
                        return GridTile(
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: (() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AssetPlayerWidget(),
                                            ),
                                          );
                                        }),
                                        child: Container(
                                          width: 160,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'lib/assets/image1.png'),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 4,
                                        left: 120,
                                        child:
          
                                            ///------------------pop up menu-------------///
          
                                            PopupMenuButton(
                                          icon: const Icon(
                                            Icons.more_vert_outlined,
                                            color: Colors.white,
                                          ),
                                          itemBuilder: ((context) => [
                                                    PopupMenuItem(
                                                      onTap: () async {
                                                        final navigator =
                                                            Navigator.of(context);
                                                        await Future.delayed(
                                                            Duration(seconds: 0));
                                                        navigator.push(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                FavScreen(),
                                                          ),
                                                        );
                                                        favVideoSanckbar(context);
                                                      },
                                                      value: 0,
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .favorite_border_outlined,
                                                            size: 18,
                                                            color:
                                                                Colors.deepPurple,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Text(
                                                            'Add To Favourites',
                                                            style: GoogleFonts
                                                                .podkova(
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
                                                            Navigator.of(context);
                                                        await Future.delayed(
                                                          Duration(seconds: 0),
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
                                                            color:
                                                                Colors.deepPurple,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Text(
                                                            'Add To Playlist',
                                                            style: GoogleFonts
                                                                .podkova(
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
                                                            color:
                                                                Colors.deepPurple,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Text(
                                                            'Delete',
                                                            style: GoogleFonts
                                                                .podkova(
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .deepPurple),
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
          
                                        //---------------------------------------------/
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Special Agent.OSO',
                                    style: GoogleFonts.podkova(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue[900]),
                                  ),
                                  Text(
                                    '18:25',
                                    style: GoogleFonts.podkova(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ),],
                  ),
                // ),
          
                ///-------------------////-------------------------------------//
              ],
            ),
          ),
        ),
      ),
    );
  }

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
}
