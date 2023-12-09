import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/wishlist/fav_model.dart';

ValueNotifier<List<AddFav>> addfavlist = ValueNotifier([]);
Future<void> addtofav(AddFav value) async {
  final addfavDB = await Hive.openBox<AddFav>('add_fav');
  final id = await addfavDB.add(value);
  final favdata = addfavDB.get(id);
  await addfavDB.put(
      id,
      AddFav(
          name: favdata!.name,
          price: favdata.price,
          details: favdata.details,
          imagepath: favdata.imagepath,
          id: id));
  geterfav();
}

Future<void> geterfav() async {
  final addfavbox = await Hive.openBox<AddFav>('add_fav');
  addfavlist.value.clear();
  addfavlist.value.addAll(addfavbox.values);
  addfavlist.notifyListeners();
}
