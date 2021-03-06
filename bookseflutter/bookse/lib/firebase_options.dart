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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCwPfqTGUt_ZyUvLV53MFQl1-9a4vOmm8E',
    appId: '1:907733011192:web:59a3b4b37a9e5dec37c90d',
    messagingSenderId: '907733011192',
    projectId: 'book-se',
    authDomain: 'book-se.firebaseapp.com',
    storageBucket: 'book-se.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDG8hVoBgDdYB0CPmPyhPIqeM6b-NYm8Zg',
    appId: '1:907733011192:android:f2851a13e6623efd37c90d',
    messagingSenderId: '907733011192',
    projectId: 'book-se',
    storageBucket: 'book-se.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOevyK8dzoE7xE4JBGLiYko0V64zWpv5o',
    appId: '1:907733011192:ios:68d79202859b356237c90d',
    messagingSenderId: '907733011192',
    projectId: 'book-se',
    storageBucket: 'book-se.appspot.com',
    iosClientId: '907733011192-jcmh2g0h2qjbug03gbv4ljt143d9p1af.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookse',
  );
}
