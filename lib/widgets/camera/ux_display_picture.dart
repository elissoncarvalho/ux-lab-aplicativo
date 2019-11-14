import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/camera/ux_camera.dart';
import 'package:uxlab/widgets/ux_button_item.dart';

class UxDisplayPicture extends StatelessWidget {
  final OrdemPedido ordemPedido;
  final CameraDescription camera;

  const UxDisplayPicture({Key key, @required this.camera, @required this.ordemPedido})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (this.ordemPedido.exame.imagePath.isEmpty) {
      UxCamera(camera: this.camera,);
      CameraState cameraState = new CameraState();
      this.ordemPedido.exame.imagePath = cameraState.imagePath;
      
    }

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60, bottom: 30, left: 16, right: 16),
                  child: Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Cabeçalho
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 85,
                                    child: Text(
                                      'Foto do Exame',
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 20,
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.close,
                                              color: Colors.blueGrey,
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            // Corpo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 400,
                                  margin: EdgeInsets.only(top: 20, bottom: 20),
                                  child: Image.file(
                                      File(this.ordemPedido.exame.imagePath)),
                                ),
                              ],
                            ),
                            // Rodapé
                            Container(
                              child: UxButtonItem(
                                onPressed: () {},
                                icon: Icon(Icons.camera_alt),
                                text: 'TIRAR OUTRA FOTO',
                              ),
                            ),
                            Container(
                              child: UxButtonItem(
                                onPressed: () {},
                                icon: Icon(Icons.save),
                                text: 'SALVAR',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
