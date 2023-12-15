// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/common/bottomnav.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';
import 'package:we_store/database/functions/wishlist/fav_function.dart';
import 'package:we_store/database/functions/wishlist/fav_model.dart';

Future<void> addfav_button(
  Addproducts addproducts,
  BuildContext context,
) async {
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
        imagepath: addproducts.imagepath,
        id: -1);
    addtofav(fav);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added to Favourite'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));
  }
}

void removefav(BuildContext context, int? id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remove Fav'),
          content: Text('Do you want to remove'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  deletefav(context, id);
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

//delete wishlist

Future<void> deletefav(context, int? id) async {
  final remove = await Hive.openBox<AddFav>('add_fav');
  remove.delete(id);
  geterfav();

  Navigator.of(context)
      .pop(MaterialPageRoute(builder: (context) => MyBottam()));
}

Icon getIcon(Addproducts addproducts) {
  final addfavBox = Hive.box<AddFav>('add_fav');
  final favexists =
      addfavBox.values.any((user) => user.name == addproducts.name);

  if (favexists) {
    return Icon(
      Icons.favorite,
      color: Colors.red,
    );
  } else {
    return Icon(
      Icons.favorite_border,
      color: Colors.black,
    );
  }
}
