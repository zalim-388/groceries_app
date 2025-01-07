import 'package:flutter/material.dart';
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
                height: 300,
                width: 420,
                decoration: BoxDecoration(
           color:  Colors.green,
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 160,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
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
                            height: 70,
                            width: 160,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
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
                top: 160,
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  child: SimpleDialogOption(
                    onPressed: () {
                      opendilog(context, nameController);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_2_outlined,color: Colors.white,
                          size: 35,
                        ),
                        Consumer<name>(
                          builder: (context, model, child) {
                            return Text(
                              model.userName ?? "Enter your name",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
SizedBox(height: 10,),









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
