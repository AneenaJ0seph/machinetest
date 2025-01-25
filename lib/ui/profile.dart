import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.teal,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('https://img.lovepik.com/free-png/20210926/lovepik-cartoon-avatar-png-image_401440477_wh1200.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Feno Philips',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Present',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Student ID: #23124',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Class & Section: 5A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                buildCard(Icons.dashboard, 'Dashboard'),
                buildCard(Icons.language, 'Languages'),
                buildCard(Icons.swap_horiz, 'Switch Child'),
                buildCard(Icons.person, 'Teachers'),
                buildCard(Icons.lock, 'Privacy Settings'),
                buildCard(Icons.help, 'Help & Support'),
                buildCard(Icons.logout, 'Log out'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(IconData icon, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () {},
      ),
    );
  }

}