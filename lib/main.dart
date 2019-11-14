import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:uxlab/routes.dart';

Future<void> main() async {
  final cameras = await availableCameras();

  final firstCamera = cameras.first;

  runApp(Routes(camera: firstCamera));
}
