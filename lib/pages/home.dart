import 'package:ayurveda_app/Widgets/item.dart';
import 'package:ayurveda_app/classes/MedicineData.dart';
import 'package:ayurveda_app/constants/color.dart';
import 'package:ayurveda_app/pages/appoinment.dart';
import 'package:ayurveda_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF7FC),
      appBar: AppBar(
        title: Text('Ayurveda',
            style: TextStyle(
                color: white, fontSize: 25, fontWeight: FontWeight.w700)),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppoinmentPage(),
                        ));
                  },
                  icon: const Icon(Icons.assignment))),
          ElevatedButton(
              onPressed: () {
                _auth.signOut().then((value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    )));
              },
              child: Text('Log out'))
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: (1.5 / 0.4),
          children: medicine.map((data) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ItemContainer(
                name: data.name,
                preferences: data.preferences,
                image: data.image,
                use: data.use,
                descrpition: data.descrpition,
                benefits: data.benefits,
                effect: data.effect,
                buy: data.buy,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
