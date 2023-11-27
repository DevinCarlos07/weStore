import 'package:hive_flutter/hive_flutter.dart';
part 'cart_models.g.dart';

@HiveType(typeId: 3)
class AddCart {
  @HiveField(1)
  int? id;

  @HiveField(2)
  String name;

  @HiveField(3)
  String price;

  @HiveField(4)
  String details;

  @HiveField(5)
  String imagepath;

  AddCart(
      {required this.name,
      required this.price,
      required this.details,
      required this.imagepath,
      this.id});
}
