import 'package:bricket_app/screens/login/login_screen.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // pindah ke halaman login
  void moveToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/image_logo.png',
              width: size.width * 0.5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              width: size.width * 0.8,
              child: const Text(
                "Jadikan sampah daun menjadi suatu yang bermanfaat",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48.0),
            ElevatedButtonCustom(
              text: "Get Started",
              fontSize: 20.0,
              onPressed: () => moveToLogin(context),
            ),
          ],
        ),
      ),
    );
  }
}
