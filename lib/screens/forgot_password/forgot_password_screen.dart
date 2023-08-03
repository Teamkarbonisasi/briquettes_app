import 'package:bricket_app/providers/forgot_password_provider.dart';
import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/appbar/leading_custom.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:bricket_app/widgets/inputs/input_text_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordProvider(context),
      child: Scaffold(
        appBar: AppBar(
          leading: const LeadingCustom(),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            children: [
              const Text(
                "Forgot Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48.0),
              // input email
              Consumer<ForgotPasswordProvider>(
                builder: (context, state, _) {
                  return Column(
                    children: [
                      InputTextCustom(
                        onChanged: (value) => {state.setEmail = value},
                        backgroundColor: secondaryColor,
                        hintText: "Email",
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 48.0),

              Consumer<ForgotPasswordProvider>(
                builder: (context, state, _) {
                  return ElevatedButtonCustom(
                    text: "Kirim Email",
                    fontSize: 18,
                    loading: state.getLoading,
                    padding: const EdgeInsets.all(14.0),
                    onPressed: state.processSendEmail,
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
