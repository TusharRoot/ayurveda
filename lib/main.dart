// ignore_for_file: prefer_const_constructors

import 'package:ayurveda_app/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(
            options: FirebaseOptions(
          apiKey: "AIzaSyAp8TxV-r7yfxkrCsdCxyBeGV4bIHrVH4M",
          appId: '1:806948893358:android:a2172acaafaeb07056733f',
          messagingSenderId: "AIzaSyAp8TxV-r7yfxkrCsdCxyBeGV4bIHrVH4M",
          projectId: "AIzaSyAp8TxV-r7yfxkrCsdCxyBeGV4bIHrVH4M",
        )),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('error');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginPage();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
