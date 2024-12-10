import 'package:flutter/material.dart';
import 'package:sell_shopee/BaseScreen.dart';
import 'package:sell_shopee/PlaceOrderScreen.dart';

class MyCartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orderItems = [
    {"name": "Product 1", "quantity": 2, "price": 500},
    {"name": "Product 2", "quantity": 1, "price": 250},
    {"name": "Product 3", "quantity": 3, "price": 750},
  ];

  // Calculate the total price
  int getTotalPrice() {
    return 500;
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        childScreen: true,
        selectedIndex: 3,
        screenTitle: 'My Cart',
        cartTotal: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: orderItems.length + 1, // Add 1 for the total price tile
            itemBuilder: (context, index) {
              // If it's the last tile, display the total price
              if (index == orderItems.length) {
                return Column(
                  children: [
                    Card(
                      color: const Color.fromARGB(255, 224, 216, 216),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      elevation: 3,
                      child: ListTile(
                        title: const Text(
                          "Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        trailing: Text(
                          "₹${getTotalPrice()}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlaceOrderScreen()));
                      },
                      child: Text("Proceed To Order"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                );
              }

              // Otherwise, display the cart item
              final item = orderItems[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 5),
                elevation: 3,
                child: ListTile(
                  title: Text(
                    item["name"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(
                    "Quantity: ${item["quantity"]} | Price: ₹${item["price"]}",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  trailing: Text(
                    "₹${item["quantity"] * item["price"]}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

void main() => runApp(MaterialApp(home: MyCartScreen()));
