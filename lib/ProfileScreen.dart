import 'package:flutter/material.dart';
import 'package:sell_shopee/BaseScreen.dart';
import 'package:sell_shopee/Include/InputField.dart';

class ProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        childScreen: true,
        selectedIndex: 4,
        screenTitle: 'My Profile',
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Profile Picture Section
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          const AssetImage('assets/user-dummy.png'),
                      backgroundColor: Colors.grey[300],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Implement image picker functionality here
                          print("Change profile picture");
                        },
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.teal,
                          child: Icon(Icons.camera_alt,
                              size: 18, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),

                // Form Fields
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Name Field
                      Inputfield(
                        controllerName: _nameController,
                        name: "Full Name",
                        inputIcon: Icon(Icons.person),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      Inputfield(
                          controllerName: _emailController,
                          name: "Email Address",
                          inputIcon: Icon(Icons.email),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          }),
                      const SizedBox(height: 15),
                      Inputfield(
                        controllerName: _phoneController,
                        name: 'Phone Number',
                        inputIcon: Icon(Icons.phone),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      Inputfield(
                        controllerName: _landmarkController,
                        name: 'Landmark',
                        inputIcon: Icon(Icons.pin_drop),
                        validator: null,
                      ),
                      const SizedBox(height: 15),
                      Inputfield(
                        controllerName: _addressController,
                        name: 'Address',
                        inputIcon: Icon(Icons.home),
                        validator: null,
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Save action
                            print("Name: ${_nameController.text}");
                            print("Email: ${_emailController.text}");
                            print("Phone: ${_phoneController.text}");
                            print("Landmark: ${_landmarkController.text}");
                            print("Address: ${_addressController.text}");
                          }
                        },
                        child: Text("Save Address"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

void main() => runApp(MaterialApp(home: ProfileScreen()));
