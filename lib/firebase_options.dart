// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGQuhXAaeDANHcY_vHen6LZRZd2I8-k9s',
    appId: '1:2468642422:android:27cd1155763ae40a63a957',
    messagingSenderId: '2468642422',
    projectId: 'team-karbonisasi',
    databaseURL:
        'https://team-karbonisasi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'team-karbonisasi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1qSc0KYoBVGYfhUReNh7uRS4fTZzgiyg',
    appId: '1:2468642422:ios:37df47a2bd6072da63a957',
    messagingSenderId: '2468642422',
    projectId: 'team-karbonisasi',
    databaseURL:
        'https://team-karbonisasi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'team-karbonisasi.appspot.com',
    iosClientId:
        '2468642422-f15r5042ao6kqujrlj8n6fmbdg1tgmlj.apps.googleusercontent.com',
    iosBundleId: 'com.example.bricketApp',
  );
}