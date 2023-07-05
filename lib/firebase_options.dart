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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBL5AF9K2wmNj0O6alhbi1eQ-t7OAEVsYE',
    appId: '1:610914110087:web:e6143ff1e940e28f1f0622',
    messagingSenderId: '610914110087',
    projectId: 'notes-e1a86',
    authDomain: 'notes-e1a86.firebaseapp.com',
    storageBucket: 'notes-e1a86.appspot.com',
    measurementId: 'G-0R6ED7F15J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXUYjHrVZkx-r7w95FCOdlPDX9mZyy4RQ',
    appId: '1:610914110087:android:e9b4d3abb021d3021f0622',
    messagingSenderId: '610914110087',
    projectId: 'notes-e1a86',
    storageBucket: 'notes-e1a86.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPuP9RjLaC4oNIgWz1gOvGnZI5yFaLAKM',
    appId: '1:610914110087:ios:5ee73b14672a3f761f0622',
    messagingSenderId: '610914110087',
    projectId: 'notes-e1a86',
    storageBucket: 'notes-e1a86.appspot.com',
    iosClientId: '610914110087-erlc4pl4gaakh5sker29uinb85hgqi0e.apps.googleusercontent.com',
    iosBundleId: 'com.example.notes',
  );
}