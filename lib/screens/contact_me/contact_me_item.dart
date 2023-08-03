import 'package:bricket_app/shared/theme.dart';
import 'package:flutter/material.dart';

class ContactMeItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactMeItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: buttonColor,
            size: 32.0,
          ),
          const SizedBox(width: 10.0),
          SizedBox(
            width: size.width * 0.5,
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
