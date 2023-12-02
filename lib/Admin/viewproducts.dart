// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/Admin/addproduct.dart';
import 'package:we_store/database/functions/addproduct/addproduct_fuctions.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  void initState() {
    super.initState();
    getproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Added Products'),
      ),
      body: Column(
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
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: productlist,
              builder: (context, List<Addproducts> pdlists, Widget? child) {
                return ListView.builder(
                  itemCount: pdlists.length,
                  itemBuilder: (BuildContext context, int index) {
                    final productdata = pdlists[index];

                    return Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          children: [
                            Image.file(
                              File(productdata.imagepath),
                              width: 190,
                              height: 130,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  productdata.name,
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('₹ ${productdata.price}'),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  productdata.details,
                                  style:
                                      GoogleFonts.poppins(color: Colors.blue),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        delete_product(productdata.id);
                                      });
                                    },
                                    icon: Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove_red_eye)),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> delete_product(int? id) async {
  final remove = await Hive.openBox<Addproducts>('add_product');
  remove.delete(id);
  getproducts();
}
