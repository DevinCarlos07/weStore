import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Moreinfo extends StatefulWidget {
  const Moreinfo({super.key});

  @override
  State<Moreinfo> createState() => _MoreinfoState();
}

class _MoreinfoState extends State<Moreinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'About',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/star.jpg'),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'We Store',
                      style: GoogleFonts.poppins(
                          fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      ' Your Ultimate Gadget Shopping Experience',
                      style: GoogleFonts.rubik(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  ''' Welcome to "We Store," your go-to destination for a seamless and delightful gadget shopping experience. "We Store" is a cutting-edge Flutter application that combines the convenience of e-commerce with the efficiency of a local Hive database. Discover the latest and trendiest gadgets, shop with confidence, and enjoy a personalized journey tailored to your preferences.
        ''',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Extensive Gadget Catalog',
                      style: TextStyle(fontSize: 16),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Explore a vast catalog of gadgets ranging from smartphones and smartwatches to laptops and cutting-edge tech accessories. Stay updated with the latest releases and trends in the gadget world.User-Friendly Interface:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      _launchTCURL();
                    },
                    child: Text('Privacy Policy')),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Version 1.0',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchTCURL() async {
    Uri url = Uri.parse(
        'https://www.freeprivacypolicy.com/live/d09b1818-1393-4314-8967-b215492313dc');
    if (await launchUrl(url)) {
      //dialer opened
    } else {
      SnackBar(content: Text("couldn't launch the page"));
    }
  }
}
