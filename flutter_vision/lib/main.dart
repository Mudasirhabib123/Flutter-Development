import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_vision/detail_screen.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print(e);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ml Vision',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CameraScreen(title: 'ML Vision'),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _controller =
      CameraController(cameras[0], ResolutionPreset.medium);
  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> TakePicture() async {
    if (!_controller.value.isInitialized) {
      print('controller not initialized');
      return '';
    }
    String dateTime = DateFormat.yMMMd()
        .addPattern('-')
        .add_Hms()
        .format(DateTime.now())
        .toString();
    String formattedDateTime = dateTime.replaceAll(' ', '');
    print(formattedDateTime);

    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String visionDir = "${appDocDir.path}/Photos/Vision/Images";
    await Directory(visionDir).create(recursive: true);
    final String imagePath = '$visionDir/image_$formattedDateTime.jpg';

    if (_controller.value.isTakingPicture) {
      print('capturing is in progress');
      return '';
    }

    try {
      // Captures the image and saves it to the
      // provided path
      await _controller.takePicture();
    } on CameraException catch (e) {
      print("Camera Exception: $e");
      return '';
    }

    return imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _controller.value.isInitialized
          ? Stack(
              children: <Widget>[
                CameraPreview(_controller),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton.icon(
                      icon: Icon(Icons.camera),
                      label: Text("Click"),
                      onPressed: () async {
                        await TakePicture().then((String path) {
                          if (path != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(path),
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ),
                )
              ],
            )
          : Container(
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
