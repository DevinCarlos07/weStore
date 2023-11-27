import 'package:hive_flutter/hive_flutter.dart';
part 'fav_model.g.dart';

@HiveType(typeId: 4)
class AddFav {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String price;

  @HiveField(3)
  String details;

  @HiveField(4)
  String imagepath;

  AddFav(
      {required this.name,
      required this.price,
      required this.details,
      required this.imagepath,
      this.id});
}
