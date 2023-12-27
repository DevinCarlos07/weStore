// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:we_store/database/functions/order_cancel/cancel_model.dart';

ValueNotifier<List<Cancelorder>> cancelorderlist = ValueNotifier([]);

Future<void> cancelthisorder(Cancelorder values) async {
  final cancelDB = await Hive.openBox<Cancelorder>('cancel');
  final id = await cancelDB.add(values);
  final data = cancelDB.get(id);
  await cancelDB.put(
      id,
      Cancelorder(
          name: data!.name,
          price: data.price,
          details: data.details,
          image: data.image,
          deliveryAddress: data.deliveryAddress,
          deliveryCity: data.deliveryCity,
          deliveryName: data.deliveryName,
          deliveryPhone: data.deliveryPhone,
          pincode: data.pincode,
          productCount: data.productCount,
          id: id));
  getcancel();
}

Future<void> getcancel() async {
  final cancelDB = await Hive.openBox<Cancelorder>('cancel');
  cancelorderlist.value.clear();
  cancelorderlist.value.addAll(cancelDB.values);
  cancelorderlist.notifyListeners();
}
