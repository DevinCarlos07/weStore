// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_import, prefer_const_constructors_in_immutables, annotate_overrides, sized_box_for_whitespace, duplicate_ignore, unnecessary_brace_in_string_interps
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/cart/addcart_btn.dart';

import 'package:we_store/database/functions/cart/cart_functions.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';
import 'package:we_store/user/subpages/viewaddress.dart';

import 'package:we_store/user/subpages/widgets/cart_widgets/custom_image.dart';
import 'package:we_store/user/subpages/widgets/cart_widgets/custom_product.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Box<AddCart> cartBox = Hive.box<AddCart>('add_cart');
  int total = 0;

  @override
  void initState() {
    super.initState();
    getcart();
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    total = 0;

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
        body: cartBox.isEmpty
            ? Center(
                child: Image.asset(
                'assets/images/ezgif.com-crop (1).gif',
                width: double.infinity,
              ))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 400,
                      child: ValueListenableBuilder(
                          valueListenable: addcartlist,
                          builder: (context, List<AddCart> addcartlist,
                              Widget? child) {
                            return ListView.builder(
                                itemCount: addcartlist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final cart =
                                      addcartlist.reversed.toList()[index];

                                  int price = int.parse(cart.price);
                                  int quantity = cart.count;
                                  int totalPrice = price * quantity;

                                  total += totalPrice;

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 10,
                                        left: 10),
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
                                              // borderRadius: BorderRadius.circular(20),
                                            )
                                          ]),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: cart_image(cart: cart),
                                            ),
                                            custom_productdetails(cart: cart),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Container(
                                                height: 124,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 67, 130, 178),
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          //add(cart.count);
                                                          // cart.count++;
                                                          if (cart.count < 9) {
                                                            cart.count++;
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                  'Max Limit'),
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          2),
                                                              backgroundColor:
                                                                  Colors.red,
                                                            ));
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons.add,
                                                      ),
                                                      iconSize: 20,
                                                    ),
                                                    Text('${cart.count}'),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (cart.count > 1) {
                                                            cart.count--;
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(
                                                          CupertinoIcons.minus),
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
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: ValueListenableBuilder<Box<AddCart>>(
                          valueListenable: cartBox.listenable(),
                          builder: (context, cartBox, _) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub-Total",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        total.toString(),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Delivery",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "Free",
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "${total}", // Assuming total is the correct variable
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 14, bottom: 10),
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    height: 50,
                                    width: 400,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (cartBox.isNotEmpty) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (ctx) => ViewAddress(
                                                        total: total,
                                                      )));
                                        } else {
                                          Navigator.pop(context);
                                          showDailogealert(context);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        // ignore: deprecated_member_use
                                        primary: Colors.redAccent.shade700,
                                      ),
                                      child: Text(
                                        'Continue',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ));
  }

  void showDailogealert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Cart was Empty',
          ),
          content: Text('You need to add a Product '),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }
}
