import 'package:bricket_app/providers/register_provider.dart';
import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/appbar/leading_custom.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:bricket_app/widgets/inputs/input_password_custom.dart';
import 'package:bricket_app/widgets/inputs/input_text_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(context),
      child: Scaffold(
        appBar: AppBar(
          leading: const LeadingCustom(),
        ),
        body: Center(
          child: Consumer<RegisterProvider>(
            builder: (context, state, _) {
              return ListView(
                padding: const EdgeInsets.all(14.0),
                children: [
                  const Text(
                    "DAFTAR PENGGUNA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 48.0),
                  InputTextCustom(
                    backgroundColor: secondaryColor,
                    hintText: "Nama Depan",
                    onChanged: (value) => state.setFirstName = value,
                  ),
                  const SizedBox(height: 16.0),
                  InputTextCustom(
                    backgroundColor: secondaryColor,
                    hintText: "Nama Belakang",
                    onChanged: (value) => state.setLastName = value,
                  ),
                  const SizedBox(height: 16.0),
                  InputTextCustom(
                    backgroundColor: secondaryColor,
                    hintText: "Email",
                    onChanged: (value) => state.setEmail = value,
                  ),
                  const SizedBox(height: 16.0),
                  InputPasswordCustom(
                    hintText: "Password",
                    backgroundColor: secondaryColor,
                    onChanged: (value) => state.setPassword = value,
                  ),
                  const SizedBox(height: 16.0),
                  InputPasswordCustom(
                    hintText: "Konfirmasi Password",
                    backgroundColor: secondaryColor,
                    onChanged: (value) => state.setConfirmPassword = value,
                  ),
                  const SizedBox(height: 16.0),
                  InputTextCustom(
                    backgroundColor: secondaryColor,
                    hintText: "Nomor HP",
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => state.setPhoneNumber = value,
                  ),
                  const SizedBox(height: 48.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: ElevatedButtonCustom(
                      text: "Submit",
                      fontSize: 18.0,
                      loading: state.getLoading,
                      padding: const EdgeInsets.all(14.0),
                      onPressed: state.proccessRegister,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
