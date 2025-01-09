import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class name with ChangeNotifier {
  String? _name = "";

  String? get userName => _name;

  void Changename(String name) {
    _name = name;
    notifyListeners();
  }
}

// class Darkthemeprovider with ChangeNotifier {
//   bool _darktheme = false;
//   final darkThemePreference = DarkThemePreference();

//   bool get darktheme => _darktheme;

//   set darkTheme(bool value){
//     _darktheme = value;
//     darkThemePreference.setDarkTheme(value);
//     notifyListeners();
//   }
// }

// class DarkThemePreference {
//   void setDarkTheme(bool value) {
//     // Implement your logic to save the dark theme preference
//   }
// }
