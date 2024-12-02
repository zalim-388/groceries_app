import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 350,
                width: 480,
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
                          height: 25,
                          width: 25,
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
              height: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Get your groceries\nwith nectar',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                useBottomSheetSafeArea: true,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: controller,
              formatInput: true,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Or connect with social media',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
