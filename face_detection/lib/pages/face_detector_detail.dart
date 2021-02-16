import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class FaceDetectorDetail extends StatelessWidget {
  File file;
  FaceDetectorDetail(File file) {
    this.file = file;
  }

  List<Face> faces;

  // @override
  // void initState() {
  //   super.initState();
  //   detectFaces();
  // }

  @override
  Widget build(BuildContext context) {
    return Text(file.toString());
  }

  void detectFaces() async {
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(file);
    final FaceDetector faceDetector = FirebaseVision.instance.faceDetector(
      FaceDetectorOptions(
          mode: FaceDetectorMode.accurate,
          enableClassification: true,
          enableLandmarks: true),
    );
    List<Face> detectedFaces = await faceDetector.processImage(visionImage);
    for (var i = 0; i <= faces.length; i++) {
      final double smileProbablity = detectedFaces[i].smilingProbability;
      print('Smiliong $smileProbablity');
    }
    faces = detectedFaces;
  }
}
