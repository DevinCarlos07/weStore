// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Added Products'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Search',
                      style: GoogleFonts.inter(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Row(
              children: [
                Image(
                  image: NetworkImage(
                    'https://imageio.forbes.com/specials-images/imageserve/632c5a9fa04361ee3044b11e/0x0.jpg?format=jpg&height=900&width=1600&fit=bounds',
                  ),
                  width: 190,
                  height: 130,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'AirPodes pro',
                      style: GoogleFonts.rubik(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('₹ 24,000'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'describtion',
                      style: GoogleFonts.poppins(color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(Icons.remove_red_eye_outlined),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(Icons.edit)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Image(
                  image: NetworkImage(
                    'https://www.aptronixindia.com/media/catalog/product/cache/31f0162e6f7d821d2237f39577122a8a/1/1/11-inch128gbipadprowi-ficelluar-spacegrey_1.png',
                  ),
                  width: 190,
                  height: 130,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'iPad Pro',
                      style: GoogleFonts.rubik(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('₹ 74,000'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'describtion',
                      style: GoogleFonts.poppins(color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(Icons.remove_red_eye_outlined),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(Icons.edit)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
