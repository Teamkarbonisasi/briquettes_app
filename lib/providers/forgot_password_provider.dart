import 'package:bricket_app/shared/enum.dart';
import 'package:bricket_app/widgets/dialog/alert_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final BuildContext context;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _loading = false;

  String _email = "";

  ForgotPasswordProvider(this.context);

  bool get getLoading => _loading;

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  Future<void> processSendEmail() async {
    setLoading = true;
    try {
      if (_email.isEmpty) {
        throw "Email harus diisi";
      }
      await _firebaseAuth.sendPasswordResetEmail(email: _email);

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertCustom(
            type: DialogType.success,
            description: "Email sudah dikirim, silahkan periksa email anda.",
          );
        },
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
    } finally {
      setLoading = false;
    }
  }
}
