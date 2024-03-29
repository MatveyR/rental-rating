// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCfPp1mMkUnVXR0zkb1mRgAg9mkvHEJ4uM',
    appId: '1:462300643472:web:e25c4b0b7263dbd5ed5815',
    messagingSenderId: '462300643472',
    projectId: 'rental-rating-eb959',
    authDomain: 'rental-rating-eb959.firebaseapp.com',
    storageBucket: 'rental-rating-eb959.appspot.com',
    measurementId: 'G-1LCG7DZN52',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUHattbdCknbJzkMr_GIBdlV-jyYN8PGk',
    appId: '1:462300643472:android:9d75a9cc2afcde65ed5815',
    messagingSenderId: '462300643472',
    projectId: 'rental-rating-eb959',
    storageBucket: 'rental-rating-eb959.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBacnVbcII1pGYnN3hZznNcIUs0EHvAzHY',
    appId: '1:462300643472:ios:6be8f866acc40590ed5815',
    messagingSenderId: '462300643472',
    projectId: 'rental-rating-eb959',
    storageBucket: 'rental-rating-eb959.appspot.com',
    iosBundleId: 'com.insomnic.rentalRating',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBacnVbcII1pGYnN3hZznNcIUs0EHvAzHY',
    appId: '1:462300643472:ios:86476036b1fa847fed5815',
    messagingSenderId: '462300643472',
    projectId: 'rental-rating-eb959',
    storageBucket: 'rental-rating-eb959.appspot.com',
    iosBundleId: 'com.insomnic.rentalRating.RunnerTests',
  );
}
