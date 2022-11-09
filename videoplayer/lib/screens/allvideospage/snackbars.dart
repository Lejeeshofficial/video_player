import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/screens/playlistpage/playlistpage.dart';
import 'package:videoplayer/screens/playlistpage/popupremove.dart';

import '../../main.dart';

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

void playlistbottomsheet(BuildContext context) {
  showModalBottomSheet(
    // elevation: 70,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(children: [
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
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 10),
                        ),
                        label: Text(
                          'Enter Playlist name',
                          style: GoogleFonts.podkova(
                              color: Colors.purple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .80,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.purple[900],
                          ),
                          shadowColor: MaterialStateProperty.all(Colors.purple),
                        ),
                        onPressed: () {
                          playlistadded(context);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => ScreenPlaylist()),
                          // );
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 25,
                        ),
                        label: Text(
                          'Create a new playlist',
                          style: GoogleFonts.podkova(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ]),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: scrollController,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
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
                              width: 85,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                callplaylist(context);
                                await Future.delayed(
                                  Duration(seconds: 0),
                                );
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
                            const SizedBox(
                              width: 10,
                            ),
                            popupmenueditandremove(context),
                            //---------------------->
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
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

void DialogBoxremove(BuildContext context, index) {
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
            favvideoDB.deleteAt(index);
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

void playlistadded(BuildContext context) {
  final snackbar = SnackBar(
    backgroundColor: Colors.green[200],
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Play list created successfully',
      style: GoogleFonts.podkova(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Colors.purple[900],
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
