import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'pages/face_detector_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pick Image'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed:() => onPickImageSelected('camera'),
                  child: Text('Camera'),
                ),
                RaisedButton(
                  onPressed:() => onPickImageSelected('gallery'),
                  child: Text('Gallery'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void onPickImageSelected(String imgSource) async {
    var imageSource;
    if (imgSource.startsWith('cam')) {
      imageSource = ImageSource.camera;
    } else {
      imageSource = ImageSource.gallery;
    }
    // final scaffold = _scaffoldKey.currentState;
    try {
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file == null) {
        throw Exception('file not available');
      }
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => FaceDetectorDetail(file),
        ),
      );
    } catch (e) {
      print('error ${e.toString()}');
    }
  }
}
