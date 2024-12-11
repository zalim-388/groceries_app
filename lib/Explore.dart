import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<String> Products = [
    'assets/image/pngfuel 6.png',
    'assets/image/pngfuel 8.png',
    'assets/image/pngfuel 9.png',
    'assets/image/pngfuel 6 (1).png',
    'assets/image/pngfuel.png',
    'assets/image/pngfuel 6 (2).png'
  ];
  List<String> Product_name = [
    'Frash Fruits\n& Vegetable',
    'Cooking Oil\n& Ghee',
    'Meat & Fish',
    'Bakery & Snacks',
    'Dairy & Eggs',
    'Beverages'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Find Products',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'search',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  fillColor: Colors.grey.shade200,
                  filled: true),
            ),
          ],
        ),
      ),
    ));
  }
}
