import 'package:flutter/material.dart';
import 'package:sell_shopee/ProductDetailScreen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailScreen()),
        );
      },
      child: Container(
        width: screenWidth * 0.44, // 48% of screen width
        height: 190,
        decoration: BoxDecoration(
          color: Colors.indigo.shade50,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Image(
              image: NetworkImage(
                'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=400',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.39, // Or any desired width
                        padding: const EdgeInsets.all(2),
                        child: const Text(
                          'Yellow Zucchini Squash',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true, // Allows wrapping
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
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '200/-',
                        style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
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
    );
  }
}
