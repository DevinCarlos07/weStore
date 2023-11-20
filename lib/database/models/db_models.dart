import 'package:hive/hive.dart';
part '../db_models.g.dart';

@HiveType(typeId: 1)
class SignupDetails {
  @HiveField(5)
  int? id;
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  @HiveField(2)
  String email;

  @HiveField(3)
  String createpassword;

  @HiveField(4)
  String conformpassword;

  SignupDetails(
      {required this.name,
      required this.phone,
      required this.email,
      required this.createpassword,
      required this.conformpassword,
      this.id});
}
