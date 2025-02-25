import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/Favourite.dart';
import 'package:groceries_app/MyCart.dart';
import 'package:groceries_app/onbording.dart';
import 'package:groceries_app/provider.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final TextEditingController nameController = TextEditingController();
  bool isdarkmode = false;

  void toggletheme() {
    setState(() {
      isdarkmode = !isdarkmode;
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isdarkmode
          ? ThemeData.dark()
          : ThemeData.light().copyWith(
              primaryColor: Colors.green,
              scaffoldBackgroundColor: Colors.green,
            ),
      home: Scaffold(
          // backgroundColor: Colors.green,
          body: SingleChildScrollView(
            child: Column(children: [
                    Stack(
            children: [
              Container(
                height: 250,
                width: 420,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 350),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 200),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Positioned(
                  left: 155,
                  top: 100,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        child: SimpleDialogOption(
                          onPressed: () {
                            opendilog(context, nameController);
                          },
                          child: Row(
                            children: [
                              Text(
                                'Name :',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              Consumer<name>(
                                builder: (context, model, child) {
                                  return Text(
                                    model.userName ?? "Enter your name",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  )),
              Positioned(
                left: 220,
                top: 170,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt_outlined),
                    )),
              ),
              Positioned(
                right: 30.r,
                top: 100,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt_outlined),
                      iconSize: 15,
                    )),
              ),
            ],
                    ),
                    SizedBox(
            height: 10.h,
                    ),
                    Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 80.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          Text(
                            'Search',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Container(
                      height: 80.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: Colors.white,
                              )),
                          Text(
                            'share',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(),
                SizedBox(
                  height: 10.h,
                ),
                IntrinsicHeight(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: toggletheme,
                                icon: Icon(
                                  Icons.dark_mode_outlined,
                                  color: isdarkmode ? Colors.green : Colors.black,
                                  size: 35,
                                )),
                            Text(
                              'dark mode',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 35,
                                )),
                            Text(
                              'Address',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Favourite(),));
                                },
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                )),
                            Text(
                              'Wishlist',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.white,
                                  size: 35,
                                )),
                            Text(
                              'Notification',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.payment_outlined,
                                  color: Colors.white,
                                  size: 35,
                                )),
                            Text(
                              'payment',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart(),));
                                },
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                  size: 35,
                                )),
                            Text(
                              'Cart',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Divider(),
                SizedBox(
                  height: 25.h,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Edit profile',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                      SizedBox(
                        width: 40.w,
                      ),
                      VerticalDivider(),
                      SizedBox(
                        width: 20.w,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Order History',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Divider(),
                SizedBox(
                  height: 10.h,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Order List',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                      SizedBox(
                        width: 50.w,
                      ),
                      VerticalDivider(),
                      SizedBox(
                        width: 40.w,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Settings',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.wallet_outlined,
                              size: 50,
                              color: Colors.white,
                            )),
                        Text(
                          'Wallet',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.help_outline_outlined,
                              size: 50,
                              color: Colors.white,
                            )),
                        Text(
                          'help',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => SimpleDialog(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Log Out ?.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Are you sure u want\n       to log out ? ',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Onbording(),
                                                  ));
                                            },
                                            child: Text(
                                              "Log out",
                                              style:
                                                  TextStyle(color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.logout_outlined,
                              size: 50,
                              color: Colors.white,
                            )),
                        Text(
                          'logout',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
                    )
                  ]),
          )),
    );
  }
}

Future<dynamic> opendilog(
    BuildContext context, TextEditingController nameController) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => SimpleDialog(
      backgroundColor: Colors.transparent,
      children: [
        SizedBox(
          width: 1000.w,
          height: 900.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Enter your name',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                TextField(
                  controller: nameController,
                  onChanged: (value) {
                    Provider.of<name>(context, listen: false).Changename(value);
                  },
                  style: TextStyle(color: Colors.green),
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(),
                ),
                SizedBox(
                  height: 600.h,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        )),
                    SizedBox(
                      width: 150.w,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          nameController;
                        },
                        child: Text(
                          'Ok',
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
