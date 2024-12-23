import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/Product_Detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> fruits = [
    {
      "image": "assets/image/pngwing.com (1).png",
      "name": "Banana",
      "size": "7pcs",
      "price": "7pcs",
      "description":
          "Bananas are nutritious. Bananas may be good for weight loss. Bananas may be good for your heart."
    },
    {
      "image": "assets/image/pngfuel 1.png",
      "name": "Red Apple",
      "size": "1kg",
      "price": "\$4.69",
      "description":
          "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart."
    },
    {
      "image": "  assets/image/pngegg.png",
      "name": "Orange",
      "size": "2kg",
      "price": "\$6.99",
      "description":
          " Oranges are nutritious. Oranges may be good for weight loss. Oranges may be good for your heart",
    },
    {
      "image": "assets/image/pngegg (3).png",
      "name": "Mango",
      "size": "1kg",
      "price": "\$9.99",
      "description":
          "Mangoes are nutritious. Mangoes may be good for weight loss. Mangoes may be good for your heart."
    }
  ];

  final List<Map<String, String>> vegetables = [
    {
      "image": "assets/image/92f1ea7dcce3b5d06cd1b1418f9b9413 3.png",
      "name": "Bell Pepper",
      "quantity": "2Kg",
      "price": "\$7.99",
      "Description": ""
    },
    {
      "image": "assets/image/pngfuel 3.png",
      "name": "Ginger",
      "quantity": "1kg",
      "price": "\$4.99",
      "Description": ""
    },
    {
      "image": "assets/image/pngegg (4).png",
      "name": "Carrot",
      "quantity": "30gm",
      "price": "\$5.99",
      "Description": ""
    },
    {
      "image": "assets/image/pngegg (5).png",
      "name": "Potato",
      "quantity": "2kg",
      "price": "\$4.99",
      "Description": ""
    },
  ];

  final List<String> imgList = [
    'https://www.shutterstock.com/image-vector/farm-fresh-produce-delivery-home-260nw-2154869859.jpg',
    'https://freshfarmse.com/wp-content/uploads/2023/11/WhatsApp-Image-2023-11-09-at-1.51.07-AM.jpeg',
    'https://i0.wp.com/kjfoods.co.in/wp-content/uploads/2022/03/1592574403-veg_web.jpg?fit=595%2C197&ssl=1',
    'https://i0.wp.com/kjfoods.co.in/wp-content/uploads/2022/03/1628671638-fsfhjllz_vegetables-banner.jpg?fit=595%2C171&ssl=1',
  ];
  Future<void> saveCartProduct(Map<String, dynamic> product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the existing list of products, or initialize an empty list if none exist
    List<String> existingProducts = prefs.getStringList("cartProducts") ?? [];

    // Encode the new product and add it to the list
    existingProducts.add(jsonEncode(product));

    // Save the updated list back to SharedPreferences
    await prefs.setStringList("cartProducts", existingProducts);

    print("kkkkkkkkkkkkkkkkkkk${existingProducts}");
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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 180),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/Group ..png'),
                            fit: BoxFit.contain),
                        shape: BoxShape.rectangle),
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 200,
                    child: Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: fruits.length,
                          itemBuilder: (BuildContext context, index) {
                            final fruit = fruits[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                          image: fruit['image']!,
                                          price: fruit["price"]!,
                                          Description: fruit["description"]!,
                                          title: fruit["name"]!,
                                          subtitle: fruit["size"]!,
                                        ),
                                      ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 40,
                                  width: 150,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        fruit["image"]!,
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 50),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              fruit["name"]!,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              fruit["size"]!,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              fruit["price"]!,
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                  shape: BoxShape.rectangle),
                                              child: IconButton(
                                                onPressed: () async {
                                                  await saveCartProduct(fruit);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          '${fruit["name"]} added to cart'),
                                                    ),
                                                  );
                                                },
                                                icon: Icon(Icons.add),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Best Selling',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 220,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: vegetables.length,
                        itemBuilder: (BuildContext context, int index) {
                          final veg = vegetables[index];
                          return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                          image: veg["image"] ?? '',
                                          price: veg["price"] ?? '',
                                          Description: veg["Description"] ?? '',
                                          title: veg["name"] ?? '',
                                          subtitle: veg["size"] ?? '',
                                        ),
                                      ));
                                },
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        veg["image"]!,
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 60),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              veg["name"]!,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              veg["quantity"]!,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(children: [
                                          Text(
                                            veg["price"]!,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                shape: BoxShape.rectangle),
                                            child: IconButton(
                                              icon: Icon(Icons.add,
                                                  color: Colors.white),
                                              onPressed: () async {
                                                await saveCartProduct(veg);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        '${veg["name"]} added to cart'),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
