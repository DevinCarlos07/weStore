// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:we_store/Admin/addproduct.dart';
import 'package:we_store/database/functions/category/edit_delete.dart';

import 'package:we_store/database/functions/category/fuctions.dart';
import 'package:we_store/database/functions/category/models.dart';

class NewCategory extends StatefulWidget {
  const NewCategory({super.key});

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  @override
  void initState() {
    super.initState();

    getcategory();
  }

  CategoryAdd? addtocart;

  final _formKey = GlobalKey<FormState>();
  final _newcategoryController = TextEditingController();
  File? _newcategoryimage;
  bool change = false;
  int? catid;

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
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
                  height: 20,
                ),
                change
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            change = false;
                            edit_Category(catid, _newcategoryController.text,
                                _newcategoryimage!.path);
                            _newcategoryController.clear();
                            _newcategoryimage = null;
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        child: Text('Save'))
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            addnewButton();
                          });
                        },
                        child: Text('Add New')),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            ValueListenableBuilder(
                valueListenable: categoryaddlist,
                builder: (context, List<CategoryAdd> addlist, Widget? child) {
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: addlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          final addtocart = addlist.reversed.toList()[index];

                          return Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        FileImage(File(addtocart.catimage))),
                                title: Text(addtocart.catname),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            catid = addtocart.id;
                                            change = true;
                                            _newcategoryController.text =
                                                addtocart.catname;
                                            _newcategoryimage =
                                                File(addtocart.catimage);
                                          });
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            removecategory(
                                                context, addtocart.id);
                                          });
                                        },
                                        icon: Icon(Icons.delete)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                height: 5,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }),
                  );
                })
          ],
        ),
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
