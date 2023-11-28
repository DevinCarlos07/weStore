import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:we_store/database/functions/addproduct/addproduct_models.dart';
import 'package:we_store/database/functions/cart/cart_functions.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';

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
    );
    addtoCatlist(cart);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Add In Cart Succesfully'),
      backgroundColor: Colors.green,
    ));
  }
}
//delete_cart_button

Future<void> delete_cart(int? id) async {
  final remove = await Hive.openBox<AddCart>('add_cart');
  remove.delete(id);
  getcart();
}
