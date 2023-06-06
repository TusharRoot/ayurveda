import 'package:ayurveda_app/constants/color.dart';
import 'package:ayurveda_app/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemContainer extends StatefulWidget {
  final String name;
  final String preferences;
  final String image;
  final String use;
  final String descrpition;
  final String benefits;
  final String effect;
  final String buy;

  const ItemContainer({
    super.key,
    required this.name,
    required this.preferences,
    required this.image,
    required this.use,
    required this.descrpition,
    required this.benefits,
    required this.effect,
    required this.buy,
  });
  @override
  State<ItemContainer> createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  late final Uri _url = Uri.parse(widget.buy);
  Future<void> _buyURL() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (ctx) => Scaffold(
                    appBar: AppBar(
                      iconTheme: const IconThemeData(
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    body: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: white,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 300,
                                      child: Image.network(widget.image,
                                          fit: BoxFit.cover)),
                                  Text(widget.name,
                                      style: mainText.copyWith(fontSize: 35)),
                                  longLine,
                                  Text('Decsciption:',
                                      style: subText.copyWith(fontSize: 25)),
                                  Text(widget.descrpition,
                                      style: subTextAns.copyWith(fontSize: 17)),
                                  longLine,
                                  Text('Use:',
                                      style: subText.copyWith(fontSize: 25)),
                                  Text(widget.use,
                                      style: subTextAns.copyWith(fontSize: 17)),
                                  longLine,
                                  Text('Benifits:',
                                      style: subText.copyWith(fontSize: 25)),
                                  Text(widget.benefits,
                                      style: subTextAns.copyWith(fontSize: 17)),
                                  longLine,
                                  Text('Effects:',
                                      style: subText.copyWith(fontSize: 25)),
                                  Text(widget.effect,
                                      style: subTextAns.copyWith(fontSize: 17)),
                                  longLine,
                                  Text("Doctor's review: ",
                                      style: subText.copyWith(fontSize: 25)),
                                  Text(widget.preferences,
                                      style: subTextAns.copyWith(fontSize: 17)),
                                  longLine,
                                  ElevatedButton(
                                      onPressed: _buyURL,
                                      child: const Text('Shop now')),
                                  const SizedBox(height: 50)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
        },
        child: Container(
            height: 80,
            width: 300,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.10),
                      spreadRadius: 10,
                      blurRadius: 30,
                      offset: const Offset(0, 0))
                ]),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.name, style: mainText.copyWith(fontSize: 20)),
                      SizedBox(
                          height: 70,
                          width: 100,
                          child: Image.network(widget.image, fit: BoxFit.cover))
                    ]))));
  }
}
