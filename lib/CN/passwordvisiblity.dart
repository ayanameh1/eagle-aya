import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Passwordvisibilty extends ChangeNotifier{
  bool obscureTexttt = false;
 bool obscureTextt = false;
 bool obscureText = false;

 //for sign up password
 eye(){
   obscureTextt = !obscureTextt;
   notifyListeners();
 }

 //for sign up confirm password
 eye1(){
   obscureText = !obscureText;
   notifyListeners();
 }

 //for login password
  eye2(){
    obscureTexttt = !obscureTexttt;
    notifyListeners();
  }
}