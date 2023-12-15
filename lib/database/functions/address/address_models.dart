import 'package:hive_flutter/hive_flutter.dart';
part 'address_models.g.dart';

@HiveType(typeId: 10)
class Addressmodel {
  @HiveField(1)
  int? id;

  @HiveField(2)
  String name;

  @HiveField(3)
  String contact;

  @HiveField(4)
  String address;

  @HiveField(6)
  String city;

  Addressmodel(
      {required this.name,
      required this.contact,
      required this.address,
      required this.city,
      this.id});
}
