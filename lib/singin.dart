import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/number.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Singin extends StatefulWidget {
  const Singin({super.key});

  @override
  State<Singin> createState() => _SinginState();
}

final TextEditingController controller = TextEditingController();

String initialCountry = 'NG';
PhoneNumber number = PhoneNumber(isoCode: 'NG');

class _SinginState extends State<Singin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 350.h,
                  width: 480.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/Mask Group.png'))),
                ),
                Positioned(
                  left: 250,
                  top: 60,
                  child: RotatedBox(
                      quarterTurns: 6,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/image/Group ..png',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Text(
                            'netcar',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                ),
              ]),
              SizedBox(
                height: 100.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Get your groceries\nwith nectar',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                child: IntlPhoneField(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Number(),
                        ));
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
                // child: GestureDetector(onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => Number(),));
                // },
                // child: InternationalPhoneNumberInput(
                //   onInputChanged: (PhoneNumber number) {
                //     print(number.phoneNumber);
                //   },
                //   onInputValidated: (bool value) {
                //     print(value);
                //   },
                //   selectorConfig: SelectorConfig(
                //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                //     useBottomSheetSafeArea: true,
                //   ),
                //   ignoreBlank: false,
                //   autoValidateMode: AutovalidateMode.disabled,
                //   selectorTextStyle: TextStyle(color: Colors.black),
                //   initialValue: number,
                //   textFieldController: controller,
                //   formatInput: false,
                //   keyboardType: TextInputType.numberWithOptions(
                //       signed: true, decimal: true),
                //   onSaved: (PhoneNumber number) {
                //     print('On Saved: $number');
                //   },
                //    onFieldSubmitted: (value) {
                //               // Navigate to the next page when user submits the input
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(builder: (context) => Number()),
                //               );
                //             },

                // ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Or connect with social media',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 70.h,
                width: 300.w,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      'G',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Text(
                      'Continue with Google',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 70.h,
                width: 300.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 74, 102, 172)),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      'f',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Text(
                      'Continue with Facebook',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
