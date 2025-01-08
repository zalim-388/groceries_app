import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groceries_app/order_accepted.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCart extends StatefulWidget {
  MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
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
            SizedBox(
              height: 30,
            ),
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
                                  item["quantity"] ?? "N\A",
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
                                        icon: Icon(Icons.add,
                                            color: Colors.green),
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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Checkout',
                                        style: TextStyle(fontSize: 25),
                                      )),
                                  SizedBox(
                                    width: 230,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        size: 30,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Delivery',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 160,
                                  ),
                                  Text(
                                    'select method',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 25,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Payment',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 250,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 25,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Promo Code',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Text(
                                    'Pick discount ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 25,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total Cost',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 190,
                                  ),
                                  Text(
                                    '\$13.97',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 25,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                    text:
                                        'By placing an order you agree to our',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Terms',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: 'And',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          )),
                                      TextSpan(
                                          text: 'Conditions',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black))
                                    ]),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderAccepted(),));
                              },
                                child: Container(
                                  height: 70,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),alignment: Alignment.center,
                                  child: 
                                  Text(
                                    'Place Order',
                                    style: TextStyle(color: Colors.white,fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Go to Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
