import 'package:flutter/material.dart';
import 'package:sell_shopee/BaseScreen.dart';
import 'package:sell_shopee/Include/BottomBar.dart';
import 'package:sell_shopee/Include/CategorySlider.dart';
import 'package:sell_shopee/Include/Sidebar.dart';
import 'package:sell_shopee/Include/Thead.dart';
import 'package:sell_shopee/Include/TopSelling.dart';

class CategoryProductScreen extends StatefulWidget {
  const CategoryProductScreen({super.key});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      childScreen: true,
      screenTitle: 'Lettuce',
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [TopSelling()],
        ),
      ),
    );
  }
}
