import 'package:flutter/material.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videoplayer/Fetchingfies/video_with_info.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:videoplayer/screens/favpage/widgets.dart';
import 'package:videoplayer/screens/videoplayerpage/videoplayer1.dart';

class SearchVideos extends SearchDelegate<VideoData> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: const TextTheme(displayMedium: TextStyle(color: Colors.white)),
      hintColor: Colors.white,
      appBarTheme: const AppBarTheme(color: Colors.deepPurple),
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(
            border: InputBorder.none,
          ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? fetchedVideosWithInfo.value
        : fetchedVideosWithInfo.value
            .where(
              (element) => element.title!.toLowerCase().startsWith(
                    query.toLowerCase(),
                  ),
            )
            .toList();
    return Scaffold(
        backgroundColor: Colors.black,
        body: mylist.isEmpty
            ? Center(
                child: Text(
                  'No Data found',
                  style: GoogleFonts.podkova(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.separated(
                itemBuilder: ((context, index) {
                  List<String> calling = getlist(mylist, index);
                  final VideoData video = mylist[index];
                  VideoplayerModel? videos = videoDB.getAt(index);
                  return ListTile(
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AssetPlayerWidget(
                              index: index, urlpassed: calling),
                        ),
                      );
                    }),
                    leading: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('lib/assets/thumbnail.jpg'),
                    ),
                    title: Text(
                      video.title!,
                      style: GoogleFonts.podkova(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return Divider(
                    color: Colors.white,
                  );
                }),
                itemCount: mylist.length));
  }

  getlist(List<VideoData> mylist, index) {
    List<String> videopath = [];
    for (VideoData obj in mylist) {
      videopath.add(obj.path!);
    }
    return videopath;
  }
}
