import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:we_store/common/splash.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';
import 'package:we_store/database/functions/address/address_models.dart';
import 'package:we_store/database/functions/cart/cart_models.dart';
import 'package:we_store/database/functions/category/models.dart';
import 'package:we_store/database/functions/feedback/feedback_models.dart';
import 'package:we_store/database/functions/order_cancel/cancel_model.dart';
import 'package:we_store/database/functions/place_order/models.dart';
import 'package:we_store/database/functions/signup/db_models.dart';
import 'package:we_store/database/functions/wishlist/fav_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.openBox<SignupDetails>('signup_db');
  Hive.openBox<Addproducts>('add_product');
  Hive.openBox<AddCart>('add_cart');
  Hive.openBox<AddFav>('add_fav');
  Hive.openBox<CategoryAdd>('add_cat');
  Hive.openBox<Addressmodel>('address');
  Hive.openBox<Oredrplace>('order');
  Hive.openBox<Cancelorder>('cancel');
  Hive.openBox<UserFeedback>('feedback');

  // Hive.initFlutter();

  if (!Hive.isAdapterRegistered(SignupDetailsAdapter().typeId)) {
    Hive.registerAdapter(SignupDetailsAdapter());
  }
  if (!Hive.isAdapterRegistered(AddproductsAdapter().typeId)) {
    Hive.registerAdapter(AddproductsAdapter());
  }
  if (!Hive.isAdapterRegistered(AddCartAdapter().typeId)) {
    Hive.registerAdapter(AddCartAdapter());
  }
  if (!Hive.isAdapterRegistered(AddFavAdapter().typeId)) {
    Hive.registerAdapter(AddFavAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryAddAdapter().typeId)) {
    Hive.registerAdapter(CategoryAddAdapter());
  }
  if (!Hive.isAdapterRegistered(AddressmodelAdapter().typeId)) {
    Hive.registerAdapter(AddressmodelAdapter());
  }
  if (!Hive.isAdapterRegistered(OredrplaceAdapter().typeId)) {
    Hive.registerAdapter(OredrplaceAdapter());
  }
  if (!Hive.isAdapterRegistered(CancelorderAdapter().typeId)) {
    Hive.registerAdapter(CancelorderAdapter());
  }
  if (!Hive.isAdapterRegistered(UserFeedbackAdapter().typeId)) {
    Hive.registerAdapter(UserFeedbackAdapter());
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
