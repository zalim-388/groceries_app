import 'package:flutter/material.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  final List<Map<String, String>> Beverage = [
    {
      "image": "assets/image/pngwing.com (2).png",
      "name": "Diet Coke",
      "price": "355ml, Price"
    },
    {
      "image": "assets/image/pngfuel_12.png",
      "name": "Sprite Can",
      "price": "325ml, Price"
    },
    {
      "image": "assets/image/tree-top-juice-apple-grape-64oz_1.png",
      "name": "Apple & Grape Juice",
      "price": "2L, Price"
    },
    {
      "image": "assets/image/tree-top-juice-apple-grape-64oz_1_1.png",
      "name": "Orange Juice",
      "price": "2L, Price"
    },
    {
      "image": "assets/image/pngfuel_13.png",
      "name": "Coca Cola Can",
      "price": "325ml, Price"
    },
    {
      "name": "Pepsi Can",
      "image": "assets/image/pngfuel_14.png",
      "price": "330ml, Price"
    },
    {
      "image": "assets/image/pngegg_7.png",
      "name": "7up",
      "price": "250ml, Price"
    },
    {
      "image": "assets/image/pngegg_8.png",
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
        child:GridView.builder(
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
            // Check if image is null
            beverage["image"] != null
                ? Image.asset(
                    beverage["image"]!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                : Text(
                    'No data',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
            SizedBox(height: 10),
            Text(
              beverage["name"]!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              beverage["price"]!,
              style: TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  },
)

      ),
    );
  }
}
