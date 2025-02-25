import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/Signup.dart';
import 'package:groceries_app/Singup.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    saveCartProduct();
  }

  Future<void> saveCartProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/Group ..png'),
                          fit: BoxFit.contain),
                      shape: BoxShape.rectangle),
                ),
                SizedBox(
                  height: 130.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Loging',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter email and password',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 25)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                TextField(
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 25),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(passwordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility)),
                    suffixIconColor: Colors.grey,
                    alignLabelWithHint: false,
                    filled: true,
                    fillColor: Colors.white10,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  height: 70.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Row(
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup()));
                          },
                          child: Text(
                            'Singup',
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ))
                    ],
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
