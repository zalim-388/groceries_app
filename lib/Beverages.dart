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
      "price": "355ml, Price"
    },
    {
      "image": "assets/image/pngfuel 12.png",
      "name": "Sprite Can",
      "price": "325ml, Price"
    },
    {
      "image":
          "assets/image/toppng.com-sting-energy-drink-cambodia-297x1150.png",
      "name": "Sting",
      "price": "250ML, Price"
    },
    {
      "image": "assets/image/pngegg (10).png",
      "name": "mirinda",
      "price": "2L, Price"
    },
    {
      "image": "assets/image/pngfuel 13.png",
      "name": "Coca Cola",
      "price": "325ml, Price"
    },
    {
      "image": "assets/image/pngegg (9).png",
      "name": "Pepsi",
      "price": "330ml, Price"
    },
    {
      "image": "assets/image/pngegg (7).png",
      "name": "7up",
      "price": "250ml, Price"
    },
    {
      "image": "assets/image/pngegg (8).png",
      "name": "Fanta",
      "price": "200ml, Price"
    }
  ];
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
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.tune_outlined,
                  size: 30,
                )),
          )
        ],
      ),
      body: Expanded(
          child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.8,
        ),
        itemCount: Beverage.length,
        itemBuilder: (context, index) {
          final beverage = Beverage[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    beverage["image"]!,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        beverage["name"]!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        beverage["price"]!,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
