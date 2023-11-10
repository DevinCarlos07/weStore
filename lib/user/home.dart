import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

int indexNum = 0;

List screen = [
  UserHome(),
];

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: CircleAvatar(
            child: Icon(
              Icons.person,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              'Username',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
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
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: screen.elementAt(indexNum),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bus),
            //label: 'Bus',
          )
        ],
        currentIndex: indexNum,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            indexNum = index;
          });
        },
      ),
    );
  }
}
