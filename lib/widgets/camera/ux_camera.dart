import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class UxCamera extends StatefulWidget {
  final CameraDescription camera;

  const UxCamera({Key key, @required this.camera,})
      : super(key: key);

  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<UxCamera> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  String imagePath;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.ultraHigh,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Foto do Pedido de Exame',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.blueGrey,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            imagePath = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            await _controller.takePicture(imagePath);
            Navigator.pop(
              context,
              imagePath
            );
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
