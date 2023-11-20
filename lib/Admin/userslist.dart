import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:we_store/Admin/home.dart';
import 'package:we_store/database/functions/signup_fuctions.dart';
import 'package:we_store/database/models/db_models.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  void initState() {
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHome()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Users List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: signuplist,
          builder: (context, List<SignupDetails> signuplist, Widget? child) {
            //  final userdatas = userBox.values.toList();
            return ListView.builder(
              itemCount: signuplist.length,
              itemBuilder: (BuildContext context, int index) {
                final userdata = signuplist[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: CircleAvatar(
                                    radius: 43,
                                    backgroundColor: Colors.blue,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userdata.name,
                                      style: GoogleFonts.rubik(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, top: 8),
                                      child: Text(userdata.email,
                                          style: GoogleFonts.rubik(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Text(userdata.phone,
                                        style: GoogleFonts.rubik(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Icon(Icons.verified_sharp),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
