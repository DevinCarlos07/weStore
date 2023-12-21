import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'package:we_store/database/functions/address/address_fuction.dart';
import 'package:we_store/database/functions/address/address_models.dart';
import 'package:we_store/database/functions/address/edit_delete.dart';
import 'package:we_store/user/subpages/adressadd.dart';
import 'package:we_store/user/subpages/buy.dart';
import 'package:we_store/user/subpages/editaddress.dart';

class ViewAddress extends StatefulWidget {
  final int total;
  const ViewAddress({required this.total, Key? key}) : super(key: key);

  @override
  State<ViewAddress> createState() => _ViewAddressState();
}

class _ViewAddressState extends State<ViewAddress> {
  //late SharedPreferences _prefs; // Declare SharedPreferences instance
  int? selectedAddressIndex;

  @override
  void initState() {
    super.initState();
    getaddress();

    // Initialize SharedPreferences
    // SharedPreferences.getInstance().then((prefs) {
    //   setState(() {
    //     // _prefs = prefs;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 19),
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
                      InkWell(
                        onTap: () {
                          // Handle address tap
                          _handleRadioValueChange(index, addressadd);
                        },
                        child: Container(
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
                              Radio(
                                value: index,
                                groupValue: selectedAddressIndex,
                                onChanged: (int? value) {
                                  // Handle Radio button change

                                  _handleRadioValueChange(value, addressadd);
                                },
                              ),
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
                                  Text(addressadd.pincode)
                                ],
                              ),
                              SizedBox(
                                width: 90,
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

  // Update the Radio onChanged callback
  void _handleRadioValueChange(int? value, Addressmodel selectedAddress) {
    setState(() {
      selectedAddressIndex = value;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (buy) => BuyPage(
                    address: selectedAddress,
                    total: widget.total,
                  )));
    });
  }
}
