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
  @HiveField(6)
  String deliveryAddress;
  @HiveField(7)
  String deliveryName;
  @HiveField(8)
  String deliveryPhone;
  @HiveField(9)
  String deliveryCity;
  @HiveField(10)
  String pincode;
  @HiveField(11)
  String productCount;

  Cancelorder(
      {required this.name,
      required this.price,
      required this.details,
      required this.image,
      required this.deliveryAddress,
      required this.deliveryName,
      required this.deliveryPhone,
      required this.deliveryCity,
      required this.pincode,
      required this.productCount,
      required this.id});
}
