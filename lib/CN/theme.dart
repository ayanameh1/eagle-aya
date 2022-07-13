import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);
  getTheme() => _themeData;
  setTheme1(ThemeData theme) {
    ThemeData(
      primaryColor: const Color(0xffffd100),
      primarySwatch: Colors.grey,
    );
    _themeData = theme;
    notifyListeners();
  }

  setTheme2(ThemeData theme) {
    ThemeData(
      primaryColor: const Color(0xffffd100),
      primarySwatch: Colors.grey,
    );
    _themeData = theme;
    notifyListeners();
  }
}
