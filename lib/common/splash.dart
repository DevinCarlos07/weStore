import 'package:flutter/material.dart';

import 'package:we_store/common/sign_or_log.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SigninLogin(),
          ));
    });
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
}
