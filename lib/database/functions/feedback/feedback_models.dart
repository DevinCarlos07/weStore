import 'package:hive_flutter/hive_flutter.dart';
part 'feedback_models.g.dart';

@HiveType(typeId: 30)
class UserFeedback {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String feedback;

  @HiveField(2)
  String name;
  UserFeedback({required this.feedback, required this.name, this.id});
}
