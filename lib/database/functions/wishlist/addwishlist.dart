import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';
import 'package:we_store/database/functions/wishlist/fav_function.dart';
import 'package:we_store/database/functions/wishlist/fav_model.dart';

void addfav_button(Addproducts addproducts, BuildContext context) async {
  await Hive.openBox<AddFav>('add_fav');
  final addfavBox = Hive.box<AddFav>('add_fav');

  final favexists =
      addfavBox.values.any((user) => user.name == addproducts.name);
  if (favexists) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Product Alredy Exist!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  } else {
    final fav = AddFav(
        name: addproducts.name,
        price: addproducts.price,
        details: addproducts.details,
        imagepath: addproducts.imagepath);
    addtofav(fav);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added to Favourite'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));
  }
}

//delete wishlist

void deletefav(int id) async {
  final remove = await Hive.openBox<AddFav>('add_fav');
  remove.delete(id);
  geterfav();
}
