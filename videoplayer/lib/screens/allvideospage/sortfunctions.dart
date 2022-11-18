// import 'dart:developer';

import 'package:videoplayer/Fetchingfies/video_with_info.dart';

sortAlphabetical() {
  fetchedVideosWithInfo.value.sort(
    ((a, b) {
      return a.title!.toLowerCase().compareTo(b.title!.toLowerCase());
    }),
  );

  fetchedVideosWithInfo.notifyListeners();
}

sortByDuration() {
  fetchedVideosWithInfo.value.sort(
    ((a, b) {
      return a.duration!.compareTo(b.duration!);
    }),
  );
  fetchedVideosWithInfo.notifyListeners();
}

// sortByDate() {
//   fetchedVideosWithInfo.value.sort(
//     ((a, b) {
//       return a.date!.compareTo(b.date!);
//     }),
//   );
//   fetchedVideosWithInfo.notifyListeners();
// }

// sortBySize() {
//   fetchedVideosWithInfo.value.sort(
//     ((a, b) {
//       return a.filesize!.compareTo(b.filesize!);
//     }),
//   );

//   fetchedVideosWithInfo.notifyListeners();
// }

String formatTime(double? time) {
  Duration duration = Duration(milliseconds: time!.round());
  return [duration.inHours, duration.inMinutes, duration.inSeconds]
      .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
      .join(':');
}
