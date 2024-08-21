import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/biodatascreen.dart';
import 'package:portfolio/ui/landingpage.dart';
import 'package:portfolio/ui/newscreen.dart';
import 'package:portfolio/ui/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
        apiKey: "AIzaSyBPzLHwmm2BJQIlujlkZ4w9-V-wEuP-Z5o",
         authDomain: "ecommerce-3ad0e.firebaseapp.com",
          projectId: "ecommerce-3ad0e",
        storageBucket: "ecommerce-3ad0e.appspot.com",
         messagingSenderId: "727831402280",
        appId: "1:727831402280:web:0e76a3cd3e11f525f0221d",
     measurementId: "G-F82T8E6E5G"
    ),
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BioDataScreen(),

    );
  }
}



