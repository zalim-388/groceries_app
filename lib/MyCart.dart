import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mycart extends StatefulWidget {
  Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  int quantity = 1;
  List<Map<String, String>> cartItems = []; // Store decoded cart items

  @override
  void initState() {
    super.initState();
    getCartProducts();
  }

  // Function to get products from SharedPreferences
  Future<void> getCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the list of cart products as JSON strings
    List<String> savedProducts = prefs.getStringList("cartProducts") ?? [];

    // Decode each JSON string back into a Map<String, String>
    List<Map<String, String>> cartProducts = savedProducts
        .map((productJson) => Map<String, String>.from(jsonDecode(productJson)))
        .toList();

    // Update the state with the fetched cart products
    setState(() {
      cartItems = cartProducts;
    });
  }

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
                'My Cart',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 30),
            Divider(),
            Expanded(
              child: cartItems.isEmpty
                  ? Center(child: Text('Your cart is empty'))
                  : ListView.builder(
                      itemExtent: 150.0,
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];

                        // Assuming each item is a Map with keys "name" and "quantity"
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: ListTile(
                            leading: Image.asset(item["image"]! ?? "not image"),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item["name"] ?? "Unnamed Product",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  item["quantity"]! ?? "N\A",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        alignment: Alignment.center,
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                setState(() {
                                                  (quantity > 1);
                                                });

                                                quantity--;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.grey,
                                              size: 25,
                                            ))),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('$quantity'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        alignment: Alignment.center,
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                quantity++;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 25,
                                              color: Colors.green,
                                            ))),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () async {
                                    await removeItemFromCart(index);
                                  },
                                ),
                                Text(
                                  item["price"]! ?? "Unnamed price",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            visualDensity: VisualDensity(vertical: 4),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to remove an item from the cart
  Future<void> removeItemFromCart(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove the item from the list
    cartItems.removeAt(index);

    // Encode and save the updated list back to SharedPreferences
    List<String> updatedProducts =
        cartItems.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList("cartProducts", updatedProducts);

    // Update the UI
    setState(() {});
  }
}
