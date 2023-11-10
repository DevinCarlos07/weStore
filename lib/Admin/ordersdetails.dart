import 'package:flutter/material.dart';

class OrdersDetails extends StatefulWidget {
  const OrdersDetails({super.key});

  @override
  State<OrdersDetails> createState() => _OrdersDetailsState();
}

class _OrdersDetailsState extends State<OrdersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Details'),
      ),
    );
  }
}
