import 'package:bricket_app/screens/main/main_screen.dart';
import 'package:bricket_app/shared/enum.dart';
import 'package:bricket_app/widgets/dialog/alert_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _loading = false;
  String _email = "";
  String _password = "";

  BuildContext context;

  LoginProvider(this.context);

  bool get getLoading => _loading;

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> proccessLogin() async {
    try {
      setLoading = true;

      final prefs = await SharedPreferences.getInstance();

      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      prefs.setString('uid', response.user!.uid);

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const MainScreen();
          },
        ),
        (route) => false,
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
