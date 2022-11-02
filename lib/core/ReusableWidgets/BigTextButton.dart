import 'package:flutter/material.dart';

import 'ReusableTextButton.dart';

class bigTextButton extends StatefulWidget {
  String? text;
  Color? textcolor;
  double? fontSize;
  Color? backgroundColor;
  Function()? onPressed;
  bigTextButton(
      {this.text,
      this.backgroundColor,
    required  this.onPressed,
      this.textcolor,
      this.fontSize});
  @override
  State<bigTextButton> createState() => _bigTextButtonState();
}

class _bigTextButtonState extends State<bigTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: double.infinity,
        child: ReusableTextButton(
          text: widget.text,
          backgroundColor: widget.backgroundColor,
          textcolor: widget.textcolor,
          fontSize: widget.fontSize,
          onPressed: widget.onPressed,
        ));
  }
}
