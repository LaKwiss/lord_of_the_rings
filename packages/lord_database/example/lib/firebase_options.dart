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
    apiKey: 'AIzaSyCUQxNBv6HoNmsmod-EPA0ecONJa16bBWA',
    appId: '1:943834015538:web:d702e92ed23db1a1bd192b',
    messagingSenderId: '943834015538',
    projectId: 'lord-of-the-rings-card-game',
    authDomain: 'lord-of-the-rings-card-game.firebaseapp.com',
    databaseURL: 'https://lord-of-the-rings-card-game-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'lord-of-the-rings-card-game.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3-X2Zj6igac_pVs8kKxx0awM9Ulrtqmc',
    appId: '1:943834015538:android:28a9715ff4f0506abd192b',
    messagingSenderId: '943834015538',
    projectId: 'lord-of-the-rings-card-game',
    databaseURL: 'https://lord-of-the-rings-card-game-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'lord-of-the-rings-card-game.appspot.com',
  );
}
