import 'package:flutter/material.dart';
import 'package:we_store/user/subpages/buy.dart';
import 'package:we_store/user/subpages/payments.dart';

class Price_bottom extends StatelessWidget {
  const Price_bottom({
    super.key,
    required this.widget,
  });

  final BuyPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 221, 177, 56),
          borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Total Price : ${widget.total}'),
          SizedBox(
            width: 75,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => PaymentScreen()));
              },
              child: Text('Payment')),
          SizedBox(
            width: 1,
          )
        ],
      ),
    );
  }
}
