import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:we_store/database/functions/category/fuctions.dart';
import 'package:we_store/database/functions/category/models.dart';
import 'package:we_store/database/functions/category/newcategory.dart';

// ignore: non_constant_identifier_names
Future<void> edit_Category(int? id, String name, String image) async {
  final editBox = await Hive.openBox<CategoryAdd>('add_cat');
  final existingCategory = editBox.values.firstWhere((user) => user.id == id);
  existingCategory.catname = name;
  existingCategory.catimage = image;

  await editBox.put(id, existingCategory);

  getcategory();
}

void removecategory(BuildContext context, int? id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remove Category'),
          content: Text('Do you want to remove'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  deletecategory(context, id);
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

Future<void> deletecategory(context, int? id) async {
  final remove = await Hive.openBox<CategoryAdd>('add_cat');
  remove.delete(id);
  getcategory();
  Navigator.of(context)
      .pop(MaterialPageRoute(builder: (context) => NewCategory()));
}
