import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyArUBOlB0pWCKMpTFjSNQFt4rWOS4twubI",
            authDomain: "allegroconnect-5bd2e.firebaseapp.com",
            projectId: "allegroconnect-5bd2e",
            storageBucket: "allegroconnect-5bd2e.firebasestorage.app",
            messagingSenderId: "512799317433",
            appId: "1:512799317433:web:b04e3ac5e65c2765fbaa68"));
  } else {
    await Firebase.initializeApp();
  }
}
