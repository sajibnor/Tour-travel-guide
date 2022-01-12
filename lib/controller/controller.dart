import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  int _size = 1;
  TextEditingController controller = TextEditingController();

  int get size => _size;
  String name = "";

  setname() {
    name=controller.text;
  }

  increment() {
    _size++;
    notifyListeners();
  }

  drecrement() {
    _size--;
    notifyListeners();
  }
}
