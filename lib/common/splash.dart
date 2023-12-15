// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_store/common/bottomnav.dart';
import 'package:we_store/common/login.dart';
import 'package:we_store/common/sign_or_log.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage(
                'assets/images/star.jpg',
              ),
              width: 60,
              height: 60,
            ),
            SizedBox(height: 10),
            Text(
              "We Store",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => SigninLogin()));
  }

  Future<void> checkUserLoggin() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userLoggedin = _sharedprefs.getBool(SAVE_KEY_NAME);

    if (_userLoggedin == null || _userLoggedin == false) {
      gotoLogin();
    } else {
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => MyBottam()));
    }
  }
}
