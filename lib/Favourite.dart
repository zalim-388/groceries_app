import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Favorurite',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
              ),
            ),
SizedBox(height: 30,),
            Divider()
          ],
        ),
      ),
    );
  }
}
