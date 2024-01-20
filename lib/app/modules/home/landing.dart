// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Recommendations/Recommendations/selectrecpage.dart';
import '../ECG/ecg/ecg1.dart';
import '../SkinDisease/skindisease/skindisease1.dart';
import '../Sleep/sleep/Selectpage.dart';
import '../Sleep/sleep/sleep1.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});
  @override
  State<Landing> createState() => _landing();
}

bool obsecure = true;
bool isChecked = false;

class _landing extends State<Landing> {
  User? currentUser;

  @override
  void initState() {
    fetchCurrentUser();
    super.initState();
    // Fetch the current user information asynchronously in initState
  }

  Future<void> fetchCurrentUser() async {
    currentUser = Supabase.instance.client.auth.currentUser!;

    // Force a rebuild of the widget tree after fetching user information
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          color: Colors.blueAccent,
          animationDuration: Duration(milliseconds: 200),
          backgroundColor: Color.fromRGBO(239, 241, 255, 1),
          height: MediaQuery.of(context).size.height * 0.07,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),

            Icon(Icons.notifications, size: 30, color: Colors.white),
            // Icon(Icons.add, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        backgroundColor: Color.fromRGBO(239, 241, 255, 1),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
            child: Column(
              children: [
                // first part conatiner and stack
                Container(
                    width: MediaQuery.of(context).size.height * 0.45,
                    height: MediaQuery.of(context).size.height * 0.28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.height * 0.02),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.height * 0.02),
                        bottomLeft: Radius.circular(
                            MediaQuery.of(context).size.height * 0.02),
                        bottomRight: Radius.circular(
                            MediaQuery.of(context).size.height * 0.02),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment(
                              -0.1455439329147339, 0.13629785180091858),
                          end:
                              Alignment(0.702239453792572, 0.15669594705104828),
                          colors: [
                            Color.fromRGBO(149, 202, 242, 1),
                            Color.fromRGBO(99, 182, 255, 1)
                          ]),
                    ),
                    child: Stack(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.02,
                              top: MediaQuery.of(context).size.height * 0.01),
                          child: Text.rich(TextSpan(
                              text: 'Hello\n',
                              style: TextStyle(
                                color: Color.fromRGBO(11, 11, 11, 1),
                                fontFamily: 'Inter',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.023,
                                height:
                                    MediaQuery.of(context).size.height * 0.002,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                    text: currentUser!.email ?? 'Guest',
                                    style: TextStyle(
                                      color: Color.fromRGBO(11, 11, 11, 1),
                                      fontFamily: 'Inter',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      fontWeight: FontWeight.bold,
                                    )),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: 100,
                                )),
                                TextSpan(
                                    text: '\nHow are you doing\n',
                                    style: TextStyle(
                                      color: Color.fromRGBO(11, 11, 11, 1),
                                      fontFamily: 'Inter',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.030,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                    text: 'Today?\n',
                                    style: TextStyle(
                                      color: Color.fromRGBO(250, 248, 248, 1),
                                      fontFamily: 'Inter',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.030,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]))),
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.225,
                            left: MediaQuery.of(context).size.height * 0.03,
                          ),
                          //bottom: MediaQuery.of(context).size.height * 0.02,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 20,
                            child: Icon(Icons.person),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.27),
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'images/run1.png',
                                ),
                                // alignment: Alignment.centerRight,
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    ])),
                /////////// Second Part listview
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.height * 0.035,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ListView(
                      //  shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(205, 255, 244, 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.07,
                          child: IconButton(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => selectpagesleep()),
                                );
                              },
                              icon: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Image.asset(
                                    'images/1.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                  Text("Sleep")
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.03),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 205, 205, 205),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.07,
                          child: IconButton(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => selectpagerec()),
                                );
                              },
                              icon: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Image.asset(
                                    'images/fork_knife.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                  Text("Tips")
                                ],
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.height * 0.03)),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 219, 232, 10),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.07,
                          child: IconButton(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ecg1()),
                                );
                              },
                              icon: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Image.asset(
                                    'images/Group 28.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                  Text("ECG")
                                ],
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.height * 0.03)),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(248, 238, 242, 0.965),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.07,
                          child: IconButton(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => skindisease1()));
                              },
                              icon: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Image.asset(
                                    'images/Group 37.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                  Text("Skin")
                                ],
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.height * 0.03)),
                      ],
                    ),
                  ),
                ),
                // third part text

                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.035,
                    // right: MediaQuery.of(context).size.height * 0.21,
                    left: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " Your Vitality Report ",
                      style: TextStyle(
                        color: Color.fromARGB(215, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02)),
                // Fourth part  cardssss
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.026,
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromRGBO(255, 219, 232, 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                /*  margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1), */
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.favorite_outline,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            color:
                                                Color.fromRGBO(182, 55, 101, 1),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01,
                                          ),
                                          Text(
                                            "Heart Rate",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.022,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  182, 55, 101, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.026,
                                      ),
                                      child: Row(
                                        children: [
                                          Text.rich(TextSpan(
                                              text: "78 ",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    182, 55, 101, 1),
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: " bpm",
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02,
                                                    ))
                                              ]))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.045,
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromRGBO(237, 231, 243, 1),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                /*  margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1), */
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.bolt_rounded,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            color:
                                                Color.fromRGBO(138, 38, 181, 1),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Text(
                                            "Exercise",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.024,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  138, 38, 181, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.026,
                                      ),
                                      child: Row(
                                        children: [
                                          Text.rich(TextSpan(
                                              text: "24 ",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    138, 38, 181, 1),
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: " min",
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02,
                                                    ))
                                              ]))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.026,
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromARGB(255, 225, 248, 245),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                /*  margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1), */
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.flag,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            color:
                                                Color.fromRGBO(35, 221, 180, 1),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Steps",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.022,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  35, 221, 180, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.026,
                                      ),
                                      child: Row(
                                        children: [
                                          Text.rich(TextSpan(
                                              text: "10 ",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    35, 221, 180, 1),
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: " km",
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02,
                                                    ))
                                              ]))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.045,
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromARGB(255, 225, 248, 245),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                /*  margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1), */
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.waves,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            color:
                                                Color.fromRGBO(9, 104, 212, 1),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            "Stress",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.022,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  9, 104, 212, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.026,
                                      ),
                                      child: Row(
                                        children: [
                                          Text.rich(TextSpan(
                                            text: "Normal",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  9, 104, 212, 1),
                                            ),
                                          ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                /*  Expanded(
              child: Container(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          elevation: 10,
                          color: Color.fromARGB(255, 209, 225, 255),
                          child: Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 14),
                                  child: Text(
                                    "Shoulder 01",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          color: Color.fromARGB(255, 209, 225, 255),
                          child: Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 14),
                                  child: Text(
                                    "Shoulder 01",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: 2,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 30,
                    );
                  },
                ),
              ),
            ), */
              ],
            ),
          ),
        ));
  }
}
