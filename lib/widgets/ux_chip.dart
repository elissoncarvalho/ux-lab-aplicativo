import 'package:flutter/material.dart';

class UxChip extends StatelessWidget {
  final String textLabel;
  final bool isSelected;

  UxChip(
      {Key key,
      @required this.textLabel,
      @required this.isSelected,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = this.isSelected ? Colors.green : Colors.blue;
    return Container(
      width: 125,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: _color)),
      child: FlatButton(
        padding: const EdgeInsets.all(10.0),
        onPressed: () {

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.textLabel,
              style: TextStyle(color: _color, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
