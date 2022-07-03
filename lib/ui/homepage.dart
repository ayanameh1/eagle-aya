// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eagle/ui/notification.dart';
import 'package:eagle/ui/profile.dart';
import 'package:eagle/ui/welcome.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    ProfileScreen(),
    NotificationScreen(),
  ];
  List<String> titles = [
    'Profile',
    'Notrification',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Center(
            child: Column(children: [
              Text(
                "Happening Now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Cermona',
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ExpoCard('Damascus International fair'),
              SizedBox(
                height: 30.0,
              ),
              ExpoCard('Damascus book fair'),
            ]),
          )),
    );
  }
}

class ExpoCard extends StatelessWidget {
  ExpoCard(this.name);
  var name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Uniform',
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 844 / 1080,
            height: MediaQuery.of(context).size.height * 465 / 1920,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              image: DecorationImage(
                  image: AssetImage('assets/images/ddd.png'), fit: BoxFit.fill),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
