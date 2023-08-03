import 'package:bricket_app/shared/theme.dart';
import 'package:flutter/material.dart';

class AppbarMainCustom extends StatelessWidget {
  final String fullname;
  final bool isOffline;

  const AppbarMainCustom({
    super.key,
    required this.fullname,
    required this.isOffline,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Row(
        children: [
          Image.asset(
            'assets/images/image_logo_circle.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          Text(
            fullname,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          )
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Icon(
            Icons.circle,
            color: isOffline ? Colors.red : Colors.green,
          ),
        ),
      ],
    );
  }
}
