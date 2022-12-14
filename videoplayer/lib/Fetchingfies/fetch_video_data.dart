import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:videoplayer/Fetchingfies/searching_Files.dart';
import 'package:videoplayer/Fetchingfies/video_with_info.dart';
import 'load_folder_list.dart';

bool isLoading = false;
bool hasMoreData = true;

List<String> fetchedVideosPath = []; //all videos path loaded first time
ValueNotifier<List<String>> favVideos = ValueNotifier([]);
//---------------------------------------------------------//
List<String> fetchedallvideos = [];

// void allvideosadding(value) {
//   for (int j = 0; j < value.length; j++) {
//     fetchedallvideos.add(value);
//   }
// }

//------------onSuccess function--------------------------------------------//
onSuccess(List<String> data) {
  //---->this function calling form the function "searchInStorage " not bellow ...

  fetchedVideosPath =
      data; // fetchedVideosPath this is what we get from that method channel filterd by ".mp3 and .mkv"

//--------------------------------------------------------//
  // allvideosadding(data);
//-------------------------------------------------------//

  for (int i = 0; i < fetchedVideosPath.length; i++) {
    if (fetchedVideosPath[i].startsWith('/storage/emulated/1/Android/data')) {
      fetchedVideosPath.remove(fetchedVideosPath[i]);
      i--;
    }
  }

  loadFolderList();
  getVideoWithInfo();

  // allvideosadding(data);
  // print(object)

  //log("------------------------${fetchedVideosPath}-----------------------"); //------>to get the nubmer of file containint ".mp3 and mkv"
}
//----------------------------------------------------------------------------//

//---------------------------first called from splash screen---------------------------------------//

Future splashFetch() async {
  log('lejeesh k');
  if (await _requestPermission(Permission.storage)) {
    print('lejeesh 2nd');
    SearchFilesInStorage.searchInStorage([
      //----->function call of searchInStorage with 3 parameters,
      '.mp4',
      '.mkv',
    ], onSuccess, (p0) {}); //----upto here function call above
  } else {
    splashFetch();
  }
}
//--------------------------------------------------------------------------------------------------------//

// -----------------------------request the permission----------------------------//
Directory? dir;

Future<bool> _requestPermission(Permission permission) async {
  const store = Permission.storage; //final---->const
  const access = Permission.accessMediaLocation; //same..
  if (await permission.isGranted) {
    await access.isGranted && await access.isGranted; //access---->Store
    log('=============================permission granted =======================');
    return true; //----------->First time grandted.
  } else {
    var result = await store.request();
    var oneresult = await access.request();
    print(
        '=============================permission request =======================');

    if (result == PermissionStatus.granted &&
        oneresult == PermissionStatus.granted) {
      print(
          '=============================permission status granted =======================');

      return true; //--------------->Second time granted.
    } else {
      print(
          '=============================permission denied =======================');

      return false; //--------------->access denied..
    }
  }
}
//------------------------------------------------------------------------------------------------------------//
