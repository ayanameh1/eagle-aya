// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Otherscreen extends StatelessWidget {
  const Otherscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //setting
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Uniform',
                ),
              ),
              onTap: () {},
            ),

            //language
            ListTile(
              leading: Icon(Icons.language),
              title: Text(
                'Language',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Uniform',
                ),
              ),
              trailing: DropdownButton<String>(
                  value: null,
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  elevation: 16,
                  onChanged: (value) {},
                  items: const [
                    DropdownMenuItem(
                      child: Text(
                        'arabic',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Uniform',
                        ),
                      ),
                      value: 'dds',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        'English',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Uniform',
                        ),
                      ),
                      value: 'dsa',
                    ),
                  ]),
            ),

            //about us
            ListTile(
              leading: Icon(Icons.people),
              title: Text(
                'About us',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Uniform',
                ),
              ),
            ),

            //logout
            ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
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
