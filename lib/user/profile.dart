import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:we_store/common/login.dart';
import 'package:we_store/database/functions/signup/db_models.dart';
import 'package:we_store/user/subpages/add_address_user.dart';
import 'package:we_store/user/subpages/feedback.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  SignupDetails? currentUser;
  initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userEmail = prefs.getString('currentUser');
    print(userEmail);
    final userBox = await Hive.openBox<SignupDetails>('signup_db');
    currentUser = userBox.values.firstWhere(
      (user) => user.email == userEmail,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: Text(
          'Account',
          style: GoogleFonts.rubik(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/star.jpg'),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '${currentUser?.name}',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    '${currentUser?.email}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 13, right: 13, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => Useraddress()));
                  },
                  leading: Icon(
                    Icons.edit_document,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Address',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 13, right: 13, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.more_horiz_sharp,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'More INFO',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 13, right: 13, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {
                    _launchTCURL();
                  },
                  leading: Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Privacy Policy',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 13, right: 13, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedbackScreen()));
                  },
                  leading: Icon(
                    Icons.feedback_outlined,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Feedback',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 13, right: 13, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {
                    logout(context);
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Sign Out',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    'Version',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'WE Store 1.0',
                    style: GoogleFonts.rubik(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _launchTCURL() async {
    Uri url = Uri.parse(
        'https://www.freeprivacypolicy.com/live/d09b1818-1393-4314-8967-b215492313dc');
    if (await launchUrl(url)) {
      //dialer opened
    } else {
      SnackBar(content: Text("couldn't launch the page"));
    }
  }
}
