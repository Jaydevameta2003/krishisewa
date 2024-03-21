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
        return macos;
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
    apiKey: 'AIzaSyAl4qgUl8FNnoUrgFMXCgBe65QuGwkoy20',
    appId: '1:882908321514:web:11fcf6ca11f6f243b9a993',
    messagingSenderId: '882908321514',
    projectId: 'krishisewa-1e244',
    authDomain: 'krishisewa-1e244.firebaseapp.com',
    storageBucket: 'krishisewa-1e244.appspot.com',
    measurementId: 'G-E97ERG6CZ4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAAJnEEDFka81KGQdZsy1mEb1GPuyByco',
    appId: '1:882908321514:android:59612ef3d381b371b9a993',
    messagingSenderId: '882908321514',
    projectId: 'krishisewa-1e244',
    storageBucket: 'krishisewa-1e244.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-i0fCZeI-61txy5ZMSEfGgtk2zxj2AI0',
    appId: '1:882908321514:ios:dd56554be720e797b9a993',
    messagingSenderId: '882908321514',
    projectId: 'krishisewa-1e244',
    storageBucket: 'krishisewa-1e244.appspot.com',
    iosBundleId: 'com.example.krishisewa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-i0fCZeI-61txy5ZMSEfGgtk2zxj2AI0',
    appId: '1:882908321514:ios:bbd2fa91109b2193b9a993',
    messagingSenderId: '882908321514',
    projectId: 'krishisewa-1e244',
    storageBucket: 'krishisewa-1e244.appspot.com',
    iosBundleId: 'com.example.krishisewa.RunnerTests',
  );
}
