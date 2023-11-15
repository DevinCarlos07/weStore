import 'package:flutter/material.dart';

import 'package:we_store/user/fav.dart';
import 'package:we_store/user/home.dart';
import 'package:we_store/user/order.dart';
import 'package:we_store/user/profile.dart';

class MyBottam extends StatefulWidget {
  const MyBottam({super.key});

  @override
  State<MyBottam> createState() => _MyBottamState();
}

class _MyBottamState extends State<MyBottam> {
  int indexNum = 0;
  List screen = [
    UserHome(),
    Orders(),
    Favourite(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen.elementAt(indexNum),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          //Item1
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 251, 253, 255),
          ),
          //iterm 2
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          //item 3
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
              backgroundColor: Color.fromARGB(255, 255, 255, 255)),
          //item 4
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
              backgroundColor: Color.fromARGB(255, 252, 254, 255)),
        ],
        currentIndex: indexNum,
        showSelectedLabels: true,
        onTap: (int index) {
          setState(() {
            indexNum = index;
          });
        },
        iconSize: 30,
        showUnselectedLabels: true,
        selectedItemColor: Color.fromARGB(255, 4, 133, 239),
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
