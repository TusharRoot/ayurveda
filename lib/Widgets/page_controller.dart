// ignore_for_file: avoid_print
import 'package:ayurveda_app/pages/home.dart';
import 'package:ayurveda_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GooglePageController extends StatefulWidget {
  const GooglePageController({super.key});

  @override
  _GooglePageControllerState createState() => _GooglePageControllerState();
}

class _GooglePageControllerState extends State<GooglePageController> {
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print("----------We are in Connection State-----------");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            print("-----------We are in Start Page-----------");
            return const HomePage();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!!'));
          } else {
            print('-----------we are in SignIn / SignOut Page--------------');
            return const LoginPage();
          }
        },
      ),
    );
  }
}
