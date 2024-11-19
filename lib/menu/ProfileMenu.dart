import 'package:flutter/material.dart';
import 'package:pas_project/widget/reuseblecard.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 8,
          ),
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Profile Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ReusableCard(leading: Icon(Icons.bookmark,color: Colors.white,), title:"Saved Menu"),
          ReusableCard(leading: Icon(Icons.settings, color: Colors.white,), title:"Setting"),
          ReusableCard(leading: Icon(Icons.logout, color: Colors.white,), title:"Logout"),
        ]),
      ),
    );
  }
}


