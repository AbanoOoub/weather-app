import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaiO7C755ThEyunCzu7ixE5dehpZOiLdM',
    appId: '1:607825115804:android:af37ae674718a399564b59',
    messagingSenderId: '607825115804',
    projectId: 'weather-bc022',
    storageBucket: 'weather-bc022.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiU5cyyM4PA0pcsPAyRQxSZ1cmc5IWtAs',
    appId: '1:607825115804:ios:59fe3bdcb9516392564b59',
    messagingSenderId: '607825115804',
    projectId: 'weather-bc022',
    storageBucket: 'weather-bc022.appspot.com',
    iosClientId: '607825115804-qm3c5h2ks68h9nomgtb78kb95b5hgbjb.apps.googleusercontent.com',
    iosBundleId: 'com.example.weatherApp',
  );
}
