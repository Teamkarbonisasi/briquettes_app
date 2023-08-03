import 'package:bricket_app/screens/login/login_screen.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:flutter/material.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Registrasi Berhasil',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: Icon(
                Icons.check,
                size: width,
              ),
            ),
            ElevatedButtonCustom(
              text: 'Login',
              padding: const EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 56.0,
              ),
              fontSize: 18.0,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                  (error) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
