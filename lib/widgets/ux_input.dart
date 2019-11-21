import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class UxInput extends StatelessWidget {
  final String textLabel;
  final MaskedTextController textMask;
  final Color textColor;
  final Color labelColor;
  final int labelBorderWidth;
  final bool textPass;
  final bool autofocus;
  final TextInputType keyboardType;
  final EdgeInsets padding;

  UxInput({
    Key key,
    @required this.textLabel,
    this.textMask,
    @required this.textColor,
    @required this.labelColor,
    this.labelBorderWidth,
    this.autofocus,
    this.textPass,
    this.keyboardType,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding ?? const EdgeInsets.all(0),
      child: TextFormField(
        autofocus: this.autofocus ?? false,
        obscureText: this.textPass ?? false,
        keyboardType: this.keyboardType ?? TextInputType.text,
        controller: this.textMask,
        style: TextStyle(color: this.textColor),
        decoration: InputDecoration(
          labelText: this.textLabel,
          labelStyle: TextStyle(
              color: (this.labelColor ?? this.textColor),
              fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
                color: this.labelColor ?? this.textColor,
                width: this.labelBorderWidth != null
                    ? this.labelBorderWidth.toDouble()
                    : 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide:
                BorderSide(color: this.labelColor ?? this.textColor, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
