import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'name': 'Sprite',
      'size': '325ml',
      'price': 1.99,
      'imagePath': 'assets/image/pngfuel 12.png',
    },
    {
      'name': 'Diet Coke',
      'size': '355ml',
      'price': 1.99,
      'imagePath': 'assets/image/pngfuel 11.png',
    },
    {
      'name': 'Coca Cola',
      'size': '325ml',
      'price': 4.99,
      'imagePath': 'assets/image/pngfuel 13.png',
    },
    {
      'name': '7up',
      'size': '2L',
      'price': 15.88,
      'imagePath': 'assets/image/pngegg (7).png',
    },
    {
      'name': 'Pepsi',
      'size': '330ml',
      'price': 4.99,
      'imagePath': 'assets/image/pngegg (9).png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Favorurite',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/pngfuel 12.png',
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('sprite',
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          Text(
                            '325ml',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        '\$1.99',
                        style: TextStyle(fontSize: 17),
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
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/pngfuel 11.png',
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Diet Coke',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '355ml',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        '\$1.99',
                        style: TextStyle(fontSize: 17),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 25,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/pngfuel 13.png',
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Coca Cola',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '325ml',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        '\$4.99',
                        style: TextStyle(fontSize: 17),
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
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/pngegg (7).png',
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '7up',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '2L',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        '\$15.88',
                        style: TextStyle(fontSize: 17),
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
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/pngegg (9).png',
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            'Pepsi',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '330ml',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        '\$4.99',
                        style: TextStyle(fontSize: 17),
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
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    alignment: Alignment.center,
                    child: Text(
                      'Add All To Cart',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
