import 'package:eagle/ui/add_expo.dart';
import 'package:eagle/ui/homelayout.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:eagle/ui/login.dart';
import 'package:eagle/ui/profile.dart';
import 'package:eagle/ui/sign_up.dart';
import 'package:eagle/ui/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  Color(0xffffd100),
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          titleSpacing: 20.0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: AddExpoScreen(),
    );
  }
}