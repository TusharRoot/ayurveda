// ignore_for_file: use_build_context_synchronously

import 'package:ayurveda_app/constants/color.dart';
import 'package:ayurveda_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentification();
  }

  login() async {
    UserCredential user = await _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  register() async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: _email, password: _password);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login',
              style: TextStyle(
                  color: white, fontSize: 25, fontWeight: FontWeight.w700)),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  onChanged: (input) => _email = input,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  onChanged: (input) => _password = input,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        _auth
                            .signInWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                )));
                      },
                      child: const Text('Login')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        _auth
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                )));
                      },
                      child: const Text('Register')),
                )
              ],
            ),
          ),
        )));
  }
}
