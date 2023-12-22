// ignore: file_names

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:we_store/database/functions/address/address_fuction.dart';
import 'package:we_store/database/functions/address/address_models.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late Box<Addressmodel> addressBox = Hive.box<Addressmodel>('address');
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addresssController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
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
                TextFormField(
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _pincodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    )),
                    labelText: "Pincode",
                    hintText: "Enter the City Pincode",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter City Pincode';
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
                          print('lkjh');
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
    final pincode = _pincodeController.text;
    print('55');
    if (addressBox.length < 4) {
      if (username.isNotEmpty &&
          number.isNotEmpty &&
          address.isNotEmpty &&
          city.isNotEmpty &&
          pincode.isNotEmpty) {
        final _addAddress = Addressmodel(
            name: username,
            contact: number,
            address: address,
            city: city,
            pincode: pincode);
        addtoaddress(_addAddress);
        Navigator.pop(context);

        showDailogealert(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please fill all Datas'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 2),
        ));
      }
    } else {
      Navigator.pop(context);
      showDailoglimit(context);
      print('work');
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

  void showDailoglimit(BuildContext context) {
    //print('ithim');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Address Limit',
          ),
          content: Text('You can add only few address!!'),
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
    print('hhhhhh');
  }
}
