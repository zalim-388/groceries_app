import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: 420,
                  decoration: BoxDecoration(
                    color: Colors.green.shade400,
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
                              height: 60,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  )),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 60,
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
                                      
                                ],
                              ),
                            )
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
          ],
        ));
  }
}
