import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderAccepted extends StatefulWidget {
  const OrderAccepted({super.key});

  @override
  State<OrderAccepted> createState() => _OrderAcceptedState();
}

class _OrderAcceptedState extends State<OrderAccepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 280.h,
          ),
          Center(
            child: Image.asset(
              'assets/image/Group 6872.png',
              height: 180.h,
              width: 180.w,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'Your Order has been\n         accepted',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Your items has been placcd and is on\n         it’s way to being processed',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 100.h,
          ),
          Container(
            height: 70.h,
            width: 300.w,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            alignment: Alignment.center,
            child: Text(
              'Track Order',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 25,
                            ),
                          ),
                          Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/image/image 13.png',
                                  height: 100.h,
                                  width: 100.w,
                                ),
                              ),
                              Text(
                                'Oops! Order Failed',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Something went tembly wrong.',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                              Container(
                                height: 70.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                alignment: Alignment.center,
                                child: Text(
                                  'Please Try Again',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Back to home',
                                    style: TextStyle(fontSize: 20),
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: Text(
                'Back to home',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
