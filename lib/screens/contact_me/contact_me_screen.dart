import 'package:bricket_app/screens/contact_me/avatar_item.dart';
import 'package:bricket_app/screens/contact_me/contact_me_appbar.dart';
import 'package:bricket_app/screens/contact_me/contact_me_item.dart';
import 'package:flutter/material.dart';

class ContactMeScreen extends StatelessWidget {
  ContactMeScreen({super.key});

  final List<Map<String, dynamic>> _contacts = [
    {
      "icon": Icons.phone,
      "text": "083146937016",
    },
    {
      "icon": Icons.mail,
      "text": "teamkarbonisasi@gmail.com",
    },
    {
      "icon": Icons.location_on,
      "text": "Telkom University",
    }
  ];

  final List<Map<String, String>> _avatars = [
    {
      "name": "Muhammad Ijlal Fajari",
      "nim": "1101194210",
      "image": "assets/images/avatar_ijal.jpg"
    },
    {
      "name": "Venzen Reubenneo Widjaya",
      "nim": "1101194389",
      "image": "assets/images/avatar_venzen.jpg"
    },
    {
      "name": "Zidane Mahadika Alifattah",
      "nim": "1101194384",
      "image": "assets/images/avatar_zidane.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 80),
        child: ContactMeAppbar(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 18.0),
        children: [
          Image.asset(
            'assets/images/image_logo.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 14.0),
          ..._avatars.map((item) {
            return AvatarItem(
              name: item["name"]!,
              nim: item["nim"]!,
              imageUrl: item["image"]!,
            );
          }),
          const SizedBox(height: 14.0),
          ..._contacts.map((item) {
            return ContactMeItem(
              icon: item["icon"]!,
              text: item["text"]!,
            );
          }).toList(),
        ],
      ),
    );
  }
}
