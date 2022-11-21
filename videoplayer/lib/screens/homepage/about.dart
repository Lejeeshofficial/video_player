import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

about(BuildContext context) {
  return showAboutDialog(
      context: context,
      applicationIcon: Container(
        width: 100,
        height: 100,
        child: Image.asset('lib/assets/icon_2-removebg.png'),
      ),
      applicationName: 'V-PLAYER',
      applicationVersion: '1:0:0',
      children: [
        const Text(
            'V-Player is a video player app that is created by Lejeesh Krishna ')
      ]);
}
