import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_store/database/functions/category/fuctions.dart';
import 'package:we_store/database/functions/category/models.dart';
import 'package:we_store/user/category.dart';

class category_widget extends StatelessWidget {
  const category_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryaddlist,
        builder: (context, List<CategoryAdd> addlist, Widget? child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: addlist.length,
            itemBuilder: (BuildContext context, int index) {
              final addtocat = addlist.reversed.toList()[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                    categorys: addtocat.catname)));
                      },
                      child: CircleAvatar(
                          radius: 32,
                          backgroundImage: FileImage(File(addtocat.catimage))),
                    ),
                    SizedBox(height: 4),
                    Text(
                      addtocat.catname,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
