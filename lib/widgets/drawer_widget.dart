// lib/widgets/drawer_widget.dart

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/user_avatar.png"),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/home");
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("My Cart"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/cart");
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Order History"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/history");
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/profile");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/settings");
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/login");
            },
          ),
        ],
      ),
    );
  }
}
