import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> image = [
    'assets/image/pngwing.com (1).png',
    'assets/image/pngfuel 1.png',
    'assets/image/pngegg.png',
    'assets/image/pngegg (3).png',
  ];

  final List<String> text = ['Banana', 'Red Apple', 'Orange', 'Mango'];
  final List<String> quantity = ['7pcs', '1kg', '2kg', '1kg'];
  final List<String> description = [
    'Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart.',
    'Bananas are nutritious. Bananas may be good for weight loss. Bananas may be good for your heart.',
    'Oranges are nutritious. Oranges may be good for weight loss. Oranges may be good for your heart.',
    'Mangoes are nutritious. Mangoes may be good for weight loss. Mangoes may be good for your heart.',
  ];
  final List<String> price = ['\$4.59', '\$4.69', '\$6.99', '\$9.99'];

  final List<Map<String, String>> vegetables = [
    {
      "image": "assets/image/92f1ea7dcce3b5d06cd1b1418f9b9413 3.png",
      "name": "Tomato",
      "quantity": "2Kg",
      "price": "\$7.99",
    },
    {
      "image": "assets/image/pngfuel 3.png",
      "name": "Ginger",
      "quantity": "1kg",
      "price": "\$4.99",
    },
    {
      "image": "assets/image/pngegg (4).png",
      "name": "Carrot",
      "quantity": "30gm",
      "price": "\$5.99",
    },
    {
      "image": "assets/image/pngegg (5).png",
      "name": "Potato",
      "quantity": "2kg",
      "price": "\$4.99",
    },
  ];

  final List<String> imgList = [
    'https://www.shutterstock.com/image-vector/farm-fresh-produce-delivery-home-260nw-2154869859.jpg',
    'https://freshfarmse.com/wp-content/uploads/2023/11/WhatsApp-Image-2023-11-09-at-1.51.07-AM.jpeg',
    'https://i0.wp.com/kjfoods.co.in/wp-content/uploads/2022/03/1592574403-veg_web.jpg?fit=595%2C197&ssl=1',
    'https://i0.wp.com/kjfoods.co.in/wp-content/uploads/2022/03/1628671638-fsfhjllz_vegetables-banner.jpg?fit=595%2C171&ssl=1',
  ];

  Future<void> saveCartProduct(Map<String, String> product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> existingProducts = prefs.getStringList("cartProducts") ?? [];
    existingProducts.add(jsonEncode(product));
    await prefs.setStringList("cartProducts", existingProducts);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ))
        .toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Dhaka, Banassre',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Store',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
              SizedBox(height: 16),
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Exclusive Offers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: text.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to product details
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 150,
                        child: Column(
                          children: [
                            Image.asset(image[index], height: 80),
                            Text(text[index]),
                            Text(quantity[index]),
                            Text(price[index]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Best Selling',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vegetables.length,
                  itemBuilder: (context, index) {
                    final veg = vegetables[index];
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 150,
                      child: Column(
                        children: [
                          Image.asset(veg["image"]!, height: 80),
                          Text(veg["name"]!),
                          Text(veg["quantity"]!),
                          Text(veg["price"]!),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.green),
                            onPressed: () async {
                              await saveCartProduct(veg);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${veg["name"]} added to cart'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
