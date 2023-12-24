// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_store/database/functions/addproduct/addproduct_fuctions.dart';
import 'package:we_store/database/functions/signup/db_models.dart';

ValueNotifier<List<SignupDetails>> signuplist = ValueNotifier([]);

Future<void> addSignup(SignupDetails value) async {
  final signupDB = await Hive.openBox<SignupDetails>('signup_db');
  final singnup = await signupDB.add(value);
  value.id = singnup;
  signuplist.value.add(value);
  // ignore: invalid_use_of_protected_member
  signuplist.notifyListeners();
  getuser();
}

Future<void> getuser() async {
  final signupDB = await Hive.openBox<SignupDetails>('signup_db');
  signuplist.value.clear();
  signuplist.value.addAll(signupDB.values);
  // ignore: invalid_use_of_protected_member
  productlist.notifyListeners();
}
