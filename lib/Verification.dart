import 'package:flutter/material.dart';
import 'package:groceries_app/select_location.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your 4-digit code',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Code',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '- - - -',
                    hintStyle: TextStyle(fontSize: 25),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 250,
                ),
                Row(
                  children: [
                    Text(
                      'Resend code',
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 30,
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>SelectLocation(),
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
                )
              ],
            ),
          ),
        ));
  }
}
