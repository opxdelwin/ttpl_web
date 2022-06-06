import 'package:flutter/material.dart';


class NavigationProvider extends ChangeNotifier{
  int _currNav = 0;

  int get currNav => _currNav;

  void increment() {
    _currNav++;
    notifyListeners();
  }

  void decrement() {
    _currNav--;
    notifyListeners();
  }

}