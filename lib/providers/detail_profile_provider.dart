import 'package:bricket_app/shared/enum.dart';
import 'package:bricket_app/widgets/dialog/alert_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailProfileProvider extends ChangeNotifier {
  BuildContext context;

  final _fireStore = FirebaseFirestore.instance;
  bool _isEdit = false;
  bool _loading = false;

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phoneNumber = '';

  String get getFisrtName => _firstName;

  String get getLastName => _lastName;

  String get getEmail => _email;

  String get getPhoneNumber => _phoneNumber;

  bool get getIsEdit => _isEdit;

  bool get getLoading => _loading;

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  set setIsEdit(bool isEdit) {
    _isEdit = isEdit;
    notifyListeners();
  }

  set setFirstName(String firstName) {
    _firstName = firstName;
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

  set setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  DetailProfileProvider(this.context) {
    getProfile();
  }

  Future<void> handleUpdate(context) async {
    try {
      setLoading = true;

      final prefs = await SharedPreferences.getInstance();

      CollectionReference data = _fireStore.collection('users');

      await data.doc(prefs.getString('uid')).update({
        'firstName': _firstName,
        'lastName': _lastName,
        'email': _email,
        'phoneNumber': _phoneNumber,
      });

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertCustom(
            type: DialogType.success,
            description: "Data profil anda telah berhasil diperbarui.",
          );
        },
      );

      setIsEdit = false;
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

  Future<void> getProfile() async {
    try {
      setLoading = true;

      final prefs = await SharedPreferences.getInstance();

      final DocumentSnapshot response = await _fireStore
          .collection('users')
          .doc(prefs.getString('uid'))
          .get();

      _firstName = response.get('firstName');
      _lastName = response.get('lastName');
      _email = response.get('email');
      _phoneNumber = response.get('phoneNumber');
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
