import 'package:bricket_app/shared/theme.dart';
import 'package:flutter/material.dart';

class HelpCenterItem extends StatelessWidget {
  final String text;
  final Function() onTap;

  const HelpCenterItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
