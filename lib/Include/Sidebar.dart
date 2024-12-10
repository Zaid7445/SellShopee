import 'package:flutter/material.dart';
import 'package:sell_shopee/Include/TokenManager.dart';
import 'package:sell_shopee/LoginScreen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header
          const UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("john.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 29, 74, 151),
              child: Text('J',
                  style: TextStyle(fontSize: 40, color: Colors.white)),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          // Drawer items
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Refund Policy"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Terms & Conditions"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Privacy Policy"),
            onTap: () => {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () async {
              try {
                // Delete the access token from secure storage
                await TokenManager.deleteAccessToken();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } catch (e) {
                print("Error deleting token: $e");
              }
            },
          ),
        ],
      ),
    );
    ;
  }
}
