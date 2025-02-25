import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/log_in.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              size: 30,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Container(
                  height: 250.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/illustration.png'),
                          fit: BoxFit.contain),
                      shape: BoxShape.rectangle),
                ),
                Text(
                  'Select your Loction',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'swicth on you loction  to stay in tune with\n         what’s happening in your area',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(
                  height: 80.h,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'You zone',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 25),
                      hintText: 'Type of your Zone',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.grey,
                          ))),
                ),
                SizedBox(
                  height: 40.h,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Your Area',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                      ),
                      hintText: 'Type of your Area',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.grey,
                          ))),
                ),
                SizedBox(
                  height: 70.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogIn(),
                        ));
                  },
                  child: Container(
                    height: 70.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
