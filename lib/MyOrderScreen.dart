import 'package:flutter/material.dart';
import 'package:sell_shopee/BaseScreen.dart';

class MyOrderScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orderItems = [
    {"name": "Product 1", "quantity": 2, "price": 500},
    {"name": "Product 2", "quantity": 1, "price": 250},
    {"name": "Product 3", "quantity": 3, "price": 750},
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        childScreen: true,
        selectedIndex: 1,
        screenTitle: 'My Order',
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
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

void main() => runApp(MaterialApp(home: MyOrderScreen()));
