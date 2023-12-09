import 'package:hive_flutter/adapters.dart';
part 'models.g.dart';

@HiveType(typeId: 8)
class CategoryAdd {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String catname;

  @HiveField(2)
  String catimage;

  CategoryAdd(
      {required this.catname, required this.catimage, required this.id});
}
