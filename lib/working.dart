import 'package:flutter/material.dart';
import 'package:sell_shopee/Include/CategorySlider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SellShopee1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Default index
  bool _showAppBar = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different screens based on index
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
      // Add more cases if there are other screens
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: _showAppBar
            ? PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: AppBar(
                  backgroundColor: const Color.fromARGB(129, 67, 248, 35),
                  automaticallyImplyLeading: false,
                  title: Builder(
                    builder: (BuildContext context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: const Icon(Icons.menu),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'GROCERY ECOMMERCE',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () => {},
                                  child: const Icon(Icons.notifications)),
                              const SizedBox(width: 10),
                              InkWell(
                                  onTap: () => {},
                                  child: const Icon(Icons.shopping_basket)),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ))
            : null,
        drawer: const Sidebar(),
        bottomNavigationBar: const BottomBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Thead(text: 'All Categories'),
              const CategorySlider(),
              Column(
                children: [
                  const Thead(text: 'Top Selling Product'),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Material(
                              color: Colors
                                  .transparent, // Ensures Material context for InkWell
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductDetailScreen()),
                                  );
                                },
                                child: Container(
                                  width:
                                      screenWidth * 0.44, // 48% of screen width
                                  height: 190,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo.shade50,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                  child: const Column(
                                    children: [
                                      Image(
                                        image: NetworkImage(
                                          'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=400',
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width:
                                                      180, // Or any desired width
                                                  child: const Text(
                                                    'Yellow Zucchini Squash',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    softWrap:
                                                        true, // Allows wrapping
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  '120/-',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.green),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '200/-',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy Sidebar, BottomBar, Thead, ProductDetailScreen and ProfileScreen
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView());
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        // Handle bottom navigation tap
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

class Thead extends StatelessWidget {
  final String text;
  const Thead({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Product Details")));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Profile Screen")));
  }
}
