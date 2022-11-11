//----------------videoPlayer Model-----------------//
// import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'databasemodels.g.dart';

@HiveType(typeId: 1)
class VideoplayerModel {
  @HiveField(0)
  final String videoPath;
  @HiveField(1)
  final String videoName;
  @HiveField(2)
  final String folderPath;
  @HiveField(3)
  String thumbnail;
  @HiveField(4)
  bool isFav;
  @HiveField(5)
  int? id;

  VideoplayerModel({
    required this.videoPath,
    required this.videoName,
    required this.folderPath,
    required this.thumbnail,
    required this.isFav,
    this.id,
  });
}

//---------------Favourite video Model-----------//
@HiveType(typeId: 2)
class FavVideoModel {
  @HiveField(0)
  final String favVideoPath;
  @HiveField(1)
  var id;

  FavVideoModel({
    required this.favVideoPath,
    this.id,
  });
}

//--------------PlayList Name MOdel-------------//
@HiveType(typeId: 3)
class PlaylistNameModel {
  @HiveField(0)
  final String addPlaylist;

  PlaylistNameModel({
    required this.addPlaylist,
  });
}

//--------------Playlist video Model------------//
@HiveType(typeId: 4)
class PlaylistVideoModel {
  @HiveField(0)
  String playlistvideoPath;
  @HiveField(1)
  String playlistfolderName;

  PlaylistVideoModel({
    required this.playlistvideoPath,
    required this.playlistfolderName,
  });
}

//---------------RecentLIst Model-----------------//
@HiveType(typeId: 5)
class RecentListModel {
  @HiveField(0)
  final String recentPath;

  RecentListModel({
    required this.recentPath,
  });
}

//-----------------Image Store Model---------------//
@HiveType(typeId: 6)
class ImageStoreModel {
  @HiveField(0)
  final String imagestore;

  ImageStoreModel({
    required this.imagestore,
  });
}
