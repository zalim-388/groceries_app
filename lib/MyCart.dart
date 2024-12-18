import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mycart extends StatefulWidget {
  Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  List<Map<String, dynamic>> listItems = [];

  @override
  void initState() {
    super.initState();
    getCartProducts();
    
  }

  // Retrieve Cart Products from SharedPreferences
  Future<void> getCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartProducts = prefs.getString("cartProducts");

    if (cartProducts != null) {
      try {
        setState(() {
          listItems = List<Map<String, dynamic>>.from(jsonDecode(cartProducts));
        });
      } catch (e) {
        // Handle JSON decode error
        print('Error decoding cart data: $e');
      }
    } else {
      // Handle case where no cart data is found
      setState(() {
        listItems = [];
      });
    }
  }

  // Save updated cart products back to SharedPreferences
  Future<void> saveCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("cartProducts", jsonEncode(listItems));
  }

  // Remove item from cart and save
  Future<void> removeItemFromCart(int index) async {
    setState(() {
      listItems.removeAt(index);
    });
    await saveCartProducts();  // Ensure cart is updated in SharedPreferences
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
                'My cart',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(),
            Expanded(
                child: listItems.isEmpty
                    ? Center(child: Text('Your cart is empty'))
                    : ListView.builder(
                        itemCount: listItems.length,
                        itemBuilder: (context, index) {
                          final item = listItems[index];


                          return Card(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: ListTile(
                                leading: item["image"] != null
                                    ? Image.asset(
                                        item["image"],
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(Icons.image, size: 50),
                                title: Text(
                                  item["name"] ?? "Unnamed Product",
                                  style: TextStyle(fontSize: 16),
                                ),
                                subtitle: item["quantity"] ?? "Unnamed",
                                trailing: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () async {
                                    await removeItemFromCart(index); // Remove item and save
                                  },
                                )),
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
