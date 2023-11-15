import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_store/common/login.dart';
import 'package:we_store/common/signup.dart';

class SigninLogin extends StatefulWidget {
  const SigninLogin({super.key});

  @override
  State<SigninLogin> createState() => _SigninLoginState();
}

class _SigninLoginState extends State<SigninLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 99,
            ),
            Image.asset(
              'assets/images/appleall.jpg',
            ),
            SizedBox(height: 45),
            Image.asset(
              'assets/images/star.jpg',
              //  width: 54,
              height: 54,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'We Store',
              style: GoogleFonts.poppins(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => SignUp()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10, height: 75),
                SizedBox(
                    width: 110,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => Login()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
                        )))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Text(
                  '“Obviously anything that accessorizes or enhances the iPhone is always pretty cool”',
                  style: GoogleFonts.poly(
                      fontWeight: FontWeight.w600, fontSize: 18.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
