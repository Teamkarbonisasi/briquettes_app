import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/appbar/leading_custom.dart';
import 'package:flutter/material.dart';

class FaqAppbar extends StatelessWidget {
  const FaqAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      leading: const LeadingCustom(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "FAQ",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 30),
          Image.asset(
            "assets/images/image_help-center.png",
            width: 60.0,
          )
        ],
      ),
      actions: [],
    );
  }
}
