import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sell_shopee/HomeScreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sell_shopee/Include/TokenManager.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final storage = FlutterSecureStorage();

  bool _isLoading = false;
  void initState() {
    super.initState();
    _checkAuthorization();
  }

  void _checkAuthorization() async {
    String? accessToken = await TokenManager.getAccessToken();

    if (accessToken != null) {
      // If access token exists, navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String phone = _phoneController.text;

      // API endpoString and payload
      String apiUrl = "https://demo.sellshopee.com/api/login";
      Map<String, String> body = {"phone": phone};

      try {
        final response = await http.post(
            Uri.parse('https://demo.sellshopee.com/api/login'),
            body: body);

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          if (data['status']) {
            String accessToken = data['access_token'];
            await TokenManager.setAccessToken(accessToken);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else {
            _showErrorDialog(data['message']);
          }
        } else {
          _showErrorDialog("Failed to login. Please try again.");
        }
      } catch (e) {
        _showErrorDialog("An error occurred: $e");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Login Failed"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("Okay"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Phone field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return "Please enter a valid 10-digit phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),

              // Login button
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: LoginScreen()));
