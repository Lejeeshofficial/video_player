import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/screens/splashpage/splash.dart';

late Box<VideoplayerModel> videoDB;
late Box<FavVideoModel> favvideoDB;
late Box<PlaylistNameModel> playlistnameDB;
late Box<PlaylistVideoModel> playlistvideoDB;
late Box<RecentListModel> recentlistDB;
late Box<ImageStoreModel> imageDB;
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(VideoplayerModelAdapter().typeId)) {
    Hive.registerAdapter(VideoplayerModelAdapter());
    Hive.registerAdapter(FavVideoModelAdapter());
    Hive.registerAdapter(PlaylistNameModelAdapter());
    Hive.registerAdapter(PlaylistVideoModelAdapter());
    Hive.registerAdapter(RecentListModelAdapter());
    Hive.registerAdapter(ImageStoreModelAdapter());
  }
  videoDB = await Hive.openBox<VideoplayerModel>('videoplayer');
  favvideoDB = await Hive.openBox<FavVideoModel>('favvideo');
  playlistnameDB = await Hive.openBox<PlaylistNameModel>('playlistname');
  playlistvideoDB = await Hive.openBox<PlaylistVideoModel>('playlistvideo');
  recentlistDB = await Hive.openBox<RecentListModel>('recentlist');
  imageDB = await Hive.openBox<ImageStoreModel>('imagestore');

  runApp(const MyApp());
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
  // my
}
