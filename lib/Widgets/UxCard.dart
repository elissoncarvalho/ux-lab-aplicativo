import 'package:flutter/material.dart';
import 'package:uxlab/Models/Exame.dart';

class UxCard extends StatelessWidget {
  final Widget child;
  final Exame exame;
  final String ambiente;

  UxCard({
    Key key,
    this.child,
    @required this.exame,
    @required this.ambiente
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(exame.codExame.toString()),
            Text(exame.dataColeta.toString()),
            Text(exame.codExame.toString()),

          ],
        ),
      ),
    );
  }
}