import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wass/classes/utils.dart';
import 'package:permission_handler/permission_handler.dart'; 

class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  Future _futureGetPath;
  List<dynamic> listImagePath = List<dynamic>();
  List<dynamic> listImage = List<dynamic>();

  // var _permissionStatus;

  @override
  void initState() {
    super.initState();
    // listenForPermissionStatus();
    _futureGetPath = getPath();
    listImagePath = fetchFiles(_futureGetPath.toString());
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Expanded(
        //   flex: 1,
        //   child: FutureBuilder(
        //     future: _futureGetPath,
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {
        //       if (snapshot.hasData) {
        //         var dir = Directory(snapshot.data);
        //         print('permission status: $_permissionStatus');
        //         if (_permissionStatus) {
        //           listImagePath = fetchFiles(dir.toString());
        //           print('fetch files ----------------------');
        //           print(fetchFiles(dir.toString()));
        //           listImagePath = fetchFiles(dir.toString());
        //           // setState(() {
        //           //   listImagePath = listImage;
        //           // });
        //           setState(() {});
        //         }
        //         return Text(listImage.toString());
        //       } else {
        //         return Text("Loading");
        //       }
        //     },
        //   ),
        // ),
        // Expanded(
        //   flex: 19,
        //   child: GridView.count(
        //     primary: false,
        //     padding: const EdgeInsets.all(2.0),
        //     crossAxisSpacing: 4,
        //     mainAxisSpacing: 4,
        //     crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
        //     children: getListImg(listImagePath),
        //   ),
        // )
      ],
    );
  }

  // Check for storage permission
  // listenForPermissionStatus() async {
  //   final status = await Permission.storage.request().isGranted;
  //   setState(() {
  //     _permissionStatus = status;
  //   });
  // }
}
