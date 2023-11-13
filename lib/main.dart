import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:we_store/common/splash.dart';
import 'package:we_store/database/db_models.dart';

Future<void> main() async {
  Hive.initFlutter();

  Hive.openBox<SignupDetails>('signup_db');

  if (!Hive.isAdapterRegistered(SignupDetailsAdapter().typeId)) {
    Hive.registerAdapter(SignupDetailsAdapter());
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
      // theme: ThemeData(
      //     //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     // useMaterial3: true,
      //     ),
      home: const SplashScreen(),
    );
  }
}
