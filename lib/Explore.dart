import 'package:flutter/material.dart';
import 'package:groceries_app/Beverages.dart';
import 'package:groceries_app/Eggs_List.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<String> Product_img = [
    'assets/image/pngfuel 6.png',
    'assets/image/pngfuel 8.png',
    'assets/image/pngfuel 9.png',
    'assets/image/pngfuel 6 (1).png',
    'assets/image/pngfuel.png',
    'assets/image/pngfuel 6 (2).png'
  ];
  List<String> prodcut_name = [
    'Frash Fruits\n& Vegetable',
    'Cooking Oil\n& Ghee',
    'Meat & Fish',
    'Bakery & Snacks',
    'Dairy & Eggs',
    'Beverages',
  ];
  List<Color> prodcut_Color = [
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.pink.shade100,
    Colors.purple.shade100,
    Colors.amber.shade100,
    Colors.blue.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Find Products',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextField(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EggsList(),
                        ));
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'search',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: Colors.grey.shade200,
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 600,
                  child: Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1,
                      ),
                      itemCount: prodcut_name.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Beverages(),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              // border: Border.all(color: prodcut_Color[index]),
                              color: prodcut_Color[index],
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  Product_img[index],
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  prodcut_name[index],
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
