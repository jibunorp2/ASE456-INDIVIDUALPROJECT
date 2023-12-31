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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBW6PBb77JltVbb98a4AiVinauy3Qy9qd4',
    appId: '1:205004215348:web:cc6323350c499bfaff6661',
    messagingSenderId: '205004215348',
    projectId: 'prosper-ase456-h8-v1',
    authDomain: 'prosper-ase456-h8-v1.firebaseapp.com',
    storageBucket: 'prosper-ase456-h8-v1.appspot.com',
    measurementId: 'G-JGCEDZWFE3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4fw-p_FOAxXuzImmoIAuzHqrL4_b5r6A',
    appId: '1:205004215348:android:d017df07d8d8cc6fff6661',
    messagingSenderId: '205004215348',
    projectId: 'prosper-ase456-h8-v1',
    storageBucket: 'prosper-ase456-h8-v1.appspot.com',
  );
}
