import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  List<String> images = [
    'assets/images/apple1.jpg',
    'assets/images/iphoneforcat.webp'
  ];
  List<String> about = ['White', '128 GB', '20W', 'Silicon', 'M2Pro', 'M1'];
  List<String> model = ['iWatch', 'iPhone'];
  List<String> spec = ['ULTRA', '512 GB'];
  List<String> price = ['₹ 1,00,00', '₹ 1,25,000'];
  List<String> qty = ['Qty: 1', 'Qty: 1'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 17,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  margin: EdgeInsets.all(10.0),
                  height: 160,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start, //lastupdate
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
                              height: 95,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    fontSize: 14, fontWeight: FontWeight.w400),
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'OrderPlaced',
                                style: GoogleFonts.rubik(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 147, 141, 141))),
                              child: Text('Details')),
                          SizedBox(
                            width: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 191, 0, 255))),
                            child: Text('Cancel'),
                          ),
                        ],
                      )
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
