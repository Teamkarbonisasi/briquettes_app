import 'package:bricket_app/shared/enum.dart';
import 'package:bricket_app/widgets/dialog/alert_custom.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailActivityProvider extends ChangeNotifier {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final BuildContext context;
  final String activityId;
  List _list = [];

  bool _loading = false;

  DetailActivityProvider({
    required this.context,
    required this.activityId,
  }) {
    getData();
  }

  bool get getLoading => _loading;

  List get getListSuhu => _list.map(
        (item) {
          final int index = _list.indexOf(item);
          return {
            "domain": index,
            "measure": item["suhu"]!,
          };
        },
      ).toList();

  List get getListSmoke => _list.map(
        (item) {
          final int index = _list.indexOf(item);
          return {
            "domain": index,
            "measure": item["smoke"]!,
          };
        },
      ).toList();

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> getData() async {
    setLoading = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final String uid = prefs.getString("uid") ?? "";

      final data = await _firebaseDatabase
          .ref("sensors")
          .child(uid)
          .child("histories")
          .child(activityId)
          .child("data")
          .get();

      if (data.exists) {
        _list = [];
        for (final child in data.children) {
          _list.add(child.value);
        }
      }
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
