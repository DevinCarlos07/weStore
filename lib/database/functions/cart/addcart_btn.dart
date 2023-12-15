// ignore_for_file: use_build_context_synchronously, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:we_store/database/functions/addproduct/addproduct_models.dart';
import 'package:we_store/database/functions/cart/cart_functions.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';
import 'package:we_store/user/subpages/cart.dart';

void checkCart(Addproducts addproducts, BuildContext context) async {
  await Hive.openBox<AddCart>('add_cart');

  final cartBox = Hive.box<AddCart>('add_cart');

  final carExists = cartBox.values.any((user) => user.name == addproducts.name);
  if (carExists) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Product Alredy Exist!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  } else {
    final cart = AddCart(
        name: addproducts.name,
        price: addproducts.price,
        details: addproducts.details,
        imagepath: addproducts.imagepath,
        count: 1,
        id: -1);
    addtoCatlist(cart);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Add In Cart Succesfully'),
      backgroundColor: Colors.green,
    ));
  }
}
//delete_cart_button

void removecart(BuildContext context, int? id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remove cart'),
          content: Text('Do you want to remove'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  delete_cart(context, id);
                },
                child: Text('Yes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        );
      });
}

// ignore: non_constant_identifier_names
Future<void> delete_cart(context, int? id) async {
  final remove = await Hive.openBox<AddCart>('add_cart');
  remove.delete(id);
  getcart();
  Navigator.of(context).pop(
    MaterialPageRoute(builder: (context) => CartScreen()),
  );
}

//count functions


