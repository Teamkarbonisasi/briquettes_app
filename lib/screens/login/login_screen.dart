import 'package:bricket_app/providers/login_provider.dart';
import 'package:bricket_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:bricket_app/screens/register/register_screen.dart';
import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/appbar/leading_custom.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:bricket_app/widgets/buttons/text_button_custom.dart';
import 'package:bricket_app/widgets/inputs/input_password_custom.dart';
import 'package:bricket_app/widgets/inputs/input_text_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void moveToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const RegisterScreen();
        },
      ),
    );
  }

  void moveToForgotPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ForgotPasswordScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(context),
      child: Scaffold(
        appBar: AppBar(
          leading: const LeadingCustom(),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            children: [
              const Text(
                "Login Pengguna",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48.0),
              // input email
              Consumer<LoginProvider>(
                builder: (context, state, _) {
                  return Column(
                    children: [
                      InputTextCustom(
                        onChanged: (value) => state.setEmail = value,
                        backgroundColor: secondaryColor,
                        hintText: "Email",
                      ),
                      const SizedBox(height: 42.0),
                      InputPasswordCustom(
                        onChanged: (value) => state.setPassword = value,
                        backgroundColor: secondaryColor,
                        hintText: "Password",
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButtonCustom(
                    text: "Forgot Password?",
                    fontColor: blueColor,
                    fontSize: 16.0,
                    onPressed: () => moveToForgotPassword(context),
                  ),
                ],
              ),
              const SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Belum punya akun?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  TextButtonCustom(
                    text: "Daftar",
                    fontColor: const Color(0xff04454d),
                    fontSize: 16.0,
                    onPressed: () => moveToRegister(context),
                  ),
                ],
              ),
              const SizedBox(height: 48.0),

              Consumer<LoginProvider>(
                builder: (context, state, _) {
                  return ElevatedButtonCustom(
                    text: "Login",
                    fontSize: 18,
                    padding: const EdgeInsets.all(14.0),
                    loading: state.getLoading,
                    onPressed: state.proccessLogin,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
