import 'package:flutter/material.dart';
import 'package:groceries_app/provider.dart';
import 'package:groceries_app/splash_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Size size;
  double height;
  double width;

  MyApp({super.key})
      : size = Size.zero,
        height = 0.0,
        width = 0.0;

  @override
  Widget build(BuildContext context) {
    var darkTheme = ThemeData.dark().copyWith(primaryColor: Colors.blue);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
