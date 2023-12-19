import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/database/functions/cart/addcart_btn.dart';
import 'package:we_store/database/functions/cart/cart_functions.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';
import 'package:we_store/user/subpages/payments.dart';
import 'package:we_store/user/subpages/widgets/buy/price_bottom.dart';

class BuyPage extends StatefulWidget {
  final dynamic address;
  final int total;
  const BuyPage({required this.address, required this.total, Key? key})
      : super(key: key);

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  // int total = 0;
  @override
  void initState() {
    super.initState();
    getcart();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //total = 0;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Confirm Order',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        //  mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 15, top: 10, bottom: 12),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Delivery Address',
                      style: GoogleFonts.rubik(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name     : ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${widget.address.name}',
                              style: GoogleFonts.rubik(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone    : ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.address.contact,
                              style: GoogleFonts.rubik(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address : ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.address.address,
                              style: GoogleFonts.rubik(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: addcartlist,
              builder: (context, List<AddCart> cartadd, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: cartadd.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cart = cartadd.reversed.toList()[index];
                        // int price = int.parse(cart.price);
                        // int quantity = cart.count;
                        // int totalPrice = price * quantity;

                        // total += totalPrice;

                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 7, right: 20, left: 20, top: 7),
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Adjust as needed
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Container(
                                      width: 92,
                                      height: 100,
                                      child: Image.file(
                                        File(cart.imagepath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      cart.name,
                                      style: GoogleFonts.rubik(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('₹${cart.price}',
                                        style: GoogleFonts.rubik(
                                            color: Colors.green, fontSize: 15)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            removecart(context, cart.id);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                    SizedBox(
                                      width: 1,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 20),
            child: Price_bottom(widget: widget),
          )
        ],
      ),
    );
  }
}
