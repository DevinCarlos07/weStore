import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:we_store/database/functions/addproduct/addproduct_fuctions.dart';
import 'package:we_store/database/functions/addproduct/addproduct_models.dart';
import 'package:we_store/database/functions/cart/addcart_btn.dart';
import 'package:we_store/database/functions/wishlist/addwishlist.dart';
import 'package:we_store/user/category.dart';
import 'package:we_store/user/fav.dart';
import 'package:we_store/user/subpages/cart.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  void initState() {
    super.initState();
    getproducts();
  }

  List<AssetImage> assetimage = [
    AssetImage('assets/images/apple1.jpg'),
    AssetImage('assets/images/iphoneforcat.webp'),
    AssetImage('assets/images/airpode.jpg'),
    AssetImage('assets/images/ipad.jpeg'),
    AssetImage('assets/images/macforcat.jpeg'),
    AssetImage('assets/images/case.webp'),
    AssetImage('assets/images/charger.jpg'),
  ];
  List<String> names = [
    'Iwatches',
    'Iphone',
    'Airpode',
    'iPad',
    'MacBook',
    'Case',
    'Charger',
  ];

  List<String> about = ['White', '128 GB', '20W', 'Silicon', 'M2Pro', 'M1'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: Padding(
            padding: EdgeInsets.only(left: 7),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/alexa2.0.png'),
            ),
          ),
          title: Column(
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
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ))
          ],
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categorys',
                    style: GoogleFonts.rubik(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: assetimage.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryScreen(
                                        categorys: names[index])));
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: assetimage[index],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          names[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'New Arrivals',
                      style: GoogleFonts.rubik(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ValueListenableBuilder(
                valueListenable: productlist,
                builder: (context, List<Addproducts> addlist, Widget? child) {
                  // final addproduct = addBox.values.toList();

                  return Expanded(
                    child: GridView.builder(
                      itemCount: addlist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        mainAxisExtent: 290,
                      ),
                      itemBuilder: (context, index) {
                        final addproducts = addlist[index];
                        return GestureDetector(
                          onTap: () {
                            _bootmsheet(
                                context,
                                addproducts.name,
                                addproducts.imagepath,
                                addproducts.price,
                                addproducts.details);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Color.fromARGB(255, 234, 228, 228),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.file(
                                      File(
                                        addproducts.imagepath,
                                      ),
                                      height: 160,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              addproducts.name,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text('₹${addproducts.price}',
                                                style: GoogleFonts.rubik(
                                                    color: Colors.green,
                                                    fontSize: 15))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        Text(addproducts.details,
                                            style: GoogleFonts.rubik(
                                                fontSize: 15)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                addfav_button(
                                                    addproducts, context);
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                  Icons.shopping_cart_outlined),
                                              onPressed: () {
                                                checkCart(addproducts, context);
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  //bottomsheet
  void _bootmsheet(BuildContext context, String name, String imagepath,
      String price, String details) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 214, 204, 204)),
            height: 320,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: Text(
                    'Buy This',
                    style: GoogleFonts.rubik(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 30, bottom: 20),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(File(imagepath)),
                                fit: BoxFit.cover),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.rubik(
                              fontSize: 21, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          details,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Text(
                          '₹$price',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: Text(
                            'Buy Now',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
