import 'package:eagle/ui/addExpo.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = 'Select Countries';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Color(0xffffd100),
        focusColor: Color(0xffffd100),
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