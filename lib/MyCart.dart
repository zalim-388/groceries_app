import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
   final List<Map<String, dynamic>> mycart = [
    {
      'name': 'Bell Pepper Red',
      'size': '1kg',
      'price': '\$4.99',
      'image': 'assets/image/92f1ea7dcce3b5d06cd1b1418f9b9413 3.png',
    },
    {
      'name': 'Egg Chicken Red',
      'size': '4pcs',
      'price': '\$1.99',
      'image': 'assets/image/pngfuel 16.png'
    },
    {
      'name': 'Organic Bananas',
      'size': '12kg',
      'price': '\$3.00',
      'image': 'assets/image/pngwing.com (1).png',
    },
    {
      'name': 'Ginger',
      'size': '250g',
      'price': '\$2.99',
      'image': 'assets/image/pngfuel 3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'My cart',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {},
            ))
          ],
        ),
      ),
    );
  }
}
