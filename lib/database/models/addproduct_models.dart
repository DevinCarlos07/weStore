import 'package:hive_flutter/hive_flutter.dart';
part 'addproduct_models.g.dart';

@HiveType(typeId: 2)
class Addproducts {
  @HiveField(5)
  int? id;

  @HiveField(0)
  String name;

  @HiveField(1)
  String price;

  @HiveField(3)
  String details;

  @HiveField(6)
  String imagepath;

  Addproducts(
      {required this.imagepath,
      required this.name,
      required this.price,
      required this.details,
      this.id});
}
