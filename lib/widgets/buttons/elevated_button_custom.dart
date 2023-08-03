import 'package:bricket_app/shared/theme.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool loading;
  final Size? size;
  final Color? color;
  final EdgeInsets padding;
  final BorderRadiusGeometry? borderRadius;
  final Function() onPressed;

  const ElevatedButtonCustom({
    super.key,
    required this.text,
    this.fontSize,
    this.size,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 28.0,
      vertical: 10.0,
    ),
    this.color,
    this.borderRadius,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: size,
        backgroundColor: color ?? buttonColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
        ),
      ),
      child: !loading
          ? Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
    );
  }
}
