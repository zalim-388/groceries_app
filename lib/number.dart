import 'package:flutter/material.dart';
import 'package:groceries_app/Verification.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
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
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your moblie number',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'moblie number',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      )),
                  Container(
                    child: Column(
                      children: [
                        IntlPhoneField(
                          onTap: () {},
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                        SizedBox(
                          height: 250,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 300),
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 30,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Verification(),
                                      ));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
