import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/database/functions/place_order/functions.dart';
import 'package:we_store/database/functions/place_order/models.dart';

void cancel(BuildContext context, int? id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cancel Order'),
          content: Text('Do you want to cancel'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  conformcancel(context, id);
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

Future<void> conformcancel(context, int? id) async {
  final cancel = await Hive.openBox<Oredrplace>('order');
  cancel.delete(id);
  getorder();

  Navigator.pop(context);
}
