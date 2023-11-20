import 'package:flutter/material.dart';

import 'package:we_store/Admin/addproduct.dart';

import 'package:we_store/Admin/ordersdetails.dart';
import 'package:we_store/Admin/userslist.dart';
import 'package:we_store/Admin/viewproducts.dart';
import 'package:we_store/common/bottomnav.dart';
import 'package:hive/hive.dart';
import 'package:we_store/common/signup.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _openBox();
  }

  late Box UserBox = Hive.box('signup_db');
  Future<void> _openBox() async {
    UserBox = await Hive.openBox('signup_db');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Admin Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 225, 125, 125),
          leading: Icon(Icons.home)),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                Image.asset(
                  'assets/images/star.jpg',
                  width: 60,
                  height: 60,
                ),
                SizedBox(height: 10),
                Text(
                  "We Store",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300]),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'Add Products',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => AddProduct()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300]),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'View Products',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => ViewProduct()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300]),
                  // clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'Users List',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => UsersList()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300]),
                  // clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'Orders Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => OrdersDetails()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300]),
                  // clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'Feedback',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => MyBottam()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300]),
                  // clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(
                      'Log out',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) => SignUp()));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
