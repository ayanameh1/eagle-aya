import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
   bool isdark =true;

  ThemeMode currentTheme(){
    return isdark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchtheme(){
    isdark =! isdark;
    notifyListeners();
    print(isdark);
  }


  // getTheme() => _themeData;
  //
  // setTheme(ThemeData theme) {
  //   ThemeData(
  //     primaryColor: const Color(0xffffd100),
  //     primarySwatch: Colors.grey,
  //   );
  //   _themeData = theme;
  //   notifyListeners();
  // }
}
