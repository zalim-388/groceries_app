import 'package:flutter/material.dart';
import 'package:groceries_app/splash_Screen.dart';

void main() {
  runApp( MyApp());
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
      size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
