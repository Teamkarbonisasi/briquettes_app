import 'package:flutter/material.dart';

class LeadingCustom extends StatelessWidget {
  const LeadingCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Navigator.canPop(context)
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Image.asset(
                "assets/images/image_back.png",
                width: 20,
                height: 20,
              ),
            )
          : null,
    );
  }
}
