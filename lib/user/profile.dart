import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/common/login.dart';
import 'package:we_store/user/subpages/adressadd.dart';
import 'package:we_store/user/subpages/editprofile.dart';

import 'package:we_store/user/subpages/viewaddress.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 227, 224, 224),
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
              height: 260,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 224, 224),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/alexa2.0.png'),
                    radius: 100,
                  ),
                  Text(
                    'Alexa',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    'Alexa@gmail.com',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Edit Profile',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
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
                            builder: (ctx) => AddAddressScreen()));
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
              padding: const EdgeInsets.all(8),
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
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.location_on_rounded,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Location',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
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
              padding: const EdgeInsets.only(top: 25),
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
}
