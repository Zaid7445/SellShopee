import 'package:flutter/material.dart';
import 'package:sell_shopee/Include/BottomBar.dart';
import 'package:sell_shopee/Include/Sidebar.dart';
import 'package:sell_shopee/MyCartScreen.dart';
import 'package:sell_shopee/NotificationScreen.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  final int selectedIndex;
  final bool showAppBar;
  final bool bottomBar;
  final bool childScreen;
  final bool cartTotal;
  final String screenTitle;

  const BaseScreen(
      {Key? key,
      required this.child,
      this.selectedIndex = 0,
      this.showAppBar = true,
      this.bottomBar = true,
      this.childScreen = false,
      this.cartTotal = false,
      this.screenTitle = ""})
      : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  bool _showAppBar = true;
  bool _bottomBar = true;
  bool _childScreen = false;
  bool _cartTotal = false;
  String _screenTitle = "";

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _showAppBar = widget.showAppBar;
    _bottomBar = widget.bottomBar;
    _childScreen = widget.childScreen;
    _cartTotal = widget.cartTotal;
    _screenTitle = widget.screenTitle;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addToCart() {
    //
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int notificationCount = 5;
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
                              widget.childScreen
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(Icons.arrow_back),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      child: const Icon(Icons.menu),
                                    ),
                              const SizedBox(width: 10),
                              Text(
                                widget.childScreen
                                    ? widget.screenTitle
                                    : 'GROCERY ECOMMERCE',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          !widget.childScreen
                              ? Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyCartScreen()),
                                        );
                                      },
                                      child: Stack(
                                        clipBehavior: Clip
                                            .none, // This allows the count bubble to overflow
                                        children: [
                                          Icon(
                                            Icons.notifications,
                                            size: 30, // Icon size
                                          ),
                                          if (notificationCount > 0)
                                            Positioned(
                                              right: -6,
                                              top: -6,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                constraints: BoxConstraints(
                                                  minWidth: 20,
                                                  minHeight: 20,
                                                ),
                                                child: Text(
                                                  notificationCount.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NotificationScreen()),
                                        );
                                      },
                                      child: Stack(
                                        clipBehavior: Clip
                                            .none, // This allows the count bubble to overflow
                                        children: [
                                          Icon(
                                            Icons.shopping_basket,
                                            size: 30, // Icon size
                                          ),
                                          if (notificationCount > 0)
                                            Positioned(
                                              right: -6,
                                              top: -6,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                constraints: BoxConstraints(
                                                  minWidth: 20,
                                                  minHeight: 20,
                                                ),
                                                child: Text(
                                                  notificationCount.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                ))
            : null,
        drawer: const Sidebar(),
        bottomNavigationBar: _bottomBar
            ? BottomBar(
                selectedIndex: _selectedIndex, onTabSelected: _onItemTapped)
            : widget.cartTotal
                ? Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: screenWidth,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.7), // Shadow color
                                blurRadius: 8, // Blur radius
                                offset: Offset(
                                    0, 4), // Horizontal and Vertical offset
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total : 500',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: addToCart,
                                      child: const Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 237, 34, 34),
                                        padding:
                                            EdgeInsets.fromLTRB(15, 3, 15, 3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    ElevatedButton(
                                      onPressed: (() => {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyCartScreen()))
                                          }),
                                      child: const Text(
                                        'View Cart',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 27, 160, 31),
                                        padding:
                                            EdgeInsets.fromLTRB(15, 3, 15, 3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
        body: widget.child,
      ),
    );
  }
}
