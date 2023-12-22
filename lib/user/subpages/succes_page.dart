import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_store/common/bottomnav.dart';

class CnfrmPage extends StatefulWidget {
  const CnfrmPage({super.key});

  @override
  State<CnfrmPage> createState() => _CnfrmPageState();
}

class _CnfrmPageState extends State<CnfrmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 70,
          bottom: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 350,
                child:
                    Image(image: AssetImage('assets/images/food-delivery.gif')),
              ),
            ),
            Text(
              'Congratulations!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('''Your order has been placed successfully
              and is on the way to you'''),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              // ignore: sized_box_for_whitespace
              child: Container(
                width: 240,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyBottam()));
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Container(
            //     width: 240,
            //     child: ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //             primary: Color.fromARGB(255, 255, 255, 255),
            //             side: const BorderSide(
            //               width: 2.0,
            //               color: Colors.red,
            //             )),
            //         child: const Text(
            //           'Back Home',
            //           style: TextStyle(color: Colors.black),
            //         )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
