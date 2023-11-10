import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/Admin/home.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AdminHome(),
          ));
    });
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 370,
            ),
            Text(
              'Welcome to We Store',
              style: GoogleFonts.pollerOne(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            Image.network(
              'https://c.tenor.com/K2UGDd4acJUAAAAC/tenor.gif',
              height: 64,
              //width: 100,
            ),
            SizedBox(
              height: 130,
            ),
            Text(
              'Authorized Apple Store In Kerala',
              style: GoogleFonts.questrial(
                  fontWeight: FontWeight.w500, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
