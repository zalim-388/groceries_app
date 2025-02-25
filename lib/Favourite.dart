import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Map<String, String>> favItems = [];
  List<int> quantity = [];

  @override
  void initState() {
    super.initState();
    getfavProducts();
  }

  Future<void> getfavProducts() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    List<String> savedProducts = pres.getStringList("favProducts") ?? [];
    setState(() {
      favItems = savedProducts
          .map((productJson) =>
              Map<String, String>.from(jsonDecode(productJson)))
          .toList();
    });
  }

  Future<void> savefavState() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    List<String> updatedProducts =
        favItems.map((item) => jsonEncode(item)).toList();
    await pres.setStringList("favProducts", updatedProducts);
  }

  Future<void> removeItemFromCart(int index) async {
    setState(() {
      favItems.removeAt(index);
    });
    savefavState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'favorite',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(),
            Expanded(
              child: favItems.isEmpty
                  ? Center(child: Text('Your fav is empty'))
                  : ListView.builder(
                      itemCount: favItems.length,
                      itemBuilder: (context, index) {
                        final item = favItems[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                    
                            horizontal: 10,
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              item["image"] ?? '',
                                 fit: BoxFit.cover,
                              width: 60,
                            
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"] ?? "Unnamed Product",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["subtitle"] ?? "N\A",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            trailing: Column(children: [
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => removeItemFromCart(index),
                              ),
                              Text(
                                item["price"] ?? "Unnamed price",
                                style: TextStyle(fontSize: 16),
                              ),
                            ]),
                            visualDensity: VisualDensity(vertical: 4),
                          ),
                        );
                      },
                    ),
            ),
            Container(
              height: 70,
              width: 350,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Navigate to the checkout page
                },
                child: Text(
                  'Add All To Cart',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
