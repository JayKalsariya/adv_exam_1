// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAyU1xuqOs9hMHtPQv-p4WRaZnY8t4Cdjg',
    appId: '1:90161648259:web:260c43e3837806cdb941b6',
    messagingSenderId: '90161648259',
    projectId: 'fire-exam-app',
    authDomain: 'fire-exam-app.firebaseapp.com',
    storageBucket: 'fire-exam-app.appspot.com',
    measurementId: 'G-XP1C6W4SBG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbLPh1d55iR-HiYVMu8fMOtKAr5zKwfi0',
    appId: '1:90161648259:android:9e28c08840f932d8b941b6',
    messagingSenderId: '90161648259',
    projectId: 'fire-exam-app',
    storageBucket: 'fire-exam-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkoq_QfvoJRy8za2tTYIdo5tAqsCeO6Ls',
    appId: '1:90161648259:ios:76a45ca30b69160bb941b6',
    messagingSenderId: '90161648259',
    projectId: 'fire-exam-app',
    storageBucket: 'fire-exam-app.appspot.com',
    iosBundleId: 'com.example.firebaseExam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkoq_QfvoJRy8za2tTYIdo5tAqsCeO6Ls',
    appId: '1:90161648259:ios:76a45ca30b69160bb941b6',
    messagingSenderId: '90161648259',
    projectId: 'fire-exam-app',
    storageBucket: 'fire-exam-app.appspot.com',
    iosBundleId: 'com.example.firebaseExam',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAyU1xuqOs9hMHtPQv-p4WRaZnY8t4Cdjg',
    appId: '1:90161648259:web:57683bff21eb80a9b941b6',
    messagingSenderId: '90161648259',
    projectId: 'fire-exam-app',
    authDomain: 'fire-exam-app.firebaseapp.com',
    storageBucket: 'fire-exam-app.appspot.com',
    measurementId: 'G-55PJBY0JHL',
  );
}
