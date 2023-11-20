import 'dart:io';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:we_store/database/functions/addproduct_fuctions.dart';
import 'package:we_store/database/models/addproduct_models.dart';
import 'package:we_store/user/fav.dart';

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

  icon() => null;
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
  List<AssetImage> image = [
    AssetImage('assets/images/airpode.jpg'),
    AssetImage('assets/images/iphoneforcat.webp'),
    AssetImage('assets/images/charger.jpg'),
    AssetImage('assets/images/case.webp'),
    AssetImage('assets/images/macforcat.jpeg'),
    AssetImage('assets/images/ipad.jpeg'),
    AssetImage('assets/images/iphoneforcat.webp'),
  ];
  List<String> name = [
    'AirPodes',
    'iPhone',
    'charger',
    'Case',
    'MacBook',
    'iPad',
  ];

  List<String> rate = [
    '₹24,000',
    '₹1,15,000',
    '₹2000',
    '₹500',
    '₹1,80,000',
    '₹1,5,0000',
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
                ))
          ],
          // bottom: TabBar(
          //   labelColor: Colors.black,
          //   labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          //   tabs: const [
          //     Tab(
          //       text: 'Home',
          //     ),
          //     Tab(text: 'Category')
          //   ],
          // ),
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
                itemCount: image.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Favourite()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Favourite()));
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
                          onTap: () {},
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
                                            Text(addproducts.price,
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
                                              icon: Icon(Icons.favorite_border),
                                              onPressed: () {
                                                // Handle favorite button tap
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                  Icons.shopping_cart_outlined),
                                              onPressed: () {
                                                // Handle shopping cart button tap
                                                _bootmsheet(context);
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
  void _bootmsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: 200,
            child: Column(
              children: [Text('okey')],
            ),
          );
        });
  }
}
