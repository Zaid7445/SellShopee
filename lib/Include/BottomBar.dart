import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  const BottomBar(
      {Key? key, required this.selectedIndex, required this.onTabSelected})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

final List<String> _routes = ['/', '/order', '/filter', '/cart', '/profile'];

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'All',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 10, 170, 21),
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        widget.onTabSelected(index);
        Navigator.pushNamed(context, _routes[index]);
      },
    );
  }
}
