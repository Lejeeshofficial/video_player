import 'package:flutter/material.dart';

import 'package:videoplayer/screens/splash.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenSplash(),
    );
  }
  // my changes after 1st pust to
}
