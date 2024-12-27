import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, String> data;

  const ProductDetail({
    super.key,
    required this.data,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 2;
  int quantity = 1;

  List<Map<String, dynamic>> favoriteItems = [];
  Future<void> savefavstate(Map<String, dynamic> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedProducts =
        favoriteItems.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList("favProducts", updatedProducts);
  }

  @override
  Widget build(BuildContext context) {
    // final List<Widget> imageSliders = widget.image
    //     .map((item) => Container(
    //           child: Container(
    //             child: Image.asset(
    //               item,
    //             ),
    //           ),
    //         ))
    //     .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 30,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.file_upload_outlined,
                  size: 30,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.grey.shade200,
            ),
            child: Container(
              height: 200,
              width: double.infinity,
              child: Expanded(
                child: CarouselSlider(
                  items: [
                    Image.asset(widget.data['image']??''),
                    Image.asset(widget.data['image']??''),
                  ],
                  carouselController: _controller,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data['name']??'',
                          style: TextStyle(fontSize: 30),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.data['size']??'',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: IconButton(
                          onPressed: () async {
                            favoriteItems.add(
                              {
                                'title': widget.data['title'],
                                'subtitle': widget.data['subtitle'],
                                'price': widget.data['price'],
                                'image': widget.data['image'],
                              },
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("${widget.data['name']} add to favorite")),
                            );
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                        icon: Icon(
                          Icons.remove,
                          size: 30,
                        )),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          shape: BoxShape.rectangle),
                      alignment: Alignment.center,
                      child: Text(
                        '$quantity',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 30,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: Text(
                        '\$5.88',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Product Detail',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 30,
                          )),
                    )
                  ],
                ),
                Text(
                  widget.data['description']??'S',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                Row(
                  children: [
                    Text(
                      'Nutritions',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 210),
                      child: Container(
                        height: 25,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        alignment: Alignment.center,
                        child: Text(
                          '100gr',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                Row(
                  children: [
                    Text(
                      'Review',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.star_border_outlined)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.star_border_outlined)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.star_border_outlined)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.star_border_outlined)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.star_border_outlined)),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  alignment: Alignment.center,
                  child: Text(
                    'Add To Basket',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
