import 'package:flutter/material.dart';
import 'package:sell_shopee/HomeScreen.dart';
import 'package:sell_shopee/Include/TokenManager.dart';
import 'package:sell_shopee/LoginScreen.dart';
import 'package:sell_shopee/ProfileScreen.dart';
import 'package:sell_shopee/MyCartScreen.dart';
import 'package:sell_shopee/MyOrderScreen.dart';
import 'package:sell_shopee/FilterScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization
  String? accessToken = await TokenManager.getAccessToken();
  runApp(MyApp(accessToken: accessToken));
}

class MyApp extends StatelessWidget {
  final String? accessToken;

  const MyApp({super.key, this.accessToken});

  @override
  Widget build(BuildContext context) {
    print("Token: $accessToken"); // Debugging the token value

    return MaterialApp(
      title: 'SellShopee1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Determine initial screen dynamically
      home: accessToken == null ? LoginScreen() : HomeScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/order': (context) => MyOrderScreen(),
        '/cart': (context) => MyCartScreen(),
        '/filter': (context) => FilterScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
