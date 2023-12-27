import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_store/database/functions/feedback/feedback_models.dart';

ValueNotifier<List<UserFeedback>> feedbacklist = ValueNotifier([]);

Future<void> addtofeedback(UserFeedback values) async {
  final feedbackDB = await Hive.openBox<UserFeedback>('feedback');
  final id = await feedbackDB.add(values);
  final data = feedbackDB.get(id);
  await feedbackDB.put(
      id, UserFeedback(feedback: data!.feedback, name: data.name, id: id));
  getfeedback();
}

Future<void> getfeedback() async {
  final feedbackdb = await Hive.openBox<UserFeedback>('feedback');
  feedbacklist.value.clear();
  feedbacklist.value.addAll(feedbackdb.values);
  feedbacklist.notifyListeners();
}
