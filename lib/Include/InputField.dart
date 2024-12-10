import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController controllerName;
  final String name;
  final Icon inputIcon;
  final String? Function(String?)? validator;
  const Inputfield(
      {super.key,
      required this.controllerName,
      required this.name,
      required this.inputIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(153, 202, 202, 202), // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child: TextFormField(
        controller: controllerName,
        decoration: InputDecoration(
          labelText: name,
          labelStyle: TextStyle(fontSize: 14),
          prefixIcon: inputIcon,
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
