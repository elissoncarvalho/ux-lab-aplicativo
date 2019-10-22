import 'package:flutter/material.dart';

class UxButtonItem extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback onPressed;

  UxButtonItem({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 55.0,
      child: FlatButton(
        onPressed: this.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: this.icon,
            ),
            Text(this.text),
          ],
        ),
        textColor: Colors.blue,
      ),
    );
  }
}
