// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/address/address_models.dart';

ValueNotifier<List<Addressmodel>> addresslist = ValueNotifier([]);
Future<void> addtoaddress(Addressmodel value) async {
  final addressDB = await Hive.openBox<Addressmodel>('address');
  final id = await addressDB.add(value);
  final data = addressDB.get(id);

  await addressDB.put(
      id,
      Addressmodel(
          name: data!.name,
          contact: data.contact,
          address: data.address,
          city: data.city,
          pincode: data.pincode,
          id: id));
  getaddress();
}

Future<void> getaddress() async {
  final addrsssDB = await Hive.openBox<Addressmodel>('address');
  addresslist.value.clear();
  addresslist.value.addAll(addrsssDB.values);
  addresslist.notifyListeners();
}
