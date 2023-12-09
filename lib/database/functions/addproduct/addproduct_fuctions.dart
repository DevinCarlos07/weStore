import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';

ValueNotifier<List<Addproducts>> productlist = ValueNotifier([]);

Future<void> addproduct(Addproducts value) async {
  final productDB = await Hive.openBox<Addproducts>('add_product');
  final id = await productDB.add(value);
  final produtdata = productDB.get(id);
  await productDB.put(
      id,
      Addproducts(
          imagepath: produtdata!.imagepath,
          name: produtdata.name,
          price: produtdata.price,
          details: produtdata.details,
          category: produtdata.category,
          id: id));
  getproducts();
}

Future<void> getproducts() async {
  final productDB = await Hive.openBox<Addproducts>('add_product');
  productlist.value.clear();
  productlist.value.addAll(productDB.values);
  productlist.notifyListeners();
}
