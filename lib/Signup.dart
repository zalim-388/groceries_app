import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/bottom_bar.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool PasswordVisible = false;

  @override
  void inistate() {
    super.initState();
    PasswordVisible = true;
  }

  Widget build(BuildContext context) {
    String? customName;
    String? value;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/Group ..png'),
                        fit: BoxFit.contain),
                    shape: BoxShape.rectangle),
              ),
              SizedBox(
                height: 100.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Enter your credentials to continue',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle:
                            TextStyle(color: Colors.grey, fontSize: 17)),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  FormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => (value?.isNotEmpty ?? false)
                          ? null
                          : "Cannot be null",
                      onSaved: (newValue) => customName = value,
                      builder: (State) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                  onChanged: (value) => State.didChange(value),
                                )),
                                if (State.isValid)
                                  const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                // if (State.hasError)
                                //   const Icon(
                                //     Icons.close,
                                //     color: Colors.red,
                                //   )
                              ],
                            ),
                            // if (State.hasError)
                            //   Text(
                            //     State.errorText ?? "",
                            //     style: const TextStyle(color: Colors.red),
                            //   )
                          ],
                        );
                      }),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 17),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              PasswordVisible = !PasswordVisible;
                            });
                          },
                          icon: Icon(PasswordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility)),
                      suffixIconColor: Colors.grey,
                      filled: true,
                      alignLabelWithHint: false,
                      fillColor: Colors.white10,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 15.h),
                  RichText(
                    text: TextSpan(
                      text: 'By continuing you agree to our ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(color: Colors.green),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                        ..pushReplacement(MaterialPageRoute(
                            builder: (context) => MyHomePage(title: '')));
                    },
                    child: Container(
                      height: 70.h,
                      width: 370.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green),
                      alignment: Alignment.center,
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: RichText(
                      text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          children: [
                            TextSpan(
                                text: 'Signup',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15))
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
