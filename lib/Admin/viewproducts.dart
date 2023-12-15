// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:we_store/database/functions/addproduct/addproduct_fuctions.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';
import 'package:we_store/database/functions/cart/cart_functions.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _prizeCorntroller = TextEditingController();
  final _detailsController = TextEditingController();
  File? _selectedImage;

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
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
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
                                        removeProduct(context, productdata.id);
                                      });
                                    },
                                    icon: Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      _editSheet(
                                          context,
                                          productdata.id!,
                                          productdata.name,
                                          productdata.price,
                                          productdata.imagepath,
                                          productdata.details);
                                    },
                                    icon: Icon(Icons.edit)),
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

  void removeProduct(BuildContext context, int? id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Product'),
            content: Text('Do you want do delete this...?'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    delete_product(context, id);
                  },
                  child: Text('Yes')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No'))
            ],
          );
        });
  }

  // ignore: non_constant_identifier_names
  Future<void> delete_product(context, int? id) async {
    final remove = await Hive.openBox<Addproducts>('add_product');
    final delete = await Hive.openBox<AddCart>('add_cart');

    remove.delete(id);
    delete.delete(id);

    getproducts();
    getcart();
    Navigator.of(context)
        .pop(MaterialPageRoute(builder: (ctx) => ViewProduct()));
  }

  void _editSheet(BuildContext context, int id, String name, String price,
      String imagepath, String details) {
    _nameController.text = name;
    _prizeCorntroller.text = price;
    _selectedImage = File(imagepath);
    _detailsController.text = details;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        //_selectedImage=photo as File?;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //add photo

                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(
                                          255, 18, 18, 18)),
                                  //borderRadius: BorderRadius.circular(10)
                                ),
                                child: _selectedImage != null
                                    ? Image.file(
                                        _selectedImage!,
                                        fit: BoxFit.fill,
                                      )
                                    : Center(child: Icon(Icons.add_a_photo))),
                          ),
                          Column(children: [
                            IconButton(
                              onPressed: () {
                                _picker();
                              },
                              icon: Icon(Icons.photo_library_outlined),
                              tooltip: "select from gallery",
                            ),
                          ])
                        ]),
                        SizedBox(
                          height: 20,
                        ),

                        //full name
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Full Name",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //qualification
                        TextFormField(
                          controller: _prizeCorntroller,
                          //  validator: validateQualification,
                          decoration: InputDecoration(
                            hintText: "Price",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //date of birth

                        //date of join
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the details";
                            }
                            return null;
                          },
                          controller: _detailsController,
                          decoration: InputDecoration(
                              //label: Text("dob"),
                              hintText: "details"),
                          onTap: () {
                            //print("date picker");
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //selecet hospital

                        //submit button
                        ElevatedButton(
                            onPressed: () {
                              // submit();
                              editProduct(
                                  id,
                                  _nameController.text,
                                  _prizeCorntroller.text,
                                  _selectedImage!.path,
                                  _detailsController.text);
                              Navigator.pop(context);
                            },
                            child: Text("Update"))
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  void _picker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }
}
