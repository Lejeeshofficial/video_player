import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';
 

class ScreenPartyMix extends StatelessWidget {
  const ScreenPartyMix({super.key});

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
          'Party Mix',
          style: GoogleFonts.podkova(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  GradientText(
                    'All Videos',
                    colors: const [
                      Color(0xFF240E8B),
                      Color(0xFF787FF6),
                    ],
                    style: GoogleFonts.podkova(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              ///------------------listview builder----------------//
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => AssetPlayerWidget()),
                      ),
                    );
                  },
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 120,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/party2.jpeg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Prince and Queen',
                                      style: GoogleFonts.podkova(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Mddi Sam',
                                      style: GoogleFonts.podkova(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueGrey),
                                    ),
                                    // Text(
                                    //   '22:25',
                                    //   style: GoogleFonts.podkova(
                                    //       fontSize: 13,
                                    //       fontWeight: FontWeight.w500,
                                    //       color: Colors.blueGrey),
                                    // ),
                                    const SizedBox(
                                      height: 22,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 47,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 35),
                                  child: PopupMenuButton(
                                    icon: Icon(
                                      Icons.more_vert_outlined,
                                      size: 23,
                                      color: Colors.purple[900],
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
                              ],
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            ///-----------------1st doted line small-----------////

                            Row(
                              children: [
                                Row(
                                  children: [
                                    for (int i = 0; i <= 3; i++)
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
                                ),
                                Container(
                                  width: 70,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue[50],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '22:45',
                                      style: GoogleFonts.podkova(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ),
                                ////-----------------Doted LIne---------------------/////

                                Row(
                                  children: [
                                    for (int i = 1; i <= 52; i++)
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
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
}
