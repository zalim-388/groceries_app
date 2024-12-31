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
        appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        backgroundColor: Colors.green.shade800,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: 420,
                  decoration: BoxDecoration(
                    color: Colors.green.shade400,
                  ),
                ),
                Positioned(
                    left: 150,
                    top: 60,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.green,
                      ),
                    )),
                Positioned(
                  left: 200,
                  top: 130,
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
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                )
              ],
            )
          ],
        ));
  }
}
