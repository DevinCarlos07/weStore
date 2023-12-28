import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_store/database/functions/feedback/feedback_models.dart';

ValueNotifier<List<UserFeedback>> feedbacklist = ValueNotifier([]);

Future<void> addtofeedback(UserFeedback values) async {
  final feedbackDB = await Hive.openBox<UserFeedback>('feedback');
  final id = await feedbackDB.add(values);
  final data = feedbackDB.get(id);
  await feedbackDB.put(
      id,
      UserFeedback(
          feedback: data!.feedback,
          name: data.name,
          id: id,
          currentdate: data.currentdate));
  getfeedback();
}

Future<void> getfeedback() async {
  final feedbackdb = await Hive.openBox<UserFeedback>('feedback');
  feedbacklist.value.clear();
  feedbacklist.value.addAll(feedbackdb.values);
  feedbacklist.notifyListeners();
}

//remove feedback from adminside
void removefeedback(BuildContext context, int? id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Feedback'),
          content: Text('You want to remove the feedback!!'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  deletefeed(context, id);
                },
                child: Text('Yes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        );
      });
}

Future<void> deletefeed(context, int? id) async {
  final delete = await Hive.openBox<UserFeedback>('feedback');
  delete.delete(id);
  getfeedback();
  Navigator.pop(context);
}
