import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDbiwZY1UrW9FZoJOmJDn7U4w0ALq0-XJM",
            authDomain: "meencontra-64c35.firebaseapp.com",
            projectId: "meencontra-64c35",
            storageBucket: "meencontra-64c35.appspot.com",
            messagingSenderId: "133757473516",
            appId: "1:133757473516:web:5c01f2199aaaf848984bc9"));
  } else {
    await Firebase.initializeApp();
  }
}
