// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';

ValueNotifier<List<AddCart>> addcartlist = ValueNotifier([]);
Future<void> addtoCatlist(AddCart value) async {
  final addcartDB = await Hive.openBox<AddCart>('add_cart');
  final id = await addcartDB.add(value);
  final data = addcartDB.get(id);

  await addcartDB.put(
      id,
      AddCart(
          details: data!.details,
          imagepath: data.imagepath,
          name: data.name,
          price: data.price,
          count: data.count,
          id: id));
  getcart();
}

Future<void> getcart() async {
  final addcartDB = await Hive.openBox<AddCart>('add_cart');
  addcartlist.value.clear();
  addcartlist.value.addAll(addcartDB.values);

  addcartlist.notifyListeners();
}
