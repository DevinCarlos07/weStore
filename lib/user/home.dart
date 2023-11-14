import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  icon() => null;
  List<AssetImage> assetimage = [
    AssetImage('images/break.jpg'),
    AssetImage('images/lunch.jpg'),
    AssetImage('images/diner.jpg'),
    AssetImage('images/burger.jpg'),
    AssetImage('images/drink.jpg'),
    AssetImage('images/piza.jpg'),
    AssetImage('images/prof.jpg'),
  ];
  List<String> names = [
    'Break Fast',
    'Lunch',
    'Dinner',
    'Burger',
    'Drinks',
    'Piza',
    'Other',
  ];
  List<AssetImage> image = [
    AssetImage(
      'images/biri.jpg',
    ),
    AssetImage('images/bur.jpg'),
    AssetImage('images/burg.jpg'),
    AssetImage('images/chick.jpg'),
    AssetImage('images/masa.jpg'),
    AssetImage('images/piza.jpg'),
    AssetImage('images/burge.jpg'),
    AssetImage('images/drink.jpg'),
    AssetImage('images/piza.jpg'),
    AssetImage('images/biri.jpg'),
  ];
  List<String> name = [
    'Biriyani',
    'Fluff Screamer',
    'Slugburger',
    'chicken',
    'Masala Dosa',
    'Neapolitan Piza',
    'Luther Burger',
    'Fritz Kola & Fritz Limo',
    'Detroit Pizza',
    'chicken Biriyani',
  ];

  List<String> rate = [
    '₹100.0',
    '₹250.0',
    '₹200.0',
    '₹650.0',
    '₹60.0',
    '₹600.0',
    '₹300.0',
    '₹40.0',
    '₹750.0',
    '₹100.0',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Username',
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
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
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 10,
                    ),
                    Text(
                      'Categorys',
                      style: GoogleFonts.rubik(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => CategoriesScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: assetimage[index],
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
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  mainAxisExtent: 290,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            child: Image(
                              image: image[index],
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(
                                        const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(rate[index]),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () {
                                        // Handle favorite button tap
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.shopping_cart_outlined),
                                      onPressed: () {
                                        // Handle shopping cart button tap
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
