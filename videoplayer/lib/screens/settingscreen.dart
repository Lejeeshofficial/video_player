import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ScreenSetting extends StatefulWidget {
  ScreenSetting({super.key});

  @override
  State<ScreenSetting> createState() => _ScreenSettingState();
}

class _ScreenSettingState extends State<ScreenSetting> {
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.notifications_active_outlined,
                    size: 25,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Notifications',
                    style: GoogleFonts.podkova(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.purple[900]),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor: Colors.purple[900],
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.lock_outlined,
                    size: 25,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Privacy and Policy',
                    style: GoogleFonts.podkova(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.purple[900]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.notes_outlined,
                    size: 25,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Terms and conditions',
                    style: GoogleFonts.podkova(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.purple[900]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.adb_outlined,
                    size: 25,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'About',
                    style: GoogleFonts.podkova(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.purple[900]),
                  ),
                ],
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
                '2:3:4',
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
