import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/Fetchingfies/fetch_video_data.dart';
import 'package:videoplayer/Fetchingfies/video_with_info.dart';
import 'package:videoplayer/screens/homepage/bottumnavigationpage.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  @override
  void initState() {
    nextpage();
    splashFetch();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF240E8B),
              Color(0xFF787FF6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.9],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Image(
                    image: AssetImage(
                      'lib/assets/icon_2-removebg.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'V-PLAYER',
                  style: GoogleFonts.podkova(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ]),
        ),
      ),
    );
  }

  nextpage() async {
    await Future.delayed(
      const Duration(seconds: 6),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNavigationScreen(),
      ),
    );
  }
}
