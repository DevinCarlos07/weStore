import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/cart/cart_functions.dart';
import 'package:we_store/database/functions/wishlist/fav_model.dart';

ValueNotifier<List<AddFav>> addfavlist = ValueNotifier([]);
Future<void> addtofav(AddFav value) async {
  final addfavDB = await Hive.openBox<AddFav>('add_fav');
  final _addfav = await addfavDB.add(value);

  value.id = _addfav;
  addfavlist.value.add(value);
  addfavlist.notifyListeners();
}

Future<void> geterfav() async {
  final addfavbox = await Hive.openBox<AddFav>('add_fav');
  addfavlist.value.clear();
  addfavlist.value.addAll(addfavbox.values);
  addcartlist.notifyListeners();
}
