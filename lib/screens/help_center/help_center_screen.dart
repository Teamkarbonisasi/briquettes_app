import 'package:bricket_app/screens/contact_me/contact_me_screen.dart';
import 'package:bricket_app/screens/faq/faq_screen.dart';
import 'package:bricket_app/screens/help_center/help_center_appbar.dart';
import 'package:bricket_app/screens/help_center/help_screen_item.dart';
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  void moveToFaq(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FaqScreen(),
      ),
    );
  }

  void moveToContactMe(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactMeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 80),
        child: HelpCenterAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HelpCenterItem(
              text: "FAQ",
              onTap: () => moveToFaq(context),
            ),
            const SizedBox(height: 14),
            HelpCenterItem(
              text: "Hubungi Kami",
              onTap: () => moveToContactMe(context),
            ),
          ],
        ),
      ),
    );
  }
}
