import 'dart:developer';

import 'package:flutter/services.dart';



class SearchFilesInStorage {


  //-----------------method channel fot that kotline native code---------------------------------------------//

  static const _platform = MethodChannel('search_files_in_storage/search');

  //--------------------------------------------------------------------------------------------------------//

  static void searchInStorage(
    List<String> query,
    void Function(List<String>) onSuccess,
    void Function(String) onError,
  ) 
  {
    _platform.invokeMethod('search', query).then((value) {
      final _res = value as List<Object?>;
      onSuccess(_res.map((e) => e.toString()).toList()); //-------> OnSuccess call with a list parameter
    }).onError((error, stackTrace) {
      log(error.toString());
      onError(error.toString());
    });

    // Here what realy happense is we took that method channel then we invoke 
    // that method channel using a variable that "_platform" that time we pass
    // "query " query is a list that contains ".mp4 and .mkv extensions " that 
    // we passed when this "searchInstorage " is called. then That .then method
    // is used as a callback that that future functin when success fully called
    //then this ".then " method will fire and  
    // then that "onSuccess" function with that " value -> is a list"  will 
    //call,then if any arror is occured then that "onError will call"...
    
  }

}
