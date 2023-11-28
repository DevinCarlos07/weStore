// ignore_for_file: sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_store/database/functions/addproduct/addproduct_fuctions.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  final _productnameController = TextEditingController();
  final _productpriceController = TextEditingController();
  final _productdetailsContoller = TextEditingController();
  late String _productCategory;
  File? _selectImage;

  List<String> categories = [
    'Iwatches',
    'Iphone',
    'Airpode',
    'Ipad',
    'MacBook',
    'Case',
    'Charger'
  ];
  @override
  void initState() {
    super.initState();
    _productCategory = categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Add Products'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              TextFormField(
                maxLength: 16,
                validator: validateProductName,
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
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: validateProductPrice,
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
                height: 30,
              ),
              DropdownButtonFormField<String>(
                value: _productCategory,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.category),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                    fillColor: Color(0xABFFFEFE),
                    labelText: 'Product Category',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.black, width: double.infinity))),
                items: categories.map((String category) {
                  return DropdownMenuItem<String>(
                      value: category, child: Text(category));
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _productCategory = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'select a category';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLength: 10,
                maxLines: 5,
                validator: validateProductDetails,
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
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: _selectImage != null
                        ? Image.file(
                            _selectImage!,
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.person,
                            size: 50,
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
                    children: [
                      IconButton(
                          onPressed: () {
                            _selectedImage();
                          },
                          icon: Icon(Icons.photo))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () {
                    addButton();
                  },
                  child: Text('Save Item'))
            ],
          ),
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
    final _category = _productCategory;
    if (_selectImage == null) {
      return;
    }
    if (_formKey.currentState!.validate() &&
        _name.isNotEmpty &&
        _price.isNotEmpty &&
        _details.isNotEmpty &&
        _category.isNotEmpty) {
      final _add = Addproducts(
          name: _name,
          price: _price,
          category: _category,
          details: _details,
          imagepath: _selectImage!.path);
      addproduct(_add);
      showSnackBar(context, 'Added Succesfully!');
      _productdetailsContoller.clear();
      _productpriceController.clear();
      _productnameController.clear();
    } else {
      showSnackBar(context, 'Product adding failed!');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }

  void _selectedImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectImage = File(image.path);
      });
    }
  }
}
