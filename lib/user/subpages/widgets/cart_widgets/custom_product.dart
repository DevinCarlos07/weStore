// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';

class custom_productdetails extends StatelessWidget {
  const custom_productdetails({
    super.key,
    required this.cart,
  });

  final AddCart cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          cart.name,
          style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 15,
        ),
        Text('₹${cart.price}',
            style: GoogleFonts.rubik(color: Colors.green, fontSize: 15)),
        SizedBox(
          height: 15,
        ),
        Text(cart.details)
      ],
    );
  }
}
