// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:we_store/database/functions/cart/addcart_btn.dart';
import 'package:we_store/database/functions/wishlist/addwishlist.dart';
import 'package:we_store/database/functions/wishlist/fav_function.dart';
import 'package:we_store/database/functions/wishlist/fav_model.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late Box<AddFav> search = Hive.box<AddFav>('add_fav');
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    geterfav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Favourite',
          style: GoogleFonts.poppins(
              fontSize: 22,
              decoration: TextDecoration.underline,
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Form(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchfav(value);
                  });
                },
                controller: _searchController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 2),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: 'Search'),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ValueListenableBuilder(
              valueListenable: addfavlist,
              builder: (context, List<AddFav> addfavlist, Widget? child) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: addfavlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 290,
                    ),
                    itemBuilder: (context, index) {
                      final addfav = addfavlist.reversed.toList()[index];

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
                                    child: Image.file(
                                      File(addfav.imagepath),
                                      fit: BoxFit.cover,
                                      height: 163,
                                      width: double.infinity,
                                    )),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            addfav.name,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(addfav.price,
                                              style: GoogleFonts.rubik(
                                                  color: Colors.green,
                                                  fontSize: 15))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(addfav.details,
                                          style:
                                              GoogleFonts.rubik(fontSize: 15)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                removefav(context, addfav.id);
                                              });
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(
                                                Icons.shopping_cart_outlined),
                                            onPressed: () {
                                              checkCart(addfav, context);
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
                    },
                  ),
                );
              })
        ],
      ),
    );
  }

  //search fav
  void searchfav(String value) {
    final fav = search.values.toList();
    final filterdfav = fav
        .where((products) =>
            products.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    addfavlist.value = filterdfav;
  }
}
