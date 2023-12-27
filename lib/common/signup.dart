// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_store/common/login.dart';
import 'package:we_store/database/functions/signup/signup_fuctions.dart';
import 'package:we_store/database/functions/signup/db_models.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text('Register', style: GoogleFonts.pollerOne(fontSize: 34)),
                  SizedBox(
                    height: 45,
                  ),

                  //name
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateName,
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'This is not a username',
                        border: UnderlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //phonenumber
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    validator: validatePhone,
                    controller: _phoneController,
                    decoration: InputDecoration(
                        labelText: 'Phone', border: UnderlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //email
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Email', border: UnderlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //createpassword
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateCreatepassword,
                    controller: _createpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Create a Password',
                        border: UnderlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //conformpassowrd
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateConformpassword,
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
                          userCheck(_emailController.text);
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

  //to validate phone

  String? validatePhone(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'Enter your Phone Number';
    }

    final RegExp phoneRegExp = RegExp(r'^[0-9 ]+$');

    if (!phoneRegExp.hasMatch(trimmedvalue)) {
      return 'Enter your Number';
    }
    return null;
  }

  //email
  String? validateEmail(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'enter your email id';
    }

    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );

    if (!emailRegExp.hasMatch(trimmedValue)) {
      return 'enter valid email';
    }
    return null;
  }

  //createpassword
  String? validateCreatepassword(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'create a password';
    }
    return null;
  }

  //conformepassword
  String? validateConformpassword(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'Re Enter your password';
    }

    if (trimmedValue != _createpasswordController.text) {
      return 'Password must watch';
    }

    return null;
  }

  //signup
  void userCheck(String email) async {
    await Hive.openBox<SignupDetails>('signup_db');
    final signupDB = Hive.box<SignupDetails>('signup_db');
    final signupExists = signupDB.values.any((user) => user.email == email);

    if (signupExists) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('error'),
              content: Text('User alredy exists'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('ok'))
              ],
            );
          });
    } else {
      signupButton();
    }
  }

  Future<void> signupButton() async {
    final _name = _nameController.text.trim();
    final _phone = _phoneController.text.trim();
    final _email = _emailController.text.trim();
    final _createpassword = _createpasswordController.text.trim();
    final _conformpassword = _conformpasswordController.text.trim();
    print(_name);

    if (_formKey.currentState!.validate() &&
        _createpasswordController.text == _conformpasswordController.text) {
      final _user = SignupDetails(
          name: _name,
          phone: _phone,
          email: _email,
          createpassword: _createpassword,
          conformpassword: _conformpassword);
      addSignup(_user); //nokkanam
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      showSnackBar(context, 'User registration failed!');
      _nameController.clear();
      _phoneController.clear();
      _emailController.clear();
      _createpasswordController.clear();
      _conformpasswordController.clear();
    }
  }

  //code
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: Duration(seconds: 3)));
  }
}
