import 'package:flutter/material.dart';

// Custom Text Widget with dynamic text
class Thead extends StatelessWidget {
  final String text;

  // Constructor with required dynamic text
  const Thead({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
