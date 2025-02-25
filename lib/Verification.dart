import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Enter your 4-digit code',
                              style: TextStyle(fontSize: 32),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: '- - - -',
                                  hintStyle: TextStyle(fontSize: 25),
                                  labelText: 'Code',
                                  labelStyle: TextStyle(
                                      fontSize: 30, color: Colors.grey)),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 350.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.top + 30,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend Code",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 215.w,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLocation(),));
                    },
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
