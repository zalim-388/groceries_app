import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  // final Map<String, String> data;
  final String image;
     final String   price;
   final  String Description;
   final  String title;
  final String subtitle;
  const ProductDetail({
    super.key,
    // required this.data,
   required this.image, required this.price, required this.Description, required this.title, required this.subtitle,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 2;
  int quantity = 1;

  List<Map<String, String>> favoriteItems = [];
  Future<void> savefavstate(Map<String, String> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedProducts =
        favoriteItems.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList("favProducts", updatedProducts);
  }

  bool favorite = false;

  @override
  void isfavorite() {
    
    setState(() {
      favorite = !favorite;
    });
  }

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
            height: 300.h,
            width: 450.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.grey.shade200,
            ),
            child: Expanded(
              child: CarouselSlider(
                items: [
                  Image.asset(widget.image ?? ''),
                ],
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
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title ?? '',
                              style: TextStyle(fontSize: 30)),
                          Text(widget.subtitle ?? '',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20)),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        isfavorite();
                        favoriteItems.add({
                          'title': widget.title ?? '',
                          'subtitle': widget.subtitle ?? '',
                          'price': widget.price?? '',
                          'image': widget.image ?? '',
                        });
                        await savefavstate(Map()); 
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "${widget.title} added to favorite")),
                        );
                      },
                      icon: Icon(
                        favorite ? Icons.favorite : Icons.favorite_border,
                        color: favorite ? Colors.green : Colors.grey,
                        
                      ),
                      
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
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
                      height: 40.h,
                      width: 40.w,
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
                  height: 10.h,
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 10.h,
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
                  widget.Description ?? 'S',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 5.h,
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
                        height: 25.h,
                        width: 40.w,
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
                  height: 5.h,
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
                  height: 10.h,
                ),
                Container(
                  height: 70.h,
                  width: 350.w,
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
