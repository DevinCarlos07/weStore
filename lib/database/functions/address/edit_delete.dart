import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/address/address_fuction.dart';
import 'package:we_store/database/functions/address/address_models.dart';

Future<void> edit_address(int? id, String name, String contact, String address,
    String city, String pincode) async {
  final editBox = await Hive.openBox<Addressmodel>('address');
  final existingAddress =
      editBox.values.firstWhere((element) => element.id == id);
  existingAddress.name = name;
  existingAddress.contact = contact;
  existingAddress.address = address;
  existingAddress.city = city;
  existingAddress.pincode = pincode;

  await editBox.put(id, existingAddress);
  getaddress();
}
