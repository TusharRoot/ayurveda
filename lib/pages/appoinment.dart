import 'package:ayurveda_app/classes/DoctorData.dart';
import 'package:ayurveda_app/constants/color.dart';
import 'package:ayurveda_app/constants/style.dart';
import 'package:ayurveda_app/pages/mailPage.dart';
import 'package:flutter/material.dart';

class AppoinmentPage extends StatefulWidget {
  const AppoinmentPage({super.key});

  @override
  State<AppoinmentPage> createState() => _AppoinmentPageState();
}

class _AppoinmentPageState extends State<AppoinmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Book Appoinment',
              style: TextStyle(
                  color: white, fontSize: 25, fontWeight: FontWeight.w700)),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Column(
          children: doctor.map((data) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MailPage(
                          name: data.name,
                          email: data.email,
                          field: data.field,
                          phone: data.phone),
                    ));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.10),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 0))
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Dr. ${data.name}',
                                overflow: TextOverflow.ellipsis,
                                style: mainText.copyWith(fontSize: 20)),
                            Text('${data.field}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 86, 179, 255),
                                    fontWeight: FontWeight.w700,
                                    height: 1)),
                          ],
                        ),
                        Text('Phone: ${data.phone}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF239CFF),
                                fontWeight: FontWeight.w700,
                                height: 2)),
                        Text('Email: ${data.email}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF239CFF),
                                fontWeight: FontWeight.w700,
                                height: 1)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ));
  }
}
