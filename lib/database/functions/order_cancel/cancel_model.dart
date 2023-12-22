import 'package:hive_flutter/adapters.dart';
part 'cancel_model.g.dart';

@HiveType(typeId: 21)
class Cancelorder {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;
  @HiveField(2)
  String price;
  @HiveField(3)
  String details;
  @HiveField(4)
  String image;
  Cancelorder(
      {required this.name,
      required this.price,
      required this.details,
      required this.image,
      required this.id});
}
