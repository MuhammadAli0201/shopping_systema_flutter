import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReusableText extends StatefulWidget {
  String? text;
  double? fontSize;
  Color? color;
  var fontWeight;
  ReusableText({this.color,this.text,this.fontSize,this.fontWeight});

  @override
  State<ReusableText> createState() => _ReusableTextState();
}

class _ReusableTextState extends State<ReusableText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text.toString(),style: TextStyle(
      fontFamily: "Ubuntu",
      fontSize: widget.fontSize,
      fontWeight: widget.fontWeight,
      color: widget.color
    ),);
  }
}