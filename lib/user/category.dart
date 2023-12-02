import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:we_store/database/functions/addproduct/addproduct_fuctions.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';
import 'package:we_store/database/functions/cart/addcart_btn.dart';
import 'package:we_store/database/functions/wishlist/addwishlist.dart';

class CategoryScreen extends StatefulWidget {
  final String categorys;
  const CategoryScreen({required this.categorys, Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categorys),
        centerTitle: true,
        //backgroundColor: Colors.white,
      ),
      body: ValueListenableBuilder(
        valueListenable: productlist,
        builder: (BuildContext context, List<Addproducts> productlist,
            Widget? child) {
          final filterdlist = productlist
              .where((product) => product.category == widget.categorys)
              .toList();
          if (filterdlist.isEmpty) {
            return Center(
              child: Text('No Product'),
            );
          } else {
            return GridView.builder(
                itemCount: filterdlist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  mainAxisExtent: 290,
                ),
                itemBuilder: (context, index) {
                  final categoryadd = filterdlist[index];
                  // final imag = categoryadd.imagepath;
                  return GestureDetector(
                    onTap: () {},
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
                                child: Image.file(File(categoryadd.imagepath),
                                    height: 160,
                                    width: double.infinity,
                                    fit: BoxFit.cover)),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        categoryadd.name,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text('₹${categoryadd.price}',
                                          style: GoogleFonts.rubik(
                                              color: Colors.green,
                                              fontSize: 15))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(categoryadd.details,
                                      style: GoogleFonts.rubik(fontSize: 15)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          addfav_button(categoryadd, context);
                                        },
                                      ),
                                      IconButton(
                                        icon:
                                            Icon(Icons.shopping_cart_outlined),
                                        onPressed: () {
                                          checkCart(categoryadd, context);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
