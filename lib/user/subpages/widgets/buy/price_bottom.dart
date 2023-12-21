// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:we_store/user/subpages/buy.dart';
import 'package:we_store/user/subpages/payments.dart';

class Price_bottom extends StatelessWidget {
  const Price_bottom(
      {super.key,
      required this.widget,
      required this.address,
      required this.cart});
  final BuyPage address;
  final BuyPage widget;
  final BuyPage cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            width: 280,
            height: 25,
            decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline_rounded),
                SizedBox(
                  width: 10,
                ),
                Text('Only Accepted in Cash on Delivery')
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(),
              //color: Color.fromARGB(255, 221, 177, 56),
              borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total Price : ${widget.total}'),
              SizedBox(
                width: 75,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Place Order')),
              SizedBox(
                width: 1,
              )
            ],
          ),
        ),
      ],
    );
  }
}
