import 'package:flutter/material.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: Padding(
         padding: EdgeInsets.only(top: 40),
         child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'My cart',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 30,),
              Divider()
          ],
               ),
       ),
    );
  }
}