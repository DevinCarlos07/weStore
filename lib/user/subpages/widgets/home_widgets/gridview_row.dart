import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';

// ignore: camel_case_types
class home_products extends StatelessWidget {
  const home_products({
    super.key,
    required this.addproducts,
  });

  final Addproducts addproducts;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          addproducts.name,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        Text('₹${addproducts.price}',
            style: GoogleFonts.rubik(color: Colors.green, fontSize: 15))
      ],
    );
  }
}
