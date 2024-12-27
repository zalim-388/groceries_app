import 'package:flutter/material.dart';
import 'package:groceries_app/Beverages.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  // final List<Color> _prodcut_Color = [
  //   Colors.green.shade100,
  //   Colors.orange.shade100,
  //   Colors.pink.shade100,
  //   Colors.purple.shade100,
  //   Colors.amber.shade100,
  //   Colors.blue.shade100,
  // ];
  List<Map<String, String>> _filteredList = [];

  final List<Map<String, String>> _prodcuts = [
    {
      "image": "assets/image/pngfuel 6.png",
      "name": "Frash Fruits\n& Vegetable",
      "Color": Colors.green[100].toString()
    },
    {
      "image": "assets/image/pngfuel 8.png",
      "name": "Cooking Oil\n& Ghee",
      "Color": Colors.orange[100].toString(),
    },
    {
      "image": "assets/image/pngfuel 9.png",
      "name": "Meat & Fish",
      "Color": Colors.pink[100].toString(),
    },
    {
      "image": "assets/image/pngfuel 6 (1).png",
      "name": "Bakery & Snacks",
      "Color": Colors.purple[100].toString(),
    },
    {
      "image": "assets/image/pngfuel.png",
      "name": "Dairy & Eggs",
      "Color": Colors.amber[100].toString(),
    },
    {
      "image": "assets/image/pngfuel 6 (2).png",
      "name": "Beverages",
      "Color": Colors.blue[100].toString(),
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
    _filteredList = List.from(_prodcuts);
    _filteredDairyEggs = List.from(_DairEggs);
  }

  void _filterList(String query) {
    setState(() {
      _filteredList = query.isEmpty
          ? List.from(_prodcuts)
          : _DairEggs.where((item) {
              return item["name"]!.toLowerCase().contains(query.toLowerCase());
            }).toList();
    });
  }

  // void _filterDairyEggs(String query) {
  //   setState(() {
  //     _filteredDairyEggs = query.isEmpty
  //         ? List.from(_DairEggs)
  //         : _DairEggs.where((item) {
  //             return item["name"]!.toLowerCase().contains(query.toLowerCase());
  //           }).toList();
  //   });
  // }

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
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {
                    _controller.clear();
                    _filterList('');
                    // _filterDairyEggs('');
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
              onChanged: _filterList,
              // onSubmitted: _filterDairyEggs,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: _filteredList.length,
                itemBuilder: (context, index) {
                  final product = _filteredList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Beverages()),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Image.asset(product["image"] ?? '',
                                  height: 80, width: 80),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(product["name"] ?? '',
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(product["quantity"] ?? '',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(product["price"] ?? '',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 30),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                        shape: BoxShape.rectangle),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ),
                  );
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30),

            //     child: Expanded(
            //       child: GridView.builder(
            //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           crossAxisSpacing: 15,
            //           mainAxisSpacing: 15,
            //           childAspectRatio: 1,
            //         ),
            //         itemCount: _filteredList.length,
            //         itemBuilder: (context, index) {
            //           final Dairyeggs = _filteredDairyEggs[index];
            //           return GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => Beverages(),
            //                   ));
            //             },
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.all(Radius.circular(20)),
            //                 // border: Border.all(color: prodcut_Color[index]),
            //               ),
            //               child: Column(
            //                 children: [
            //                   SizedBox(
            //                     height: 10,
            //                   ),
            //                   Image.asset(Dairyeggs["image"] ?? '',
            //                       height: 80, width: 80),
            //                   Text(Dairyeggs["name"] ?? '',
            //                       style: const TextStyle(
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.bold)),
            //                   Text(Dairyeggs["quantity"] ?? '',
            //                       style: const TextStyle(
            //                           color: Colors.grey, fontSize: 14)),
            //                   Text(Dairyeggs["price"] ?? '',
            //                       style: const TextStyle(
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.bold)),
            //                 ],
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ),

            // ),
          ],
        ),
      ),
    );
  }
}
