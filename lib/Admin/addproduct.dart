// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/database/functions/addproduct_fuctions.dart';
import 'package:we_store/database/models/addproduct_models.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _productnameController = TextEditingController();
  final _productpriceController = TextEditingController();
  final _productdetailsContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Add Products'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _productnameController,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  prefixIcon: Icon(Icons.abc),
                  label: Text(
                    'Add Product Name',
                    style: GoogleFonts.inter(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _productpriceController,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  prefixIcon: Icon(Icons.attach_money),
                  label: Text(
                    'Add Product Prize',
                    style: GoogleFonts.inter(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _productdetailsContoller,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  prefixIcon: Icon(Icons.edit),
                  label: Text(
                    'Add Product Details',
                    style: GoogleFonts.inter(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Add Image',
                      style: GoogleFonts.inter(color: Colors.black),
                    ),
                  ),
                  height: 160,
                  width: 160,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: const [
                    Icon(Icons.photo_camera_outlined),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(Icons.photo)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Save Item'))
          ],
        ),
      ),
    );
  }

  //to validate Product_name
  String? validateProductName(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'enter product name';
    }
    return null;
  }

  //to validate product_price

  String? validateProductPrice(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'enter the price';
    }
    final RegExp priceRegExp = RegExp(r'^[0-9 ]+$');

    if (!priceRegExp.hasMatch(trimmedvalue)) {
      return 'enter the price';
    }
    return null;
  }

  //to validate product_details

  String? validateProductDetails(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'enter the details';
    }
    return null;
  }

  //button

  Future<void> addButton() async {
    final _name = _productnameController.text.trim();
    final _price = _productpriceController.text.trim();
    final _details = _productdetailsContoller.text.trim();

    if (_formKey.currentState!.validate()) {
      final _add = Addproducts(name: _name, price: _price, details: _details);
      addproduct(_add);
    } else {
      showSnackBar(context, 'New Product Failed!');
      _productdetailsContoller.clear();
      _productpriceController.clear();
      _productnameController.clear();
    }
  }
}
