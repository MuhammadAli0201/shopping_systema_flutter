import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
class ReusableTextFormField extends StatefulWidget {
  String? hintText;
  String? initialValue;
  TextEditingController? controller;
  var icon;
  TextInputType? keyboardType;
  ReusableTextFormField(
      {this.keyboardType,this.initialValue, this.hintText, this.controller, this.icon});

  @override
  State<ReusableTextFormField> createState() => _ReusableTextFormFieldState();
}

class _ReusableTextFormFieldState extends State<ReusableTextFormField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //initialValue: widget.initialValue==null?"":widget.initialValue,
      controller: widget.controller,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontFamily: "Raleway"),
        icon: widget.icon,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: secondaryColor)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: secondaryColor)),
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
