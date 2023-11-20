import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:we_store/common/splash.dart';
import 'package:we_store/database/models/addproduct_models.dart';
import 'package:we_store/database/models/db_models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.openBox<SignupDetails>('signup_db');
  Hive.openBox<Addproducts>('add_product');

  Hive.initFlutter();

  if (!Hive.isAdapterRegistered(SignupDetailsAdapter().typeId)) {
    Hive.registerAdapter(SignupDetailsAdapter());
  }
  if (!Hive.isAdapterRegistered(AddproductsAdapter().typeId)) {
    Hive.registerAdapter(AddproductsAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WE Store ',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
