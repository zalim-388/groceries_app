import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'name': 'Sprite',
      'size': '325ml',
      'price': 1.99,
      'imagePath': 'assets/image/pngfuel 12.png',
    },
    {
      'name': 'Diet Coke',
      'size': '355ml',
      'price': 1.99,
      'imagePath': 'assets/image/pngfuel 11.png',
    },
    {
      'name': 'Coca Cola',
      'size': '325ml',
      'price': 4.99,
      'imagePath': 'assets/image/pngfuel 13.png',
    },
    {
      'name': '7up',
      'size': '2L',
      'price': 15.88,
      'imagePath': 'assets/image/pngegg (7).png',
    },
    {
      'name': 'Pepsi',
      'size': '330ml',
      'price': 4.99,
      'imagePath': 'assets/image/pngegg (9).png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Favorurite',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
