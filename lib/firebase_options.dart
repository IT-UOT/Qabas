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
    apiKey: 'AIzaSyDfbX4lfgWaeQY_h8tA6J-wWHHr9k45clM',
    appId: '1:613538864977:web:a649eac31c740ae55c7d70',
    messagingSenderId: '613538864977',
    projectId: 'it-mentor-f477c',
    authDomain: 'it-mentor-f477c.firebaseapp.com',
    databaseURL: 'https://it-mentor-f477c-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'it-mentor-f477c.appspot.com',
    measurementId: 'G-B0L9TQ6VHH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKKEi2AaVRBDiFksoAs6JFN4BU99YwAVc',
    appId: '1:613538864977:android:f270d70b5379218c5c7d70',
    messagingSenderId: '613538864977',
    projectId: 'it-mentor-f477c',
    databaseURL: 'https://it-mentor-f477c-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'it-mentor-f477c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0IsFEK3z0xC4o6j-D4pwihmRffNKJusk',
    appId: '1:613538864977:ios:67d6a4c4a2f767f05c7d70',
    messagingSenderId: '613538864977',
    projectId: 'it-mentor-f477c',
    databaseURL: 'https://it-mentor-f477c-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'it-mentor-f477c.appspot.com',
    iosClientId: '613538864977-1gmlniobhh80oqm16ugo33hlrr5bl9so.apps.googleusercontent.com',
    iosBundleId: 'ly.itmentor.itmentor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0IsFEK3z0xC4o6j-D4pwihmRffNKJusk',
    appId: '1:613538864977:ios:67d6a4c4a2f767f05c7d70',
    messagingSenderId: '613538864977',
    projectId: 'it-mentor-f477c',
    databaseURL: 'https://it-mentor-f477c-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'it-mentor-f477c.appspot.com',
    iosClientId: '613538864977-1gmlniobhh80oqm16ugo33hlrr5bl9so.apps.googleusercontent.com',
    iosBundleId: 'ly.itmentor.itmentor',
  );
}
