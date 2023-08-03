import 'dart:async';

import 'package:bricket_app/screens/activity/activity_screen.dart';
import 'package:bricket_app/screens/dashboard/dashboard_screen.dart';
import 'package:bricket_app/screens/profile/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  BuildContext context;

  final DatabaseReference _sensorRef = FirebaseDatabase.instance.ref('sensors');
  final _fireStore = FirebaseFirestore.instance;
  late StreamSubscription<DatabaseEvent> streamTemp;
  late StreamSubscription<DatabaseEvent> streamSmoke;
  late StreamSubscription<DatabaseEvent> streamRecord;
  late StreamSubscription<DatabaseEvent> streamHistories;
  late StreamSubscription<DatabaseEvent> streamMonitor;

  late num _temperature = 0;
  late num _smoke = 0;
  late bool _sensorState = false;
  late List _histories = [];
  late List _historyId = [];
  late String _name = "";
  int _activeIndex = 0;
  bool _isOffline = false;

  bool get getIsOffline => _isOffline;

  num get getTemperature => _temperature;

  num get getSmoke => _smoke;

  bool get getSensorState => _sensorState;

  List get getHistories => _histories;

  List get getHistoryId => _historyId;

  String get getName => _name;

  int get getActiveIndex => _activeIndex;

  set setActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  static final List<Widget> _screens = [
    const DashboardScreen(),
    const ActivityScreen(),
    ProfileScreen()
  ];

  List<Widget> get getScreens => _screens;

  Timer? _timer;

  void _setOffline() {
    _isOffline = true;
    // stopRecord();
    notifyListeners();
  }

  void _startDelay() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(seconds: 30), _setOffline);
  }

  MainProvider(this.context) {
    subscribe();
    getDataUser();
  }

  Future<void> getDataUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String uid = prefs.getString('uid') ?? '';

      final DocumentSnapshot response =
          await _fireStore.collection('users').doc(uid).get();

      final data = response.data() as Map<String, dynamic>;

      _name = '${data['firstName']} ${data['lastName']}';
      notifyListeners();
    } catch (error) {
      // error
    }
  }

  Future<void> stopRecord() async {
    final prefs = await SharedPreferences.getInstance();
    final sensor = _sensorRef.child(prefs.getString('uid') ?? '');

    sensor.update({
      "recording": false,
    });
  }

  Future<void> subscribe() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final sensor = _sensorRef.child(prefs.getString('uid') ?? '');

      streamTemp = sensor
          .child('monitor')
          .child("suhu")
          .onValue
          .listen((DatabaseEvent event) {
        _temperature = event.snapshot.value as num;
        notifyListeners();
      });

      streamSmoke = sensor
          .child('monitor')
          .child("smoke")
          .onValue
          .listen((DatabaseEvent event) {
        _smoke = event.snapshot.value as num;
        notifyListeners();
      });

      streamRecord =
          sensor.child("recording").onValue.listen((DatabaseEvent event) {
        _sensorState = event.snapshot.value as bool;
        notifyListeners();
      });

      streamMonitor =
          sensor.child('monitor').onValue.listen((DatabaseEvent event) {
        _startDelay();
        _isOffline = false;
        notifyListeners();
      });

      final checkHistories = await sensor.child("histories").get();

      if (checkHistories.exists) {
        streamHistories = sensor.child("histories").onValue.listen(
          (DatabaseEvent event) {
            _histories = [];
            for (final child in event.snapshot.children) {
              _histories.add(child.value);
            }

            _historyId = [];
            for (final child in event.snapshot.children) {
              _historyId.add(child.key);
            }
          },
        );
      }
    } catch (_) {
      // error
    }
  }

  Future<void> changeRecording() async {
    if (_isOffline) return;

    final prefs = await SharedPreferences.getInstance();
    final sensor = _sensorRef.child(prefs.getString('uid') ?? '');

    sensor.update({
      "recording": !_sensorState,
    });
  }

  void unsubscribe() {
    streamTemp.cancel();
    streamRecord.cancel();
    streamSmoke.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    unsubscribe();
  }
}
