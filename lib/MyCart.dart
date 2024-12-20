import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mycart extends StatefulWidget {
  Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  List<Map<String, String>> cartItems = [];
  List<int> quantity = [];

  @override
  void initState() {
    super.initState();
    getCartProducts();
  }

  void initializeQuantities() {
    quantity = cartItems
        .map((item) => int.tryParse(item["quantity"] ?? "1") ?? 1)
        .toList();
  }

  void increment(int index) {
    setState(() {
      quantity[index]++;
      cartItems[index]["quantity"] = quantity[index].toString();
    });
    saveCartState();
  }

  void decrement(int index) {
    if (quantity[index] > 1) {
      setState(() {
        quantity[index]--;
        cartItems[index]["quantity"] = quantity[index].toString();
      });
      saveCartState();
    }
  }

  Future<void> getCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedProducts = prefs.getStringList("cartProducts") ?? [];
    setState(() {
      cartItems = savedProducts
          .map((productJson) =>
              Map<String, String>.from(jsonDecode(productJson)))
          .toList();
      initializeQuantities();
    });
  }

  Future<void> saveCartState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedProducts =
        cartItems.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList("cartProducts", updatedProducts);
  }

  Future<void> removeItemFromCart(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cartItems.removeAt(index);
      quantity.removeAt(index);
    });
    saveCartState();
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
                'My Cart',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 30,),
            Divider(),
            Expanded(
              child: cartItems.isEmpty
                  ? Center(child: Text('Your cart is empty'))
                  : ListView.builder(
                      itemCount: cartItems.length,
                    
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              item["image"] ?? 'assets/images/placeholder.png',
                              fit: BoxFit.cover,
                              width: 60,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 30),
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
                                  item["quantity"]! ?? "N\A",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 35),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => decrement(index),
                                        icon: Icon(Icons.remove,
                                            color: Colors.grey),
                                      ),
                                      Text('${quantity[index]}'),
                                      IconButton(
                                        onPressed: () => increment(index),
                                        icon:
                                            Icon(Icons.add, color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(children: [
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => removeItemFromCart(index),
                              ),
                              Text(
                                item["price"]! ?? "Unnamed price",
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
                  'Go to Checkout',
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
