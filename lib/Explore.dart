import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/Beverages.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<Map<String, dynamic>> _filteredList = [];

  final List<Map<String, dynamic>> _products = [
    {
      "image": "assets/image/pngfuel 6.png",
      "name": "Fresh Fruits\n& Vegetables",
      "color": Colors.green[100],
    },
    {
      "image": "assets/image/pngfuel 8.png",
      "name": "Cooking Oil\n& Ghee",
      "color": Colors.orange[100],
    },
    {
      "image": "assets/image/pngfuel 9.png",
      "name": "Meat & Fish",
      "color": Colors.pink[100],
    },
    {
      "image": "assets/image/pngfuel 6 (1).png",
      "name": "Bakery & Snacks",
      "color": Colors.purple[100],
    },
    {
      "image": "assets/image/pngfuel.png",
      "name": "Dairy & Eggs",
      "color": Colors.amber[100],
    },
    {
      "image": "assets/image/pngfuel 6 (2).png",
      "name": "Beverages",
      "color": Colors.blue[100],
    },
  ];

  List<Map<String, String>> _filteredDairyEggs = [];

  final List<Map<String, String>> _DairEggs = [
    {
      "image": "assets/image/pngfuel 16.png",
      "name": "Egg Chicken Red",
      "quantity": "4pcs",
      "price": "\$1.99",
    },
    {
      "image": "assets/image/pngfuel 18.png",
      "name": "Egg Chicken White",
      "quantity": "180g",
      "price": "\$1.50"
    },
    {
      "image": "assets/image/hiclipart 2.png",
      "name": "Egg Pasta ",
      "quantity": "30gm",
      "price": "\$15.99"
    },
    {
      "image": "assets/image/egg-noodle (1) 2.png",
      "name": "Egg Noodles",
      "quantity": "2L",
      "price": "\$15.99"
    },
    {
      "image": "assets/image/American-Garden-Mayonnaise-Eggless-473ml 2.png",
      "name": "Mayonnais Eggless",
      "quantity": "500g",
      "price": "\$4.77"
    },
    {
      "image": "assets/image/rp_24790392_0053554627_l 2.png",
      "name": "Egg Noodles",
      "quantity": "200g",
      "price": "0.50"
    },
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredList = List.from(_products);
    _filteredDairyEggs = List.from(_DairEggs);
  }

  void _filterList(String query) {
    setState(() {
      _filteredList = query.isEmpty
          ? List.from(_products)
          : _DairEggs.where((item) {
              return item["name"]!.toLowerCase().contains(query.toLowerCase());
            }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Text(
              'Find Products',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 20.h),
            TextField(
              controller: _controller,
              onChanged: _filterList,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {
                    _controller.clear();
                    _filterList('');
                  },
                  icon: const Icon(Icons.clear_rounded),
                ),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            if (_controller.text.isNotEmpty)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1,
                  ),
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    final product = _filteredList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Beverages(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: product["color"],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              product["image"] ?? '',
                              height: 80.h,
                              width: 80.w,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              product["name"] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              product["quantity"] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Row(
                                children: [
                                  Text(
                                    product["price"] ?? '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                   SizedBox(
                                    width: 50.w,
                                  ),
                                  Container(
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1,
                  ),
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    final product = _filteredList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Beverages(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: product["color"],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              product["image"] ?? '',
                              height: 80.h,
                              width: 80.w,
                            ),
                            SizedBox(height: 10.h
                            ),
                            Text(
                              product["name"] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              product["quantity"] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Row(
                                children: [
                                  Text(
                                    product["price"] ?? '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                   SizedBox(
                                    width: 50.w,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
