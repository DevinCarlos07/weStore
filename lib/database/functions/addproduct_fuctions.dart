import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/models/addproduct_models.dart';

ValueNotifier<List<Addproducts>> productlist = ValueNotifier([]);

Future<void> addproduct(Addproducts value) async {
  final productDB = await Hive.openBox<Addproducts>('add_product');
  final _addproduct = await productDB.add(value);
  value.id = _addproduct;
  productlist.value.add(value);
  productlist.notifyListeners();
}
