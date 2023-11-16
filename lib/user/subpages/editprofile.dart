import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/common/bottomnav.dart';
import 'package:we_store/user/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Edit Profile',
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/alexa2.0.png'),
                    radius: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.edit_document)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        hintText: 'Alexa',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 46, right: 46),
                  child: Text(
                    '''*This not a Username and no one can  find you in this name''',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 117, 120, 122)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.red,
                        ),
                        border: UnderlineInputBorder(),
                        hintText: 'Alexa@gmail.com',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Submit')),
                ),
              ],
            ),
          ),
        ));
  }
}
