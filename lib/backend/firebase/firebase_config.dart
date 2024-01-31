import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCzqC-jQXae-QnWbog6AyA24SKF3-jaLmk",
            authDomain: "mi-chat-qbul4q.firebaseapp.com",
            projectId: "mi-chat-qbul4q",
            storageBucket: "mi-chat-qbul4q.appspot.com",
            messagingSenderId: "501320318239",
            appId: "1:501320318239:web:9d387e882e61c2c66d442a"));
  } else {
    await Firebase.initializeApp();
  }
}
