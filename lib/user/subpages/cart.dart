// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/database/functions/cart/addcart_btn.dart';

import 'package:we_store/database/functions/cart/cart_functions.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    getcart();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text(
            "Cart",
            style: GoogleFonts.rubik(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 400,
                child: ValueListenableBuilder(
                    valueListenable: addcartlist,
                    builder:
                        (context, List<AddCart> addcartlist, Widget? child) {
                      return ListView.builder(
                          itemCount: addcartlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            final cart = addcartlist.reversed.toList()[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Slidable(
                                startActionPane: ActionPane(
                                    motion: StretchMotion(),
                                    children: [
                                      SlidableAction(
                                        label: 'Remove',
                                        onPressed: (context) {
                                          setState(() {
                                            // delete_cart(cart.id);
                                            removecart(context, cart.id);
                                          });
                                        },
                                        icon: Icons.delete,
                                        autoClose: true,
                                        backgroundColor: Colors.red,
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                    ]),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Container(
                                          width: 90,
                                          height: 108,
                                          child: Image.file(
                                            File(cart.imagepath),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            cart.name,
                                            style: GoogleFonts.rubik(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(cart.price),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(cart.details)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Container(
                                          height: 114,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 198, 202, 205),
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _addButton();
                                                  });
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.add,
                                                ),
                                                iconSize: 20,
                                              ),
                                              Text('$currentValue'),
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _subtractButton();
                                                  });
                                                },
                                                icon:
                                                    Icon(CupertinoIcons.minus),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  width: double.infinity,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            );
                          });
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: ValueListenableBuilder(
                    valueListenable: addcartlist,
                    builder:
                        (context, List<AddCart> addcartlist, Widget? child) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Items",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'sdfjg',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub-Total",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "₹100",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "₹50",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "₹150",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: Colors.redAccent.shade700,
                    ),
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  //add button
  int currentValue = 0;

  void _addButton() {
    if (currentValue < 9) {
      currentValue++;
    }
  }

  void _subtractButton() {
    if (currentValue > 1) {
      currentValue--;
    }
  }
}
