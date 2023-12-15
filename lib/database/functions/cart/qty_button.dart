// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:we_store/user/subpages/cart.dart';

class QuantityButton extends StatefulWidget {
  double totalprice;
  double price;
  QuantityButton({super.key, required this.totalprice, required this.price});

  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      if (quantity < 9) {
        quantity++;
        widget.totalprice += widget.price;
        print(widget.totalprice);
        CartScreen();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Max Limit'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ));
      }
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        widget.totalprice -= widget.price;
        print(widget.totalprice);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          color: Colors.white,
          onPressed: decrementQuantity,
        ),
        const SizedBox(width: 2),
        Text(
          quantity.toString(),
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
        const SizedBox(width: 2),
        IconButton(
          icon: const Icon(Icons.add),
          color: Colors.white,
          onPressed: incrementQuantity,
        ),
      ],
    );
  }
}
