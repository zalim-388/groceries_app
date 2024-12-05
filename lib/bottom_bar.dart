import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarBubble(
        items: [
          BottomBarItem(
            iconData: Icons.shopify_outlined,
            label: 'Shop',
          ),
          BottomBarItem(iconData: Icons.manage_search_outlined,
              label: 'Explore',
              ),
          BottomBarItem(iconData: Icons.shopping_cart_outlined,
              label: 'Cart',
              ),
          BottomBarItem(
            iconData: Icons.favorite_outline,
            label: 'Favourite',
          ),
          BottomBarItem(
            iconData: Icons.person_2_outlined,
            label: 'Account',
          ),
        ],
        onSelect: (index) {
          // implement your select function here
        },
      ),
      body: PageView(
        controller: controller,
        children: const <Widget>[
          // Center(
          //   child: Text('First Page'),
          // ),

          HomeScreen(),
          Center(
            child: Text('Second Page'),
          ),
          Center(
            child: Text('Third Page'),
          ),
          Center(
            child: Text('Four Page'),
          ),
          Center(
            child: Text('Five Page'),
          ),
        ],
      ),
    );
  }
}
