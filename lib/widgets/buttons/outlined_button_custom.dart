import 'package:bricket_app/shared/theme.dart';
import 'package:flutter/material.dart';

class OutlinedButtonCustom extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool loading;
  final Size? size;
  final Color? color;
  final EdgeInsets padding;
  final BorderRadiusGeometry? borderRadius;
  final Function() onPressed;

  const OutlinedButtonCustom({
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
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: size,
        side: BorderSide(color: color ?? buttonColor),
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
        ),
      ),
      child: !loading
          ? Text(
              text,
              style: TextStyle(
                color: color ?? buttonColor,
                fontSize: fontSize,
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: color ?? buttonColor,
              ),
            ),
    );
  }
}
