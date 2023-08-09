import 'package:flutter/material.dart';
import 'package:review/util/Colors.dart';

class RoundedTextBox extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final double padding;
  final int maxCharacters;

  RoundedTextBox({
    required this.hintText,
    required this.controller,
    this.borderColor = Colors.black,
    this.borderRadius = 10.0,
    this.borderWidth = 1.0,
    this.padding = 10.0,
    this.maxCharacters = 100,
  });

  @override
  State<RoundedTextBox> createState() => _RoundedTextBoxState();
}

class _RoundedTextBoxState extends State<RoundedTextBox> {

  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: _focusNode.hasFocus ? themeColor : widget.borderColor,
          width: widget.borderWidth,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        maxLength: widget.maxCharacters,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          counterText: ''
        ),
      ),
    );
  }
}