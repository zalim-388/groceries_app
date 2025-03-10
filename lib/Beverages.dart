import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  bool? eggsChecked = false; // State for the "Eggs" checkbox
  bool? noodlesChecked = false;
  bool? Crispschecked = false;
  bool? checkState = false;
  bool? FastFoodChecked = false;
  bool? Individualchecked = false;
  bool ? CocolaChecked =false;
  bool ? IfadChecked=false;
  bool ? KaziFarmasChecked=false;
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
                    child: StatefulBuilder(builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return Container(
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
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Filters',
                                    style: TextStyle(
                                      fontSize: 29,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.75.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Align(alignment: Alignment.centerLeft,child: 
                                    Text(
                                      'Categories',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.green,
                                          tristate:
                                              false, // Use false for binary values
                                          value: eggsChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              // checkState =
                                              //     value;
                                              eggsChecked =
                                                  value; // Update shared state
                                            });
                                          },
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          'Eggs',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.green,
                                          tristate:
                                              false, // Use false for binary values
                                          value: noodlesChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              // checkState =
                                              //     value;
                                              noodlesChecked = value;
                                              // Update shared state
                                            });
                                          },
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          'Noodles & Pasta',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                            activeColor: Colors.green,
                                            value: Crispschecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                Crispschecked = value;
                                              });
                                            }),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          'Chips & Crisps',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.green,
                                            value: FastFoodChecked,
                                            onChanged: (bool? value) {
                                              setState(
                                                () {
                                                  FastFoodChecked = value;
                                                },
                                              );
                                            }),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          'Fast food',
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Brand',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.green,
                                            value: Individualchecked,
                                            onChanged: (bool? value) {
                                              setState(
                                                () {
                                                  Individualchecked = value;
                                                },
                                              );
                                            }),
                                        SizedBox(width: 10.w),
                                        Text(
                                          'Individual Callection',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.green,
                                            value: CocolaChecked,
                                            onChanged: (bool? value) {
                                              setState(
                                                () {
                                                 CocolaChecked  = value;
                                                },
                                              );
                                            }),
                                        SizedBox(width: 10.w),
                                        Text(
                                          'Cocola',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.green,
                                            value: IfadChecked,
                                            onChanged: (bool? value) {
                                              setState(
                                                () {
                                                  IfadChecked = value;
                                                },
                                              );
                                            }),
                                        SizedBox(width: 10.w),
                                        Text(
                                          'Ifad',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.green,
                                            value: KaziFarmasChecked,
                                            onChanged: (bool? value) {
                                              setState(
                                                () {
                                                  KaziFarmasChecked = value;
                                                },
                                              );
                                            }),
                                        SizedBox(width: 10.w),
                                        Text(
                                          'Kazi Farmas',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              },
              icon: Icon(
                Icons.tune_outlined,
                size: 30,
              ),
            ),
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
                        height: 80.h,
                        width: 80.w,
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
                              height: 20.h,
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
                                  width: 60.w,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 40.h,
                                    width: 40.w,
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
