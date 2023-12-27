// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:we_store/database/functions/address/address_fuction.dart';
import 'package:we_store/database/functions/address/address_models.dart';
import 'package:we_store/database/functions/address/edit_delete.dart';
import 'package:we_store/user/subpages/adressadd.dart';
import 'package:we_store/user/subpages/editaddress.dart';

class Useraddress extends StatefulWidget {
  const Useraddress({super.key});

  @override
  State<Useraddress> createState() => _UseraddressState();
}

class _UseraddressState extends State<Useraddress> {
  @override
  void initState() {
    super.initState();
    getaddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 12),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => AddAddressScreen()));
          },
          icon: Icon(Icons.add),
          label: Text("Add Address"),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Choose Address',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: 600,
          child: ValueListenableBuilder(
            valueListenable: addresslist,
            builder: (context, List<Addressmodel> address, Widget? child) {
              return ListView.separated(
                itemCount: address.length,
                itemBuilder: (BuildContext context, int index) {
                  final addressadd = address.reversed.toList()[index];
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 120,
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.location_city),
                            // Radio(
                            //   value: index,
                            //   groupValue: selectedAddressIndex,
                            //   onChanged: (int? value) {
                            //     // Handle Radio button change

                            //     _handleRadioValueChange(value, addressadd);
                            //   },
                            // ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  addressadd.name,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  addressadd.contact,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(addressadd.address),
                                Text(addressadd.city),
                                Text(addressadd.pincode)
                              ],
                            ),
                            SizedBox(
                              width: 95,
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) => EditAddress(
                                                  name: addressadd.name,
                                                  contact: addressadd.contact,
                                                  address: addressadd.address,
                                                  city: addressadd.city,
                                                  pincode: addressadd.pincode,
                                                  id: addressadd.id!)));
                                    },
                                    icon: Icon(Icons.edit)),
                                SizedBox(
                                  height: 15,
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        removeaddress(context, addressadd.id);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  // You can customize the appearance of the separator here
                  return Divider(
                    height: 1,
                    color: Colors.grey,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
