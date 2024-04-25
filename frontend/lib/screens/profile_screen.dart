import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_pic.jpg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'John Doe',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 40), // Add spacing between profile info and options
            ListTile(
              leading: Icon(Icons.person_outline, color: Colors.white),
              title: Text(
                'Change Password',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {},
            ),
            Divider(color: Colors.grey[700]),
            ListTile(
              leading: Icon(Icons.notifications_outlined, color: Colors.white),
              title: Text(
                'Notifications',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {},
            ),
            Divider(color: Colors.grey[700]),
            ListTile(
              leading: Icon(Icons.settings_outlined, color: Colors.white),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {},
            ),
            Divider(color: Colors.grey[700]),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {},
            ),
            Divider(color: Colors.grey[700]),
          ],
        ),
      ),
    );
  }
}
