import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/screens/recently/recentlistfun.dart';
import 'package:videoplayer/screens/recently/recently.dart';
import 'package:wakelock/wakelock.dart';

class VideoPlay extends StatefulWidget {
  final videoLink;
  const VideoPlay({
    required this.videoLink,
  });

  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late BetterPlayerController _betterPlayerController;
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    var recent = RecentListModel(
      recentPath: widget.videoLink,
    );
    getRecentStatus(path: widget.videoLink);
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
      autoPlay: true,
      looping: true,
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoDetectFullscreenDeviceOrientation: true,
      fullScreenByDefault: true,
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.file, widget.videoLink,
        notificationConfiguration: BetterPlayerNotificationConfiguration(
          showNotification: true,
          title: getVideoName(),
        ));
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    Wakelock.enable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getVideoName(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(
                  controller: _betterPlayerController,
                  key: _betterPlayerKey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getVideoName() {
    return widget.videoLink.split('/').last;
  }
}
