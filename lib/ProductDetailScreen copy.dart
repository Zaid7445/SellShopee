import 'package:flutter/material.dart';
import 'package:sell_shopee/BaseScreen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  double unitPrice = 30.0; // The unit price of the product

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  double get totalPrice {
    return unitPrice * quantity;
  }

  void addToCart() {
    // Placeholder for adding the product to cart
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BaseScreen(
        showAppBar: false,
        bottomBar: false,
        cartTotal: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Stack to position the arrows over the image
              Stack(
                children: [
                  // Image container with the background image
                  Container(
                    width: screenWidth,
                    height: screenHeight *
                        0.4, // Adjust the height of the image area
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 211, 209, 204),
                    ),
                    child: const Image(
                      image: AssetImage('assets/detail.jpg'),
                      fit: BoxFit
                          .cover, // Ensures image covers the container area
                    ),
                  ),
                  // Positioned Arrow in the top left corner
                  Positioned(
                    top: 20, // Adjust the distance from the top edge
                    left: 20, // Adjust the distance from the left edge
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 24, // Icon size
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20, // Adjust the distance from the top edge
                    right: 20, // Adjust the distance from the left edge
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 24, // Icon size
                      ),
                    ),
                  ),
                ],
              ),
              // Content below the image
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            clipBehavior: Clip
                                .hardEdge, // Clip the image to the border radius
                            child: Image(
                              image: AssetImage('assets/detail.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            clipBehavior: Clip
                                .hardEdge, // Clip the image to the border radius
                            child: Image(
                              image: AssetImage('assets/detail.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            clipBehavior: Clip
                                .hardEdge, // Clip the image to the border radius
                            child: Image(
                              image: AssetImage('assets/detail.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            clipBehavior: Clip
                                .hardEdge, // Clip the image to the border radius
                            child: Image(
                              image: AssetImage('assets/detail.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            clipBehavior: Clip
                                .hardEdge, // Clip the image to the border radius
                            child: Image(
                              image: AssetImage('assets/detail.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          // Repeat as needed for other images
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: screenWidth,
                      child: const Text(
                        'Yellow Zucchini Squash1',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth,
                      child: const Text(
                        'Category Name',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  size: screenWidth * .06,
                                  color: Colors.orange,
                                );
                              }),
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Text(
                                  'Rs 30/-',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 14, 183, 48),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Rs 50/-',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 234, 9, 9),
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                    255, 192, 192, 192), // Background color
                                shape:
                                    BoxShape.circle, // Makes the box circular
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Center(
                                  child: Icon(
                                    size: 16,
                                    Icons.remove,
                                    color: Colors.white, // Icon color
                                  ),
                                ),
                                onPressed: decrement,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '$quantity',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.green, // Background color
                                shape:
                                    BoxShape.circle, // Makes the box circular
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white, // Icon color
                                ),
                                onPressed: increment,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Product Description',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tincidunt metus non justo vulputate, nec congue eros malesuada. Maecenas nec sollicitudin tortor. Suspendisse vehicula lectus in turpis dictum, eget vulputate lorem pharetra. Integer sagittis semper nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tincidunt metus non justo vulputate, nec congue eros malesuada. Maecenas nec sollicitudin tortor. Suspendisse vehicula lectus in turpis dictum, eget vulputate lorem pharetra. Integer sagittis semper nisl.',
                        textAlign: TextAlign.justify),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
