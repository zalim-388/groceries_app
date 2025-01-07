import 'package:flutter/material.dart';

class name with ChangeNotifier {
  String? _name = "";

  String?get userName => _name;

  void Changename(String name) {
    _name = name;
    notifyListeners();
  }
}
