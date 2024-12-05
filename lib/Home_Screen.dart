import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List imagList = [
  //   Image.asset('assets/image/pngwing.com (1).png'),
  //   Image.asset('assets/image/pngfuel 1.png'),
  //   Image.asset('assets/image/pngegg.png'),
  //   Image.asset('assets/image/pngegg (3).png'),
  // ];

  // List<String> text = ['organic banana', 'Red Apple', 'orange', 'Mango'];
  // List<String> TExt = [
  //   '7pcs, Priceg',
  //   '1kg, Priceg',
  //   '2kg, Priceg',
  //   '1kg, Priceg'
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/Group ..png'),
                        fit: BoxFit.contain),
                    shape: BoxShape.rectangle),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on_rounded,
                        color: Colors.grey,
                        size: 35,
                      )),
                  Text(
                    'Dhaka, Banassre',
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 20),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: 'Search Store',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
//image

              Row(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Exclusive Offer',
                        style: TextStyle(fontSize: 25),
                      )),
                  SizedBox(
                    width: 150,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(color: Colors.green, fontSize: 17),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
