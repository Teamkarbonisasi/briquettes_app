import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  final String text;
  final Color? fontColor;
  final double? fontSize;
  final Function() onPressed;

  const TextButtonCustom({
    super.key,
    required this.text,
    this.fontSize,
    this.fontColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
