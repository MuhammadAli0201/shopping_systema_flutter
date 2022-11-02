import 'package:flutter/material.dart';

class ReusableTextButton extends StatefulWidget {
  String? text;
  Color? textcolor;
  double? fontSize;
  Color? backgroundColor;
  var fontWeight;
  Function()? onPressed;
  ReusableTextButton(
      {this.fontWeight,
      this.text,
      this.backgroundColor,
      this.onPressed,
      this.textcolor,
      this.fontSize});

  @override
  State<ReusableTextButton> createState() => _ReusableTextButtonState();
}

class _ReusableTextButtonState extends State<ReusableTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStateProperty.all(widget.backgroundColor)),
        child: Text(widget.text.toString(),
            style: TextStyle(
                fontSize: widget.fontSize,
                color:
                    widget.textcolor == null ? Colors.white : widget.textcolor,
                fontFamily: "Raleway",
                fontWeight: widget.fontWeight)));
  }
}
