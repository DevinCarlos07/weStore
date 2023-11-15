import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Favourite',
          style: GoogleFonts.poppins(
              fontSize: 22,
              decoration: TextDecoration.underline,
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 2),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: 'Search'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
