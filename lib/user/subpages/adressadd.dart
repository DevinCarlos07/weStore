// ignore: file_names

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/database/functions/address/address_fuction.dart';
import 'package:we_store/database/functions/address/address_models.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addresssController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Add Address",
          style: GoogleFonts.rubik(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Name",
                    hintText: "Enter Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nameController.text = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Contact",
                    hintText: "Enter Phone Number",
                  ),
                  validator: (value) {
                    if (!isPhone(value!)) {
                      return 'Please enter valid number';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _phoneController.text = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _addresssController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Address",
                    hintText: "Enter the Address Include Pin",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _addresssController.text = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _cityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "City",
                    hintText: "Enter the City",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter City Name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cityController.text = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _addAddress(context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.redAccent.shade700,
                      ),
                      child: Text(
                        'Save Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // ValueListenableBuilder(
                //     valueListenable: addresslist,
                //     builder:
                //         (context, List<Addressmodel> address, Widget? child) {
                //       return ListView.builder(
                //           itemCount: address.length,
                //           itemBuilder: (BuildContext context, int index) {
                //             final newaddress =
                //                 address.reversed.toList()[index];
                //             return Container(
                //               decoration: BoxDecoration(
                //                 border: Border.all(),
                //                 borderRadius: BorderRadius.circular(20),
                //               ),
                //               height: 120,
                //               width: double.infinity,
                //               child: Row(
                //                 children: [
                //                   SizedBox(
                //                     width: 20,
                //                   ),
                //                   // Radio(
                //                   //   value: index,
                //                   //   groupValue: selectedAddressIndex,
                //                   //   onChanged: (int? value) {
                //                   //     setState(() {
                //                   //       selectedAddressIndex = value;
                //                   //       ink = selectedAddressIndex;
                //                   //     });
                //                   //   },
                //                   // ),
                //                   SizedBox(
                //                     width: 20,
                //                   ),
                //                   Column(
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       SizedBox(
                //                         height: 10,
                //                       ),
                //                       Text(
                //                         newaddress.name,
                //                         style: TextStyle(fontSize: 20),
                //                       ),
                //                       Text(
                //                         newaddress.contact,
                //                         style: TextStyle(fontSize: 18),
                //                       ),
                //                       Text(newaddress.address),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //             );
                //           });
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addAddress(BuildContext context) async {
    final username = _nameController.text;
    final number = _phoneController.text;
    final address = _addresssController.text;
    final city = _cityController.text;

    if (username.isNotEmpty &&
        number.isNotEmpty &&
        address.isNotEmpty &&
        city.isNotEmpty) {
      final _addAddress = Addressmodel(
          name: username, contact: number, address: address, city: city);
      addtoaddress(_addAddress);
      _nameController.text = '';
      _phoneController.text = '';
      _addresssController.text = '';
      _cityController.text = '';

      showDailogealert(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fill all Datas'),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 2),
      ));
    }
  }

  void showDailogealert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Added address',
          ),
          content: Text('Address add succesfull'),
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
