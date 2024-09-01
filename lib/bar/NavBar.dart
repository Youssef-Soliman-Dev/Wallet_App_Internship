import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/LoginScreen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Youssef",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text("youssef@gmail.com",
                style: TextStyle(fontWeight: FontWeight.bold)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/mann.png"),
              ),
            ),
          ),
          ListTile(
              leading: IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
              title: Text("Log out"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => LoginScreen()));
              })
        ],
      ),
    );
  }
}
