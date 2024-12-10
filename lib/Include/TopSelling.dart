import 'package:flutter/material.dart';
import 'package:sell_shopee/Include/ProductCard.dart';
import 'package:sell_shopee/Include/Thead.dart';

class TopSelling extends StatelessWidget {
  final bool header;
  const TopSelling({super.key, this.header = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header ? Thead(text: 'Top Selling Product') : SizedBox(height: 10),
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Colors
                        .transparent, // Ensures Material context for InkWell
                    child: ProductCard(),
                  ),
                  Material(
                    color: Colors
                        .transparent, // Ensures Material context for InkWell
                    child: ProductCard(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Colors
                        .transparent, // Ensures Material context for InkWell
                    child: ProductCard(),
                  ),
                  Material(
                    color: Colors
                        .transparent, // Ensures Material context for InkWell
                    child: ProductCard(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Colors
                        .transparent, // Ensures Material context for InkWell
                    child: ProductCard(),
                  ),
                  Material(
                    color: Colors
                        .transparent, // Ensures Material context for InkWell
                    child: ProductCard(),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
