import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:we_store/database/functions/category/models.dart';

ValueNotifier<List<CategoryAdd>> categoryaddlist = ValueNotifier([]);

Future<void> addcategory(CategoryAdd value) async {
  final categDB = await Hive.openBox<CategoryAdd>('add_cat');
  final id = await categDB.add(value);
  final catdata = categDB.get(id);
  await categDB.put(
      id,
      CategoryAdd(
          catname: catdata!.catname, catimage: catdata.catimage, id: id));
  getcategory();
}

Future<void> getcategory() async {
  final catDB = await Hive.openBox<CategoryAdd>('add_cat');
  categoryaddlist.value.clear();
  categoryaddlist.value.addAll(catDB.values);
  categoryaddlist.notifyListeners();
}
