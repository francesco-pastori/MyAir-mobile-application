import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBB8-AjzBJM58o2_-IEpCYGD7bZEhivPwQ",
            authDomain: "air-quality-monitoring-akt34k.firebaseapp.com",
            projectId: "air-quality-monitoring-akt34k",
            storageBucket: "air-quality-monitoring-akt34k.appspot.com",
            messagingSenderId: "522315001318",
            appId: "1:522315001318:web:d28c80280a2bca82c9fa27"));
  } else {
    await Firebase.initializeApp();
  }
}
