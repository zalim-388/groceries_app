import 'package:flutter/material.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  final List<Map<String, String>> Beverage = [
    {
      "image": "assets/image/pngfuel 11.png",
      "name": "Diet Coke",
      "ML/L": "355ml",
      "price": "\$1.99",
      "Description":
          "Mango are nutritious. Mangos may be good for weight loss. Mangos may be good for your heart. As part of a healthful and varied diet.",
    },
    {
      "image": "assets/image/pngfuel 12.png",
      "name": "Sprite Can",
      "ML/L": "325ml",
      "price": "\$1.10",
      "Description":
          "Sprite is refreshing and fizzy. Great for a quick refreshment or pairing with meals.",
    },
    {
      "image":
          "assets/image/toppng.com-sting-energy-drink-cambodia-297x1150.png",
      "name": "Sting",
      "ML/L": "250ml",
      "price": "\$1.00",
      "Description":
          "go are nutritious.Mangos may be good for weight loss. Mangos may be "
    },
    {
      "image": "assets/image/pngegg (10).png",
      "name": "mirinda",
      "ML/L": "2L",
      "price": "\$2.99",
      "Description ":
          "Mirinda is a fruity carbonated drink that's perfect for any celebration.",
    },
    {
      "image": "assets/image/pngfuel 13.png",
      "name": "Coca Cola",
      "ML/L": "325ml",
      "price": "\$1.99",
      "Description ":
          "The classic Coca Cola taste you know and love, in a convenient can.",
    },
    {
      "image": "assets/image/pngegg (9).png",
      "name": "Pepsi",
      "ML/L": "330ml",
      "price": "\$1.99",
      "Description ":
          "Pepsi delivers a bold, refreshing cola taste. Perfect for any time of day.",
    },
    {
      "image": "assets/image/pngegg (7).png",
      "name": "7up",
      "ML/L": "250ml",
      "price": "\$6.99",
      "Description ":
          "A crisp and clean lemon-lime soda, great for refreshment.",
    },
    {
      "image": "assets/image/pngegg (8).png",
      "name": "Fanta",
      "ML/L": "200ml",
      "price": "\$6.59",
      "Description ":
          "Fanta offers a delicious fruity flavor that's fun and refreshing.",
    }
  ];

  bool? check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 30,
            )),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Beverages',
            style: TextStyle(fontSize: 25),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.black,
                                        size: 30,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 120),
                                    child: Text(
                                      'Filters',
                                      style: TextStyle(
                                          fontSize: 29,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  )),
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Categories',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            activeColor: Colors.green,
                                              tristate: true,
                                              value: check,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  check = value;
                                                });
                                              }),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Eggs',
                                            style: TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.tune_outlined,
                  size: 30,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Expanded(
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 15,
            childAspectRatio: 1,
          ),
          itemCount: Beverage.length,
          itemBuilder: (context, index) {
            final beverage = Beverage[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ProductDetail(
                  //               image: ,
                  //               price: beverage["ML/L"]!,
                  //               Description: beverage["Description"]!,
                  //               title: beverage["name"]!,
                  //               subtitle: beverage["price"]!,
                  //             )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        beverage["image"]!,
                        height: 80,
                        width: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              beverage["name"]!,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              beverage["ML/L"]!,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  beverage["price"]!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
