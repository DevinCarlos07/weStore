// ignore_for_file: sized_box_for_whitespace, camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';

class cart_image extends StatelessWidget {
  const cart_image({
    super.key,
    required this.cart,
  });

  final AddCart cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 108,
      child: Image.file(
        File(cart.imagepath),
        fit: BoxFit.cover,
      ),
    );
  }
}
