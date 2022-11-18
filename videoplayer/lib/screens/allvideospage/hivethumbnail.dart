import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getHiveThumbnail(dynamic video, int index) async {
  if (video.thumbnail.isNotEmpty) {
    return '';
  } else {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: video.videoPath.toString(),
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      quality: 100,
    );
    video.thumbnail = fileName.toString();
    videoDB.putAt(index, video);
    return fileName!;
  }
}
