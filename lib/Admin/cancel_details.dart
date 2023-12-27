// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/database/functions/order_cancel/cancel_functions.dart';
import 'package:we_store/database/functions/order_cancel/cancel_model.dart';
import 'package:we_store/user/order_details.dart';

class CancelAdmin extends StatefulWidget {
  const CancelAdmin({super.key});

  @override
  State<CancelAdmin> createState() => _CancelAdminState();
}

class _CancelAdminState extends State<CancelAdmin> {
  @override
  void initState() {
    super.initState();
    getcancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cancel Details',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 17,
          ),
          ValueListenableBuilder(
              valueListenable: cancelorderlist,
              builder: (context, List<Cancelorder> cancel, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: cancel.length,
                    itemBuilder: (BuildContext context, int index) {
                      final cancelitem = cancel.reversed.toList()[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        margin: EdgeInsets.all(10.0),

                        /// height: 120,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.file(File(
                                    cancelitem.image,
                                  )),
                                  height: 80,
                                  width: 120,
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      cancelitem.name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      cancelitem.details,
                                      style: GoogleFonts.rubik(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // SizedBox(
                                    //   height: 15,
                                    // ),
                                    // Text(
                                    //   qty[index],
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  width: 42,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'OrderCanceld',
                                      style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      '₹${cancelitem.price}',
                                      style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => DetailsOrder(
                                                name: cancelitem.name,
                                                price: cancelitem.price,
                                                details: cancelitem.details,
                                                total:
                                                    int.parse(cancelitem.price),
                                                addressname:
                                                    cancelitem.deliveryName,
                                                address:
                                                    cancelitem.deliveryAddress,
                                                contact:
                                                    cancelitem.deliveryPhone,
                                                count: int.parse(
                                                    cancelitem.productCount),
                                                city: cancelitem.deliveryCity,
                                                pincode: cancelitem.pincode,
                                                image: cancelitem.image,
                                              )));
                                },
                                child: Text('details')),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
