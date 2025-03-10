import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:groceries_app/singin.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 959.h,
        width: 450.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('image/8140 1.png'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 500),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'image/Group.png',
                  height: 60.h,
                  width: 60.w,
                ),
                Text(
                  '  Welcome\nto our store',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Ger your groceries in as fast as one hour',
                  style: TextStyle(color: Colors.grey.shade300),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Singin(),
                        ));
                  },
                  child: Container(
                    height: 60.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
