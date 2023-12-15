import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_store/database/functions/address/address_fuction.dart';
import 'package:we_store/database/functions/address/address_models.dart';
import 'package:we_store/user/subpages/adressadd.dart';

class ViewAddress extends StatefulWidget {
  const ViewAddress({super.key});

  @override
  State<ViewAddress> createState() => _ViewAddressState();
}

class _ViewAddressState extends State<ViewAddress> {
  void initState() {
    super.initState();
    getaddress();
  }

  int? selectedAddressIndex; // To keep track of the selected address

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (cts) => AddAddressScreen()),
              );
            },
            icon: Icon(Icons.add),
          )
        ],
        title: Text('Current Address'),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                            Radio(
                              value: index,
                              groupValue: selectedAddressIndex,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedAddressIndex = value;
                                });
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
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
