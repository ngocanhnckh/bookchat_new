// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAN50_I9DhpC1VekKLTqLW0R7k2P6epKcU',
    appId: '1:474265766812:web:bb9eae4209c9d28df91659',
    messagingSenderId: '474265766812',
    projectId: 'book-chat-web',
    authDomain: 'book-chat-web.firebaseapp.com',
    storageBucket: 'book-chat-web.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBEn_wPQJ8563m5YbvqFeYt0_1Qm0TCKA',
    appId: '1:474265766812:android:4bcde412fc7a8d2ff91659',
    messagingSenderId: '474265766812',
    projectId: 'book-chat-web',
    storageBucket: 'book-chat-web.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7KdUNgnmMGcGOydz4WB5zdjRsnXFaZbE',
    appId: '1:474265766812:ios:44776c57b844ae1ff91659',
    messagingSenderId: '474265766812',
    projectId: 'book-chat-web',
    storageBucket: 'book-chat-web.appspot.com',
    iosClientId: '474265766812-lvavt582gimlh5vpstbc6f192delb5cu.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookChat',
  );
}