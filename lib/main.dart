import 'package:bricket_app/firebase_options.dart';
import 'package:bricket_app/screens/main/main_screen.dart';
import 'package:bricket_app/screens/splash/splash_screen.dart';
import 'package:bricket_app/shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _uid = "";

  bool _loading = false;

  Future<void> renderScreen() async {
    setState(() {
      _loading = true;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _uid = prefs.getString('uid') ?? "";
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    renderScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (_uid.isNotEmpty ? const MainScreen() : const SplashScreen()),
    );
  }
}
