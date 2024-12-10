import 'package:flutter/material.dart';
import 'package:sell_shopee/BaseScreen.dart';
import 'package:sell_shopee/Include/ProductCard.dart';
import 'package:sell_shopee/Include/TopSelling.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // List of categories for the dropdown
  final List<String> categories = [
    'Electronics',
    'Clothing',
    'Home & Furniture',
    'Beauty',
    'Sports',
    'Books',
  ];
  final List<String> prices = [
    '1-100',
    '101-200',
    '201-300',
    '301-400',
    '401-500',
    '401-above',
  ];

  String? selectedCategory = 'All Category'; // Default category
  String? selectedPrice = 'High To Low'; // Default category

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BaseScreen(
      selectedIndex: 2,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  // "All Category" container
                  GestureDetector(
                    onTap: () => _showCategoryDropdown(context),
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * .03),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: const Color.fromARGB(202, 209, 209, 209),
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                      ),
                      child: Text(
                        selectedCategory ??
                            'All Category', // Display selected category
                        style: TextStyle(fontSize: screenWidth * .04),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * .03),

                  // "High To Low" container
                  GestureDetector(
                    onTap: () => _showPriceDropdown(context),
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * .03),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: const Color.fromARGB(202, 209, 209, 209),
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                      ),
                      child: Text(
                        selectedPrice ?? 'High To Low',
                        style: TextStyle(fontSize: screenWidth * .04),
                      ),
                    ),
                  ),
                ],
              ),
              TopSelling(header: false),
            ],
          ),
        ),
      ),
    );
  }

  // Show the category dropdown in a modal bottom sheet
  void _showCategoryDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(categories[index]),
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                        Navigator.pop(context); // Close the bottom sheet
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPriceDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Price',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: prices.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(prices[index]),
                      onTap: () {
                        setState(() {
                          selectedPrice = prices[index];
                        });
                        Navigator.pop(context); // Close the bottom sheet
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
