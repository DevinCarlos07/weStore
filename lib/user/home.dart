// ignore_for_file: unnecessary_import

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:we_store/database/functions/addproduct/addproduct_fuctions.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';
import 'package:we_store/database/functions/cart/addcart_btn.dart';
import 'package:we_store/database/functions/category/fuctions.dart';
import 'package:we_store/database/functions/wishlist/addwishlist.dart';
import 'package:we_store/database/functions/wishlist/fav_function.dart';
import 'package:we_store/user/subpages/cart.dart';
import 'package:we_store/user/subpages/widgets/home_widgets/bottom_sheet.dart';
import 'package:we_store/user/subpages/widgets/home_widgets/category_widget.dart';
import 'package:we_store/user/subpages/widgets/home_widgets/gridview_row.dart';
import 'package:we_store/user/subpages/widgets/home_widgets/home_appbar.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  void initState() {
    super.initState();
    getproducts();
    getcategory();
    geterfav();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            leading: Padding(
              padding: EdgeInsets.only(left: 7),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/star.jpg'),
              ),
            ),
            title: home_appbar_text(),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ))
            ],
            elevation: 0,
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categorys',
                    style: GoogleFonts.rubik(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: category_widget(),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'New Arrivals',
                      style: GoogleFonts.rubik(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ValueListenableBuilder(
                valueListenable: productlist,
                builder: (context, List<Addproducts> addlist, Widget? child) {
                  return Expanded(
                      child: GridView.builder(
                    itemCount: addlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 290,
                    ),
                    itemBuilder: (context, index) {
                      final addproducts = addlist.reversed.toList()[index];
                      return GestureDetector(
                          onTap: () {
                            _bootmsheet(
                                context,
                                addproducts.name,
                                addproducts.imagepath,
                                addproducts.price,
                                addproducts.details);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Color.fromARGB(255, 234, 228, 228),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                      child: Image.file(
                                        File(
                                          addproducts.imagepath,
                                        ),
                                        height: 160,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          home_products(
                                              addproducts: addproducts),
                                          const SizedBox(
                                            height: 4.0,
                                          ),
                                          Text(addproducts.details,
                                              style: GoogleFonts.rubik(
                                                  fontSize: 15)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: getIcon(addproducts),
                                                onPressed: () {
                                                  setState(() {
                                                    addfav_button(
                                                      addproducts,
                                                      context,
                                                    );
                                                  });
                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons
                                                    .shopping_cart_outlined),
                                                onPressed: () {
                                                  checkCart(
                                                      addproducts, context);
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ));
                    },
                  ));
                })
          ]),
        ));
  }

  //bottomsheet
  void _bootmsheet(BuildContext context, String name, String imagepath,
      String price, String details) {
    bottom_sheet(context, imagepath, name, details, price);
  }
}
