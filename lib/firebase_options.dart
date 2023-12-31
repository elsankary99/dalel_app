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
    apiKey: 'AIzaSyDAb-aeXlD-LUIptf7Z5ujv6Bck7d2ZBuA',
    appId: '1:392387576911:web:b31f31d08b699401e3163a',
    messagingSenderId: '392387576911',
    projectId: 'dalel-4aba4',
    authDomain: 'dalel-4aba4.firebaseapp.com',
    storageBucket: 'dalel-4aba4.appspot.com',
    measurementId: 'G-JGCWCKTFT4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrt_GdXVnId2GNF4v_BeHnLmDaRdC3zBw',
    appId: '1:392387576911:android:52879fe499981362e3163a',
    messagingSenderId: '392387576911',
    projectId: 'dalel-4aba4',
    storageBucket: 'dalel-4aba4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBP1LTM4lpD5sF7WTBeiaxpkU0azCe_b_g',
    appId: '1:392387576911:ios:febee3c1d9079001e3163a',
    messagingSenderId: '392387576911',
    projectId: 'dalel-4aba4',
    storageBucket: 'dalel-4aba4.appspot.com',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBP1LTM4lpD5sF7WTBeiaxpkU0azCe_b_g',
    appId: '1:392387576911:ios:6d62cb834f3b38fee3163a',
    messagingSenderId: '392387576911',
    projectId: 'dalel-4aba4',
    storageBucket: 'dalel-4aba4.appspot.com',
    iosBundleId: 'com.example.test.RunnerTests',
  );
}
