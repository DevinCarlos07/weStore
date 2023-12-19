import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class home_appbar_text extends StatelessWidget {
  const home_appbar_text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Text('Hy',
                style: GoogleFonts.rubik(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                    fontSize: 17)),
            Text(
              ' Alexa',
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Start Buying',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
