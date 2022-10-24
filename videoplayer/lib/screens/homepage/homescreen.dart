import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/screens/homepage/foldervideos.dart';
import 'package:videoplayer/screens/homepage/settingscreen.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Folders',
                      style: GoogleFonts.podkova(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                // scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, indext) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => ScreenFolderVideos()),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue[100],
                                child: const Icon(
                                  Icons.folder_copy_outlined,
                                  size: 23,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Folder ${indext + 1}',
                                style: GoogleFonts.podkova(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.purple[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
