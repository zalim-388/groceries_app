import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/Product_Detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imagList = [
    'assets/image/pngwing.com (1).png',
    'assets/image/pngfuel 1.png',
    'assets/image/pngegg.png',
    'assets/image/pngegg (3).png',
  ];

  List<String> text = ['banana', 'Red Apple', 'orange', 'Mango'];
  List<String> TExt = ['7pcs', '1kg', '2kg', '1kg'];
  List<String> Description = [
    'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
    'Banana are nutritious. A Banana may be good for weight loss. Bananas may be good for your heart. As part of a healtful and varied diet.',
    'orange are nutritious. oranges may be good for weight loss. orange may be good for your heart. As part of a healtful and varied diet.',
    'Mango are nutritious.Mangos may be good for weight loss. Mangos may be good for your heart. As part of a healtful and varied diet.'
  ];
  List<String> Price = ['\$4.59', '\$4.69', '\$6.99', '\$9.99'];

  List<String> vegetables = [
    'assets/image/92f1ea7dcce3b5d06cd1b1418f9b9413 3.png',
    'assets/image/pngfuel 3.png',
    'assets/image/pngegg (4).png',
    'assets/image/pngegg (5).png'
  ];
  List<String> Vegname = ['Tomato', 'Ginger', 'carrot', 'Potato'];
  List<String> vegPrice = ['\$7.99', '\$4.99', '\$2.99', '\$4.99'];
  List<String> Veg_kg = [
    '2Kg, ',
    '1kg, ',
    '2kg, ',
    '1kg',
  ];

  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 3;

  final List<String> imgList = [
    'https://www.shutterstock.com/image-vector/farm-fresh-produce-delivery-home-260nw-2154869859.jpg'
        'https://freshfarmse.com/wp-content/uploads/2023/11/WhatsApp-Image-2023-11-09-at-1.51.07-AM.jpeg',
    'https://www.spencers.in/media/catalog/category/FNV_deatils.jpg',
    'https://i0.wp.com/kjfoods.co.in/wp-content/uploads/2022/03/1592574403-veg_web.jpg?fit=595%2C197&ssl=1',
    'https://i.pinimg.com/474x/b4/70/d0/b470d0e41336aa7a70e20f676e93be5e.jpg',
    'https://i0.wp.com/kjfoods.co.in/wp-content/uploads/2022/03/1628671638-fsfhjllz_vegetables-banner.jpg?fit=595%2C171&ssl=1'
  ];
  List<String> Groceries = [
    'assets/image/Pulses.png',
    'assets/image/rice.png',
    'assets/image/pngfuel 6 (1).png',
    'assets/image/pngfuel 6 (2).png'
  ];
  List<String> groceries_name = ['Pulses', 'Rice', 'Snacks', 'Beverages'];

  List<Color> colors = [ Colors.amber.shade200, Colors.green.shade200,Colors.blue.shade200,Colors.blueGrey];
  

  List<String> meat = [
    'assets/image/pngfuel 4.png',
    'assets/image/pngfuel 5.png',
    'assets/image/pngegg (6).png',
  ];
  List<String> meat_name = ['Beef Bone', 'Broiler Chicken', 'Fish       '];
  List<dynamic> meat_kg = ['1kg', '1kg', '1kg', '1kg'];
  List<String> meatPrice = [
    '\$4.59',
    '\$4.69',
    '\$6.99',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                child: Image.network(
                  item,
                ),
              ),
            ))
        .toList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/Group ..png'),
                            fit: BoxFit.contain),
                        shape: BoxShape.rectangle),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on_rounded,
                          color: Colors.grey,
                          size: 35,
                        )),
                    Text(
                      'Dhaka, Banassre',
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 20),
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Search Store',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 368,
                  child: Expanded(
                    child: CarouselSlider(
                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Exclusive Offer',
                          style: TextStyle(fontSize: 25),
                        )),
                    SizedBox(
                      width: 150,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 200,
                    child: Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: TExt.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                          image: imagList[index],
                                          price: Price[index],
                                          title: text[index],
                                          subtitle: TExt[index],
                                          description: Description[index],
                                        ),
                                      ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 40,
                                  width: 150,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        imagList[index],
                                        height: 80,
                                        width: 80,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 50),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              text[index],
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              TExt[index],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              Price[index],
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    shape: BoxShape.rectangle),
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.add),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'Best Selling',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 180,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'see all',
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ))
                  ],
                ),
                SizedBox(
                  height: 220,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: vegetables.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      vegetables[index],
                                      height: 80,
                                      width: 80,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 60),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Vegname[index],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            Veg_kg[index],
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            vegPrice[index],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                shape: BoxShape.rectangle),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.add),
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Groceries',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                    SizedBox(
                      width: 200,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'see all',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 100,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Groceries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                              color: colors[index],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Image.asset(
                                    Groceries[index],
                                    height: 80,
                                    width: 80,
                                  ),
                                  Text(
                                    groceries_name[index],
                                    style: TextStyle(fontSize: 17),
                                  ),
     

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: meat.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              width: 180,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  Image.asset(
                                    meat[index],
                                    height: 80,
                                    width: 80,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 60),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          meat_name[index],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          meat_kg[index],
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Text(
                                          meatPrice[index],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(width: 50,),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.all(Radius.circular(15)),shape:  BoxShape.rectangle),
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
