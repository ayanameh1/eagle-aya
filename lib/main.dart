import 'package:eagle/ui/homelayout.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:eagle/ui/login.dart';
<<<<<<< HEAD
import 'package:eagle/ui/profile.dart';
=======
import 'package:eagle/ui/signUp.dart';
>>>>>>> 7aecb1b9e528f7052310778f7f3a298a9bda69fa
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
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
=======
    debugShowCheckedModeBanner: false,
        theme: ThemeData(
        //primarySwatch: Colors.yellowAccent,
>>>>>>> 7aecb1b9e528f7052310778f7f3a298a9bda69fa
        appBarTheme: AppBarTheme(
          titleSpacing: 20.0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
<<<<<<< HEAD
      ),
=======
        ),
>>>>>>> 7aecb1b9e528f7052310778f7f3a298a9bda69fa
      home: HomeLayout(),
    );
  }
}
