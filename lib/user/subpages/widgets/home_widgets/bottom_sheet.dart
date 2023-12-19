import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<dynamic> bottom_sheet(BuildContext context, String imagepath,
    String name, String details, String price) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 214, 204, 204)),
          height: 320,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Text(
                  'Buy This',
                  style: GoogleFonts.rubik(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(File(imagepath)),
                              fit: BoxFit.cover),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.rubik(
                            fontSize: 21, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        details,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        '₹$price',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              )
            ],
          ),
        );
      });
}