import 'package:flutter/material.dart';

class BottomNavigationBarController extends ChangeNotifier {
  int _tabIndex = 0;

  int get getCurrentIndex => _tabIndex;

  setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
