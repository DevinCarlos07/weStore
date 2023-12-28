// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_store/database/functions/feedback/feedback_function.dart';
import 'package:we_store/database/functions/feedback/feedback_models.dart';
import 'package:we_store/database/functions/signup/db_models.dart';
import 'package:intl/intl.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _feedController = TextEditingController();
  SignupDetails? currentUser;
  @override
  initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userEmail = prefs.getString('currentUser');
    final userBox = await Hive.openBox<SignupDetails>('signup_db');
    currentUser = userBox.values.firstWhere(
      (user) => user.email == userEmail,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text = '${currentUser?.name}';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Feedback',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/star.jpg'),
                  radius: 45,
                ),
                SizedBox(
                  height: 20,
                ),
                // Text(
                //   "We Store",
                //   style: TextStyle(
                //     fontSize: 28,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                Text(
                  '"Your Feedback is valueable to us"',
                  style: GoogleFonts.poppins(
                      fontSize: 16.5, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: validateName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _nameController,
                  decoration: InputDecoration(
                      label: Text('Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 17,
                ),
                TextFormField(
                  validator: validatefeedback,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _feedController,
                  decoration: InputDecoration(
                      label: Text('Ente Your Feedback'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  maxLines: 5,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addfeed();
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  //to validate name
  String? validateName(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'Enter Your Name';
    }
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$');

    if (!nameRegExp.hasMatch(trimmedvalue)) {
      return 'Full Name only contains letters';
    }
    return null;
  }

  //feedback
  String? validatefeedback(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'Enter Feedback';
    }
    return null;
  }

  Future<void> addfeed() async {
    final _name = _nameController.text;
    final _feed = _feedController.text;
    // ignore: prefer_const_declarations
    // final _date = DateTime.now;
    // final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss');
    // print(_date);
    // print('Current Date and Time: ${formattedDate.toString()}');
    // print('ike');
    // print('this is data${_date.toString()}');
    final addfeed = UserFeedback(
      feedback: _feed,
      name: _name,
      id: -1,
      currentdate: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
    );
    addtofeedback(addfeed);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Feedback added!!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));
    _feedController.clear();
    _nameController.clear();
  }
}
