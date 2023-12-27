import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_store/common/bottomnav.dart';
import 'package:we_store/database/functions/feedback/feedback_function.dart';
import 'package:we_store/database/functions/feedback/feedback_models.dart';
import 'package:we_store/database/functions/signup/db_models.dart';

class CnfrmPage extends StatefulWidget {
  const CnfrmPage({super.key});

  @override
  State<CnfrmPage> createState() => _CnfrmPageState();
}

class _CnfrmPageState extends State<CnfrmPage> {
  SignupDetails? currentUser;
  initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    // Retrieve currentUser email from shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //if(currentUser != null)
    var userEmail = prefs.getString('currentUser');
    print(userEmail);
    // check the user in Hive using the email
    final userBox = await Hive.openBox<SignupDetails>('signup_db');
    currentUser = userBox.values.firstWhere(
      (user) => user.email == userEmail,

      //orElse: () => null,
    );

    setState(() {});
  }

  final TextEditingController _feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 70,
          bottom: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 350,
                child:
                    Image(image: AssetImage('assets/images/food-delivery.gif')),
              ),
            ),
            Text(
              'Congratulations!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('''Your order has been placed successfully
              and is on the way to you'''),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              // ignore: sized_box_for_whitespace
              child: Container(
                width: 240,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyBottam()));
                    // showfeedback(context);
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Container(
            //     width: 240,
            //     child: ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //             primary: Color.fromARGB(255, 255, 255, 255),
            //             side: const BorderSide(
            //               width: 2.0,
            //               color: Colors.red,
            //             )),
            //         child: const Text(
            //           'Back Home',
            //           style: TextStyle(color: Colors.black),
            //         )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  // void showfeedback(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (builder) {
  //         return AlertDialog(
  //           title: Text('Feedback'),
  //           content: TextFormField(
  //             controller: _feedbackController,
  //             maxLines: 6,
  //             decoration: InputDecoration(
  //                 hintText: 'Enter Your Anonymous Feedback here!!'),
  //           ),
  //           actions: [
  //             ElevatedButton(
  //                 onPressed: () {
  //                   addfeed(context);
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text('Submit'))
  //           ],
  //         );
  //       });
  // }

  // Future<void> addfeed(BuildContext context) async {
  //   print(_feedbackController.text);
  //   final feed = UserFeedback(
  //       feedback: _feedbackController.text, name: currentUser.name, id: -1);
  //   print(feed);
  //   addtofeedback(feed);
  //   getfeedback();
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text('Feedback added!!'),
  //     duration: Duration(seconds: 2),
  //     backgroundColor: Colors.green,
  //   ));
  // }
}
