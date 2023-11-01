import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  int _themeIndex = 0;

  int get getThemeIndex => _themeIndex;

  setThemeIndex(index) {
    _themeIndex = index;
    notifyListeners();
  }
}
