import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
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
    apiKey: 'AIzaSyAJ1SgW-eG-lBFlNZV0zq3GgQoyGJ7xpPA',
    appId: '1:60142079126:web:b345d526828971b52e46b7',
    messagingSenderId: '60142079126',
    projectId: 'social-app-68c71',
    authDomain: 'social-app-68c71.firebaseapp.com',
    storageBucket: 'social-app-68c71.appspot.com',
    measurementId: 'G-LVPLBDJYWN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzjjoR500BmlGZHFREBuIeJrfSP_X6td4',
    appId: '1:60142079126:android:ff6fa15c623726772e46b7',
    messagingSenderId: '60142079126',
    projectId: 'social-app-68c71',
    storageBucket: 'social-app-68c71.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC80XXF5661erWkO4ChqDR4L8qUHYz3fx8',
    appId: '1:60142079126:ios:07fe52cf71967d1d2e46b7',
    messagingSenderId: '60142079126',
    projectId: 'social-app-68c71',
    storageBucket: 'social-app-68c71.appspot.com',
    iosClientId: '60142079126-ackp0tcj0fmo4nf4pnr2autu15phgrfd.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC80XXF5661erWkO4ChqDR4L8qUHYz3fx8',
    appId: '1:60142079126:ios:07fe52cf71967d1d2e46b7',
    messagingSenderId: '60142079126',
    projectId: 'social-app-68c71',
    storageBucket: 'social-app-68c71.appspot.com',
    iosClientId: '60142079126-ackp0tcj0fmo4nf4pnr2autu15phgrfd.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialApp',
  );
}
