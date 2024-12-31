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

  @override
  void initState() {
    super.initState();
    getfavProducts();
  }

  // Fetch the favorite products from shared preferences
  Future<void> getfavProducts() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    List<String> savedProducts = pres.getStringList("favProducts") ?? [];
    setState(() {
      favItems = savedProducts
          .map((productJson) => Map<String, String>.from(jsonDecode(productJson)))
          .toList();
    });
  }

  // Save the updated favorite products to shared preferences
  Future<void> savefavState() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    List<String> updatedProducts =
        favItems.map((item) => jsonEncode(item)).toList();
    await pres.setStringList("favProducts", updatedProducts);
  }

  // Remove item from the favorite list
  Future<void> removeItemFromFav(int index) async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    setState(() {
      favItems.removeAt(index);
    });
    await savefavState(); // Update the favorite list in SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Favorites'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Divider(),
            Expanded(
              child: favItems.isEmpty
                  ? Center(child: Text('Your favorites list is empty'))
                  : ListView.builder(
                      itemCount: favItems.length,
                      itemBuilder: (context, index) {
                        final item = favItems[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              item["image"] ?? 'assets/default_image.png', // Fallback image if missing
                              width: 80,
                              height: 80,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                item["name"] ?? "Unnamed Product",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quantity: ${item["quantity"] ?? "N/A"}',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            trailing: Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removeItemFromFav(index),
                                ),
                                Text(
                                  '\$${item["price"] ?? "0.00"}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
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
                  // You can implement this functionality as needed
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
