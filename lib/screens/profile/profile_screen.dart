import 'package:bricket_app/screens/detail_profile/detail_profile_screen.dart';
import 'package:bricket_app/screens/guide/guide_screen.dart';
import 'package:bricket_app/screens/help_center/help_center_screen.dart';
import 'package:bricket_app/screens/profile/profile_item.dart';
import 'package:bricket_app/screens/splash/splash_screen.dart';
import 'package:bricket_app/shared/enum.dart';
import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:bricket_app/widgets/dialog/alert_custom.dart';
import 'package:bricket_app/widgets/dialog/confirm_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void moveToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetailProfileScreen(),
      ),
    );
  }

  void moveToHelpCenter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HelpCenterScreen(),
      ),
    );
  }

  void moveToGuide(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GuideScreen(),
      ),
    );
  }

  Future<void> clearUid(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      prefs.clear();
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertCustom(
            type: DialogType.warning,
            description: error.toString(),
          );
        },
      );
    }
  }

  void openConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmCustom(
          description: "Apakah anda yakin ingin keluar?",
          onTap: () => processLogout(context),
        );
      },
    );
  }

  Future<void> processLogout(BuildContext context) async {
    try {
      await _auth.signOut();

      await clearUid(context);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
        (_) => false,
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertCustom(
            type: DialogType.warning,
            description: error.toString(),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 24.0),
          width: size.width,
          color: secondaryColor,
          child: const Text(
            "Akun Saya",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ProfileItem(
          text: "Profil saya",
          onPressed: () => moveToProfile(context),
        ),
        ProfileItem(
          text: "Pusat bantuan",
          onPressed: () => moveToHelpCenter(context),
        ),
        ProfileItem(
          text: "Panduan membuat bricket",
          onPressed: () => moveToGuide(context),
        ),
        const SizedBox(height: 80.0),
        ElevatedButtonCustom(
          text: "Logout",
          fontSize: 18.0,
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 64.0,
          ),
          onPressed: () => openConfirmDialog(context),
        ),
      ],
    );
  }
}
