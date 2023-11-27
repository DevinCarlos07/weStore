import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';

ValueNotifier<List<AddCart>> addcartlist = ValueNotifier([]);
Future<void> addtoCatlist(AddCart value) async {
  final addcartDB = await Hive.openBox<AddCart>('add_cart');
  final _addcart = await addcartDB.add(value);

  value.id = _addcart;
  addcartlist.value.add(value);
  addcartlist.notifyListeners();
}

Future<void> getcart() async {
  final addcartDB = await Hive.openBox<AddCart>('add_cart');
  addcartlist.value.clear();
  addcartlist.value.addAll(addcartDB.values);
  addcartlist.notifyListeners();
}
