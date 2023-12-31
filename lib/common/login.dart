// ignore_for_file: use_build_context_synchronously, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_store/Admin/home.dart';
import 'package:we_store/common/signup.dart';
import 'package:we_store/common/welcome.dart';

import 'package:we_store/database/functions/signup/db_models.dart';

const SAVE_KEY_NAME = 'saveUserEmail';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _validEmailController = TextEditingController();
  final _validPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    'Log In',
                    style: GoogleFonts.pollerOne(fontSize: 34),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //email

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    controller: _validEmailController,
                    validator: validateEmail,
                    decoration: InputDecoration(
                      label: Text('Email Id'),
                      hintText: 'Enter your Email',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  //password

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _validPasswordController,
                    validator: validatePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text('Password'),
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          onPressed: () {
                            submit();
                          },
                          child: Text(
                            'Login',
                            style:
                                GoogleFonts.rubik(fontWeight: FontWeight.w500),
                          ))),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                      child: Text('Create New Account'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//validate email
  String? validateEmail(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'enter email id';
    }

    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );

    if (!emailRegExp.hasMatch(trimmedValue)) {
      return 'invalid email id';
    }

    return null;
  }

  //tovalidate password
  String? validatePassword(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'enter password';
    }

    final RegExp passwordRegExp = RegExp(
      r'^[a-z-0-9]',
    );

    if (!passwordRegExp.hasMatch(trimmedValue)) {
      return 'invalid password';
    }

    return null;
  }

  //submit form
  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_validEmailController.text == 'admin@gmail.com' &&
          _validPasswordController.text == 'admin123') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => AdminHome()));
      } else {
        login(
            _validEmailController.text, _validPasswordController.text, context);
      }
    }
  }

  //to login
  void login(String email, String password, BuildContext context) async {
    final signupDB = await Hive.openBox<SignupDetails>('signup_db');

    SignupDetails? signup;

    for (var i = 0; i < signupDB.length; i++) {
      final currentUser = signupDB.getAt(i);

      if (currentUser?.email == email &&
          currentUser?.conformpassword == password) {
        signup = currentUser;
        break;
      }
    }

    if (signup != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(SAVE_KEY_NAME, true);
      await saveUserEmail(email);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('invalid email or password'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text('ok'))
              ],
            );
          });
    }
  }

  //set a current user
  Future<void> saveUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentUser', email);
  }
}

//logout button
void logout(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Do you want to logout...?'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  signout(context);
                },
                child: Text('Yes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        );
      });
}

//signoutfuntion
signout(BuildContext context) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _sharedPrefs = await SharedPreferences.getInstance();
  await _sharedPrefs.clear();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => Login()), (route) => false);
}
