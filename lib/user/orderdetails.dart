import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/database/functions/order_cancel/cancel_button.dart';
import 'package:we_store/database/functions/place_order/functions.dart';
import 'package:we_store/database/functions/place_order/models.dart';
import 'package:we_store/database/functions/place_order/order_cancel.dart';
import 'package:we_store/user/order_details.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    super.initState();
    getorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 17,
          ),
          ValueListenableBuilder(
              valueListenable: orderlist,
              builder: (context, List<Oredrplace> order, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: order.length,
                    itemBuilder: (BuildContext context, int index) {
                      final orderdetail = order.reversed.toList()[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        margin: EdgeInsets.all(10.0),
                        height: 160,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start, //lastupdate
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 75,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.file(
                                        File(orderdetail.productImage))),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orderdetail.productName,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      orderdetail.productDetails,
                                      style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Qty : ${orderdetail.productCount.toString()}',
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 44,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'OrderPlaced',
                                      style: GoogleFonts.rubik(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      '₹${orderdetail.totalPrice.toString()}',
                                      style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) => DetailsOrder(
                                                    name:
                                                        orderdetail.productName,
                                                    price: orderdetail
                                                        .productPrice,
                                                    details: orderdetail
                                                        .productDetails,
                                                    total:
                                                        orderdetail.totalPrice,
                                                    addressname: orderdetail
                                                        .deliveryName,
                                                    address: orderdetail
                                                        .deliveryAddress,
                                                    contact: orderdetail
                                                        .deliveryPhone,
                                                    count: orderdetail
                                                        .productCount,
                                                    city: orderdetail
                                                        .deliveryCity,
                                                    pincode:
                                                        orderdetail.pincode,
                                                    image: orderdetail
                                                        .productImage,
                                                  )));
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 147, 141, 141))),
                                    child: Text('Details')),
                                SizedBox(
                                  width: 40,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cancelbtn(orderdetail, context);
                                    cancel(context, orderdetail.id);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromARGB(
                                                  255, 191, 0, 255))),
                                  child: Text('Cancel'),
                                ),
                              ],
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
