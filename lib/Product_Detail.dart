import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final String image;
  final String price;
  final String description;
  final String title;
  final String subtitle;

  const ProductDetail({
    super.key,
    required this.image,
    required this.price,
    required this.description,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int currentIndex = 0;
  bool isFavorite = false;
  int quantity = 1;

  final CarouselSliderController _controller = CarouselSliderController();
  final List<String> images = [
    'assets/image/pngwing.com (3).png',
    'assets/image/pngwing.com (2).png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.file_upload_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Carousel
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                color: Colors.grey.shade200,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: CarouselSlider(
                      items: images
                          .map((item) => ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ))
                          .toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  DotsIndicator(
                    dotsCount: images.length,
                    position: currentIndex,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Product Details
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
                            Text(
                              widget.title,
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              widget.subtitle,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if(quantity> 1) quantity--;
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                    widget.description,
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 210),
                        child: Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
