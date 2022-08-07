// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'about_us.dart';

class Otherscreen extends StatelessWidget {
  const Otherscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //language
            ListTile(
              leading: Icon(Icons.language),
              title: Text(
                'Language',
                style: TextStyle(
                  //color: Colors.black,
                  fontFamily: 'Uniform',
                ),
              ),
              trailing: dropdownlanguage(),
            ),

            //about us
            ListTile(
              leading: Icon(Icons.people),
              title: Text(
                'About us',
                style: TextStyle(
                  //color: Colors.black,
                  fontFamily: 'Uniform',
                ),
              ),
              onTap:() {
                Navigator.push(context,MaterialPageRoute(builder: (context) => About_us()));
              }
            ),

            //logout
            ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(
                  //  color: Colors.black,
                    fontFamily: 'Uniform',
                  ),
                ),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}



// LANGUAGE DROPDOWN MENU BUTTON _______________________________________________
class dropdownlanguage extends StatefulWidget {
  const dropdownlanguage({Key? key}) : super(key: key);

  @override
  State<dropdownlanguage> createState() => _dropdownlanguageState();
}

class _dropdownlanguageState extends State<dropdownlanguage> {
  String value ='English';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: value,
        icon: Icon(Icons.keyboard_arrow_down_outlined),
        elevation: 16,
        onChanged: (value) {setState(() {
          this.value=value!;
        });},
        items: const [
          DropdownMenuItem(
            child: Text(
              'arabic',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Uniform',
              ),
            ),
            value: 'arabic',
          ),
          DropdownMenuItem(
            child: Text(
              'English',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Uniform',
              ),
            ),
            value: 'English',
          ),
        ]);
  }
}