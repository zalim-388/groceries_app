import 'package:flutter/material.dart';
import 'package:groceries_app/Beverages.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<String> _filteredList = [];

  final List<String> _Product_img = [
    'assets/image/pngfuel 6.png',
    'assets/image/pngfuel 8.png',
    'assets/image/pngfuel 9.png',
    'assets/image/pngfuel 6 (1).png',
    'assets/image/pngfuel.png',
    'assets/image/pngfuel 6 (2).png'
  ];
  final List<String> _prodcut_name = [
    'Frash Fruits\n& Vegetable',
    'Cooking Oil\n& Ghee',
    'Meat & Fish',
    'Bakery & Snacks',
    'Dairy & Eggs',
    'Beverages',
  ];
  final List<Color> _prodcut_Color = [
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.pink.shade100,
    Colors.purple.shade100,
    Colors.amber.shade100,
    Colors.blue.shade100,
  ];

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initstate() {
    super.initState();
    _filteredList = _prodcut_name;
  }

  void _filterLogListBySearchText(String searchText) {
    setState(() {
      if (searchText.isNotEmpty) {
        _filteredList = _prodcut_name;
      } else {
        _filteredList = _prodcut_name
            .where(
                (name) => name.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      }
    });
  }

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
                  controller: _controller,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () => Focus.of(context).unfocus(),
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: 'search',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _controller.clear();
                            _filterLogListBySearchText("");
                          },
                          icon: Icon(Icons.clear_rounded)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: Colors.grey.shade200,
                      filled: true),
                  onChanged: (value) => _filterLogListBySearchText(value),
                  onSubmitted: (value) => _filterLogListBySearchText(value),
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
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _filteredList.length,
                      shrinkWrap: true,
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
                              color: _prodcut_Color[index],
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  _Product_img[index],
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  _prodcut_name[index],
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
              ),
              // Expanded(
              //   child: GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 5,
              //       mainAxisSpacing: 15,
              //       childAspectRatio: 1,
              //     ),
              //     itemCount: _DairEggs.length,
              //     itemBuilder: (context, index) {
              //       final eggList = _DairEggs[index];
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 10),
              //         child: Container(
              //           width: 180,
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Colors.grey),
              //             borderRadius: BorderRadius.all(Radius.circular(20)),
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               Image.asset(
              //                 eggList["image"]!,
              //                 height: 80,
              //                 width: 80,
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.only(left: 20),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       eggList["name"]!,
              //                       style: TextStyle(
              //                           fontSize: 20,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                     Text(
              //                       eggList["quantity"]!,
              //                       style: TextStyle(
              //                           color: Colors.grey, fontSize: 14),
              //                     ),
              //                     SizedBox(
              //                       height: 20,
              //                     ),
              //                     Row(
              //                       children: [
              //                         Text(
              //                           eggList["price"]!,
              //                           style: TextStyle(
              //                               fontSize: 18,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                         SizedBox(
              //                           width: 60,
              //                         ),
              //                         Container(
              //                           height: 40,
              //                           width: 40,
              //                           decoration: BoxDecoration(
              //                               color: Colors.green,
              //                               borderRadius: BorderRadius.all(
              //                                   Radius.circular(15))),
              //                           child: IconButton(
              //                               onPressed: () {},
              //                               icon: Icon(
              //                                 Icons.add,
              //                                 color: Colors.white,
              //                               )),
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    ));
  }
} 


