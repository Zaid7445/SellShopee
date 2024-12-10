import 'package:flutter/material.dart';

import 'package:sell_shopee/BaseScreen.dart';
import 'package:sell_shopee/Include/BottomBar.dart';
import 'package:sell_shopee/Include/CategorySlider.dart';
import 'package:sell_shopee/Include/Sidebar.dart';
import 'package:sell_shopee/Include/Thead.dart';
import 'package:sell_shopee/Include/ImageSlider.dart';
import 'package:sell_shopee/Include/TokenManager.dart';
import 'package:sell_shopee/Include/TopSelling.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void getToken() async {
    String? accessToken = await TokenManager.getAccessToken();
    // print("Token: $accessToken"); // Print the token here
  }

  @override
  Widget build(BuildContext context) {
    getToken(); // Call the function to fetch and print the token
    Future<String?> token = TokenManager.getAccessToken();
    final List<String> imageUrls = [
      'https://awplife.com/wp-content/uploads/2017/05/banner-772x2506.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuceL-3lj_ouPkXf6F08nwGiSAfXTcrQxepzqpTxv9ONNI25ZOtZWEmh5wkEQZ8Co0Rg&usqp=CAU',
      'https://arihantmargi.in/matrimonial/upload/user/173251562617429.jpg',
    ];
    double screenWidth = MediaQuery.of(context).size.width;
    double viewportFraction = screenWidth > 600 ? 0.75 : 0.98;

    return BaseScreen(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
              child: CarouselSlider.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index, realIdx) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false, // Don't enlarge the center image
                  aspectRatio: 32.5 / 10,
                  viewportFraction: viewportFraction, // Adjust for slight gap
                  scrollPhysics: BouncingScrollPhysics(),
                  enableInfiniteScroll: true,
                  initialPage: 0,
                ),
              ),
            ),
            Thead(text: 'All Categories'),
            CategorySlider(),
            TopSelling()
          ],
        ),
      ),
    );
  }
}
