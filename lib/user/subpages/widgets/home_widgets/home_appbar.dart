import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_store/database/functions/signup/db_models.dart';

class home_appbar_text extends StatefulWidget {
  const home_appbar_text({
    super.key,
  });

  @override
  State<home_appbar_text> createState() => _home_appbar_textState();
}

class _home_appbar_textState extends State<home_appbar_text> {
  // String email = "";
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

      //orElse: () => null,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Text('Hy',
                style: GoogleFonts.rubik(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                    fontSize: 17)),
            Text(
              " ${currentUser?.name}",
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Start Buying',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
