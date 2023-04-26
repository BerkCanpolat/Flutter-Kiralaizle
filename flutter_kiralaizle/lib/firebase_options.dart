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
    apiKey: 'AIzaSyDPfZSSq14keH-i96uu9knV2Qh3X8ioSAA',
    appId: '1:938465093399:web:89d91d6a4753422edfb952',
    messagingSenderId: '938465093399',
    projectId: 'flutter-kiralaizle',
    authDomain: 'flutter-kiralaizle.firebaseapp.com',
    storageBucket: 'flutter-kiralaizle.appspot.com',
    measurementId: 'G-QELPPWJCG4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsAnpi6HW3cfyeiFgDSD0CwL0JDGhl40s',
    appId: '1:938465093399:android:b2cf4d418c39c1c6dfb952',
    messagingSenderId: '938465093399',
    projectId: 'flutter-kiralaizle',
    storageBucket: 'flutter-kiralaizle.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcmTT3ltBSOjB7C9O65NYZShhAWfxEoJs',
    appId: '1:938465093399:ios:28b9abcbc3bfc6b9dfb952',
    messagingSenderId: '938465093399',
    projectId: 'flutter-kiralaizle',
    storageBucket: 'flutter-kiralaizle.appspot.com',
    iosClientId: '938465093399-gi86gb38gdsfbkuevspamdjr7bkq135r.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterKiralaizle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcmTT3ltBSOjB7C9O65NYZShhAWfxEoJs',
    appId: '1:938465093399:ios:28b9abcbc3bfc6b9dfb952',
    messagingSenderId: '938465093399',
    projectId: 'flutter-kiralaizle',
    storageBucket: 'flutter-kiralaizle.appspot.com',
    iosClientId: '938465093399-gi86gb38gdsfbkuevspamdjr7bkq135r.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterKiralaizle',
  );
}