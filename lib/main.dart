import 'package:flutter/material.dart';

import 'package:groceries_app/splash_Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var darkTheme = ThemeData.dark().copyWith(primaryColor: Colors.blue);
    return ScreenUtilInit(
        designSize: Size(414.w, 896.h),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: SplashScreen(),
              ),
            ));
  }
}
