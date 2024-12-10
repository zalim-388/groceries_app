import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/Explore.dart';
import 'package:groceries_app/Home_Screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const Explore(),
    const Center(child: Text('Cart Page')),
    const Center(child: Text('Favourite Page')),
    const Center(child: Text('Account Page')),
  ];

  final List<BottomBarItem> bottomBarItems = [
    BottomBarItem(
      iconData: Icons.storefront,
      label: 'Shop',
    ),
    BottomBarItem(
      iconData: Icons.manage_search_outlined,
      label: 'Explore',
    ),
    BottomBarItem(
      iconData: Icons.shopping_cart_outlined,
      label: 'Cart',
    ),
    BottomBarItem(
      iconData: Icons.favorite_outline,
      label: 'Favourite',
    ),
    BottomBarItem(
      iconData: Icons.person_outline,
      label: 'Account',
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomBarBubble(
        items: bottomBarItems,
        onSelect: (index) {
          setState(() {
            currentIndex = index;
          });
          controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
    );
  }
}
