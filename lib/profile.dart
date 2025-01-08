import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: 380,
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
                  right: 30,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: 160,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 80,
                            width: 170,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
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
                right: 30,
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
          const SizedBox(
            height:10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Divider(),
                SizedBox(
                  height: 10,
                ),
                IntrinsicHeight(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.white,
                                  size: 35,
                                )),

                                Text('Name',style: TextStyle(fontSize: 17,color: Colors.white),)
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 15,
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
                                Text('Address',style: TextStyle(fontSize: 17,color: Colors.white),)
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),

                                Text('Wishlist',style: TextStyle(fontSize: 17,color: Colors.white),)
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 15,
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

                                Text('Notification',style: TextStyle(fontSize: 17,color: Colors.white),)
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 15,
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
                                Text('payment',style: TextStyle(fontSize: 17,color: Colors.white),)
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.error_outline,
                                  color: Colors.white,
                                  size: 35,
                                )),

                                Text('About',style: TextStyle(fontSize: 17,color: Colors.white),)
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(),
                SizedBox(
                  height: 25,
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
                        width: 40,
                      ),
                      VerticalDivider(),
                      SizedBox(
                        width: 20,
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
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
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
                        width: 50,
                      ),
                      VerticalDivider(),
                      SizedBox(
                        width: 40,
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
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 40,
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

                            Text('Wallet',style: TextStyle(color: Colors.white,fontSize: 15),)
                      ],
                    ),
                    SizedBox(
                      width: 80,
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
                      width: 80,
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
                                      height: 25,
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
                                            width: 50,
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
                                              style: TextStyle(
                                                  color: Colors.black),
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
        ]));
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
          width: 1000,
          height: 900,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
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
                  height: 600,
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
                      width: 150,
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
