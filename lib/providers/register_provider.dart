import 'package:bricket_app/screens/register/register_success.dart';
import 'package:bricket_app/shared/enum.dart';
import 'package:bricket_app/widgets/dialog/alert_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final BuildContext context;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  RegisterProvider(this.context);

  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _phoneNumber = "";

  bool _loading = false;

  bool get getLoading => _loading;

  set setFirstName(String firsrtName) {
    _firstName = firsrtName;
    notifyListeners();
  }

  set setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  set setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  set setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  bool validateEmpty() {
    if (_firstName.isEmpty ||
        _lastName.isEmpty ||
        _email.isEmpty ||
        _password.isEmpty ||
        _confirmPassword.isEmpty ||
        _phoneNumber.isEmpty) {
      return false;
    }

    return true;
  }

  bool validatePassword() {
    if (_password != _confirmPassword) {
      return false;
    }

    return true;
  }

  Future<void> proccessRegister() async {
    try {
      setLoading = true;

      if (!validateEmpty()) {
        throw "Sepertinya ada data yang belum diisi.";
      }

      if (!validatePassword()) {
        throw "Password dan konfirmasi password harus sama.";
      }

      final UserCredential response =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      await _firebaseFirestore.collection('users').doc(response.user!.uid).set(
        {
          'firstName': _firstName,
          'lastName': _lastName,
          'email': _email,
          'phoneNumber': _phoneNumber,
        },
      );

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return const RegisterSuccess();
        }),
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
