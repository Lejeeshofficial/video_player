import 'package:get/get.dart';
import 'package:videoplayer/Fetchingfies/fetch_video_data.dart';
import 'package:videoplayer/db/models/databasemodels.dart';
import 'package:videoplayer/main.dart';

var boolr = false;

class VideoController extends GetxController {
  @override
  void onInit() {
    splashFetch();
    // TODO: implement onInit
    super.onInit();
  }

  RxInt TabIndex = 0.obs;

  void changeTabIndex(var index) {
    TabIndex.value = index;
    update();
  }

  getRecentStatus({required String path}) {
    List<RecentListModel> recList = recentlistDB.values.toList();

    List<RecentListModel> result =
        recList.where((checking) => checking.recentPath == path).toList();

    if (result.isEmpty) {
      var recObj = RecentListModel(recentPath: path);
      recentlistDB.add(recObj);
    } else {
      boolr = true;
    }
    refresh();
  }
}
