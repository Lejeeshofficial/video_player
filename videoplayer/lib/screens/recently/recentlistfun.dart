import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/allvideospage/snackbars.dart';

bool boolrec = false;
getRecentStatus({required String path}) {
  List<RecentListModel> recList = recentlistDB.values.toList();
  Iterable<RecentListModel> list =
      recList.where((element) => element.recentPath == path);

  if (list.isEmpty) {
    var recobj = RecentListModel(recentPath: path);
    recentlistDB.add(recobj);
  } else {
    boolrec = true;
  }
}

getListrecent() {
  List<RecentListModel> objList = recentlistDB.values.toList();
  List<String> videopath = [];
  for (RecentListModel obj in objList) {
    videopath.add(obj.recentPath);
  }
  return videopath;
}

Widget popupmenurecentlistalldelte(context) {
  return PopupMenuButton(
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
          DialogBoxremoverecentlistdeleteall(context);
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
  );
}

void DialogBoxremoverecentlistdeleteall(BuildContext context) {
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
            recentlistDB.clear();
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
