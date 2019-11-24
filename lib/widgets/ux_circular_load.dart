import 'package:flutter/material.dart';

class UxCircularLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Text(
                'Carregando',
                style: TextStyle(color: Colors.blueGrey),
              ),
            )
          ],
        )
      ],
    );
  }
}
