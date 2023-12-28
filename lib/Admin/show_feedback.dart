// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/database/functions/feedback/feedback_function.dart';
import 'package:we_store/database/functions/feedback/feedback_models.dart';

class ShowFeedback extends StatefulWidget {
  const ShowFeedback({super.key});
  @override
  State<ShowFeedback> createState() => _ShowFeedbackState();
}

class _ShowFeedbackState extends State<ShowFeedback> {
  @override
  void initState() {
    super.initState();
    getfeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Feedback',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ValueListenableBuilder(
                  valueListenable: feedbacklist,
                  builder:
                      (context, List<UserFeedback> feedback, Widget? child) {
                    return ListView.builder(
                        itemCount: feedback.length,
                        itemBuilder: (BuildContext context, int index) {
                          final feedbackdata =
                              feedback.reversed.toList()[index];
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 12, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.person),
                                                      SizedBox(
                                                        width: 11,
                                                      ),
                                                      Text(
                                                        feedbackdata.name,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      SizedBox(
                                                        width: 12,
                                                      )
                                                    ],
                                                  )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(feedbackdata
                                                        .currentdate
                                                        .toString())),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                removefeedback(
                                                    context, feedbackdata.id);
                                              });
                                            },
                                            icon: Icon(Icons.delete),
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 23,
                                          right: 23,
                                          top: 10,
                                          bottom: 15),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 6),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(feedbackdata.feedback)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
