import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Passwordvisibilty extends ChangeNotifier{
  bool obscureTexttt = false;
 bool obscureTextt = false;
 bool obscureText = false;
 eye(){
   obscureTextt = !obscureTextt;
   notifyListeners();
 }
 eye1(){
   obscureText = !obscureText;
   notifyListeners();
 }
  eye2(){
    obscureTexttt = !obscureTextt;
    notifyListeners();
  }
}