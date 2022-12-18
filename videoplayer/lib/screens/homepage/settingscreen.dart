import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/screens/homepage/about.dart';
import 'package:videoplayer/screens/homepage/termsandcondition.dart';

class ScreenSetting extends StatelessWidget {
  ScreenSetting({super.key});

  bool isSwitched = true;

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
          'Settings',
          style: GoogleFonts.podkova(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  TermsAndCondition(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.lock_outlined,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Privacy and Policy',
                      style: GoogleFonts.podkova(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.purple[900]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  TermsAndCondition(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.notes_outlined,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Terms and conditions',
                      style: GoogleFonts.podkova(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.purple[900]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await Share.share(
                      'Download My Application V-Player using this link -');
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.share,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Share',
                      style: GoogleFonts.podkova(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.purple[900]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (() {
                  about(context);
                }),
                child: Row(
                  children: [
                    const Icon(
                      Icons.adb_outlined,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'About',
                      style: GoogleFonts.podkova(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.purple[900]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 470,
              ),
              Text(
                'Version',
                style: GoogleFonts.podkova(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.purple[900],
                ),
              ),
              Text(
                '1:0:0',
                style: GoogleFonts.podkova(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                  color: Colors.purple[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
