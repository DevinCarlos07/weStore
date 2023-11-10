// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Add Products'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  prefixIcon: Icon(Icons.abc),
                  label: Text(
                    'Add Product Name',
                    style: GoogleFonts.inter(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  prefixIcon: Icon(Icons.attach_money),
                  label: Text(
                    'Add Product Prize',
                    style: GoogleFonts.inter(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  prefixIcon: Icon(Icons.edit),
                  label: Text(
                    'Add Product Details',
                    style: GoogleFonts.inter(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Add Image',
                      style: GoogleFonts.inter(color: Colors.black),
                    ),
                  ),
                  height: 160,
                  width: 160,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: const [
                    Icon(Icons.photo_camera_outlined),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(Icons.photo)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Save Item'))
          ],
        ),
      ),
    );
  }
}
