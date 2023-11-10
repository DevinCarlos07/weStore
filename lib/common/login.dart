import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/common/signup.dart';
import 'package:we_store/common/welcome.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                TextFormField(
                  controller: _validEmailController,
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
                TextFormField(
                  controller: _validPasswordController,
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
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => Welcome()));
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
                        ))),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => SignUp()));
                    },
                    child: Text('Create New Account'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginButtonClicked() {
    final String _validEmail = _validEmailController.text.trim();
    final String _validPassword = _validPasswordController.text.trim();
  }
}
