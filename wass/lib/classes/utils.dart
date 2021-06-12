import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:ext_storage/ext_storage.dart';

// class Utils {
//   Future futureGetPath;
//   List<dynamic> listImagePath = List<dynamic>();
//   var permissionStatus;
// }

Future<String> getPath() {
  return ExtStorage.getExternalStoragePublicDirectory(
      'WhatsApp/Media/.Statuses/');
}

List<dynamic> fetchFiles(String dir) {
  List<dynamic> listImage = List<dynamic>();
  Directory dr = Directory(dir);
  dr.list().forEach((element) {
    RegExp regExp = new RegExp("\.(jpg)", caseSensitive: false);
    // Only add in List if path is an image
    if (regExp.hasMatch('$element')) listImage.add(element);
    // setState(() {
    //   listImagePath = listImage;
    // });
  });
  print('list Images ++++++++++++++++');
  listImage.forEach((element) {
    print(element);
  });
  print(listImage.length);
  return listImage;
}

List<Widget> getListImg(List<dynamic> listImagePath) {
  print('**********************');
  listImagePath.forEach((element) {
    print(element);
  });
  List<Widget> listImages = List<Widget>();
  for (var imagePath in listImagePath) {
    listImages.add(
      Container(
        // padding: const EdgeInsets.all(8),
        child: Image.file(imagePath, fit: BoxFit.fill),
      ),
    );
  }
  return listImages;
}
