import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'main_homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAjxK6Kq_yKYYX0FYorgCUBA7uHZUJMuyI",
        appId: "com.example.firebase_lecture_cc",
        messagingSenderId: "790553448833",
        projectId: "fir-lecture-cc",
        storageBucket: "fir-lecture-cc.appspot.com"
    ),
  );
  runApp(const MaterialApp(
    home: MainHomepage(),
  ));
}

