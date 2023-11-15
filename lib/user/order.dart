import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/user/canceldetails.dart';
import 'package:we_store/user/orderdetails.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'My Order',
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 22),
          ),
          centerTitle: true,
          bottom: TabBar(
              tabs: const [
                Tab(
                  text: 'Orderd',
                ),
                Tab(
                  text: 'Canceled',
                ),
              ],
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              indicatorWeight: 3,
              labelStyle: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        body: TabBarView(
          children: const [OrderDetails(), CancelDetails()],
        ),
      ),
    );
  }
}
