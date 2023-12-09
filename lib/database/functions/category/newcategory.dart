import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_store/Admin/addproduct.dart';
import 'package:we_store/database/functions/category/fuctions.dart';
import 'package:we_store/database/functions/category/models.dart';

class NewCategory extends StatefulWidget {
  const NewCategory({super.key});

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  final _formKey = GlobalKey<FormState>();
  final _newcategoryController = TextEditingController();
  File? _newcategoryimage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (ctx) => AddProduct()));
              });
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('New Category'),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 90,
                backgroundImage: _newcategoryimage != null
                    ? FileImage(_newcategoryimage!)
                    : null,
                child: _newcategoryimage == null
                    ? Icon(
                        Icons.image,
                        size: 50,
                      )
                    : null,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedcatImage();
                    });
                  },
                  icon: Icon(
                    Icons.image,
                    size: 33,
                  ))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: validatenewcategoryName,
                controller: _newcategoryController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 2),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: 'New Category'),
              ),
            ),
          ),
          SizedBox(
            height: 26,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  addnewButton();
                });
              },
              child: Text('Add New'))
        ],
      ),
    );
  }

  //to validate newcategory name
  String? validatenewcategoryName(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'Enter the Name';
    }
    return null;
  }

  //image picking
  void _selectedcatImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _newcategoryimage = File(image.path);
      });
    }
  }

  //addnew button
  Future<void> addnewButton() async {
    final _newname = _newcategoryController.text.trim();
    if (_newcategoryimage == null) {
      return;
    }
    if (_formKey.currentState!.validate() &&
        _newname.isNotEmpty &&
        _newcategoryimage != null) {
      final _addcat = CategoryAdd(
          catname: _newname, catimage: _newcategoryimage!.path, id: -1);
      addcategory(_addcat);
      showSnackBar(context, 'Create Succesfully');
      _newcategoryController.clear();
      setState(() {
        _newcategoryimage = null;
      });
    } else {
      showSnackBar2(context, 'Creating faild');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      backgroundColor: Color.fromARGB(255, 79, 54, 244),
    ));
  }

  void showSnackBar2(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      backgroundColor: Color.fromARGB(255, 244, 54, 54),
    ));
  }
}
