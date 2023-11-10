// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/common/login.dart';
import 'package:we_store/database/db_fuctions.dart';
import 'package:we_store/database/db_models.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _createpasswordController = TextEditingController();
  final _conformpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text('Register', style: GoogleFonts.pollerOne(fontSize: 34)),
                SizedBox(
                  height: 45,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'This is not a username',
                      border: UnderlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      labelText: 'Phone', border: UnderlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email', border: UnderlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _createpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Create a Password',
                      border: UnderlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _conformpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Conform Your Password',
                      border: UnderlineInputBorder()),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                      onPressed: () {
                        signupButtonClicked();
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => Login()));
                    },
                    child: Text('I have an Account'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signupButtonClicked() async {
    final _name = _nameController.text.trim();
    final _phone = _phoneController.text.trim();
    final _email = _emailController.text.trim();
    final _createpassword = _createpasswordController.text.trim();
    final _conformpassword = _conformpasswordController.text.trim();
    if (_name.isEmpty ||
        _phone.isEmpty ||
        _email.isEmpty ||
        _createpassword.isEmpty ||
        _conformpassword.isEmpty) {
      return;
    }
    print('$_name,$_phone,$_email,$_createpassword,$_conformpassword');

    final _signup = SignupDetails(
        name: _name,
        phone: _phone,
        email: _email,
        createpassword: _createpassword,
        conformpassword: _conformpassword);

    addSignup(_signup);
  }
}
