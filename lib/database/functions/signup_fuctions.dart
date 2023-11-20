import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_store/database/functions/addproduct_fuctions.dart';
import 'package:we_store/database/models/db_models.dart';

ValueNotifier<List<SignupDetails>> signuplist = ValueNotifier([]);

Future<void> addSignup(SignupDetails value) async {
  final signupDB = await Hive.openBox<SignupDetails>('signup_db');
  final _singnup = await signupDB.add(value);
  value.id = _singnup;
  signuplist.value.add(value);
  signuplist.notifyListeners();
  print(value.toString());
}

Future<void> getuser() async {
  final signupDB = await Hive.openBox<SignupDetails>('signup_db');
  signuplist.value.clear();
  signuplist.value.addAll(signupDB.values);
  productlist.notifyListeners();
}
