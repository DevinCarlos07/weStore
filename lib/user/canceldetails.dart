import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelDetails extends StatefulWidget {
  const CancelDetails({super.key});

  @override
  State<CancelDetails> createState() => _CancelDetailsState();
}

class _CancelDetailsState extends State<CancelDetails> {
  List<String> images = [
    'assets/images/airpode.jpg',
    'assets/images/ipad.jpeg'
  ];

  List<String> model = ['AirPode', 'iPadPro'];
  List<String> spec = ['2nd GEN', '512 GB'];
  List<String> price = ['₹ 25,000', '₹ 1,45,000'];
  List<String> qty = ['Qty: 1', 'Qty: 1'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 17,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: model.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  margin: EdgeInsets.all(10.0),
                  height: 120,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              images[index],
                              height: 80,
                              width: 120,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                model[index],
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                spec[index],
                                style: GoogleFonts.rubik(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                qty[index],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 44,
                          ),
                          Column(
                            children: [
                              Text(
                                'OrderCanceld',
                                style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                price[index],
                                style: GoogleFonts.rubik(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
