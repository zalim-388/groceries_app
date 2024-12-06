import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List imagList = [
  //   Image.asset('assets/image/pngwing.com (1).png'),
  //   Image.asset('assets/image/pngfuel 1.png'),
  //   Image.asset('assets/image/pngegg.png'),
  //   Image.asset('assets/image/pngegg (3).png'),
  // ];

  // List<String> text = ['organic banana', 'Red Apple', 'orange', 'Mango'];
  List<String> TExt = [
    '7pcs, Priceg',
    '1kg, Priceg',
    '2kg, Priceg',
    '1kg, Priceg'
  ];
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 4;

  final List<String> imgList = [
    'https://www.shutterstock.com/image-vector/farm-fresh-produce-delivery-home-260nw-2154869859.jpg'
        'https://freshfarmse.com/wp-content/uploads/2023/11/WhatsApp-Image-2023-11-09-at-1.51.07-AM.jpeg',
    'https://www.spencers.in/media/catalog/category/FNV_deatils.jpg',
    'https://i0.wp.com/kjfoods.co.in/wp-content/uploads/2022/03/1592574403-veg_web.jpg?fit=595%2C197&ssl=1',
    'https://i.pinimg.com/474x/b4/70/d0/b470d0e41336aa7a70e20f676e93be5e.jpg',
    'https://i0.wp.com/kjfoods.co.in/wp-content/uploads/2022/03/1628671638-fsfhjllz_vegetables-banner.jpg?fit=595%2C171&ssl=1'
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
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/Group ..png'),
                        fit: BoxFit.contain),
                    shape: BoxShape.rectangle),
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
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 20),
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
              SizedBox(height: 200,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: TExt.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(color: Colors.black,height: 20,width: 100,
                          child: Text(TExt[index],style: TextStyle(color: Colors.white,fontSize: 30),),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
