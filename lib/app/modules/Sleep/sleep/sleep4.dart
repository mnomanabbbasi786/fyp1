import 'package:flutter/material.dart';
import '../sleep/Selectpage.dart';

import 'monthbar.dart';
import 'weekbar.dart';

class Sleep4 extends StatefulWidget {
  const Sleep4({Key? key}) : super(key: key);

  @override
  Sleep4State createState() => Sleep4State();
}

class Sleep4State extends State<Sleep4> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        /*
         To change height of app bar do this:

         appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
            child: AppBar(.......),
         ),
         */
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200.0),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.055),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.height * 0.04,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => selectpagesleep()),
                    );
                  },
                ),
              ),
              AppBar(
                backgroundColor: const Color.fromRGBO(149, 202, 242, 1),
                elevation: 0,
                //title: const Text("Statistics"),
                centerTitle: true,
                bottom: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Creates border
                    color: Colors.black,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      child: Text(
                        "Week",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 63, 10, 142),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.023),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Month",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 95, 17, 213),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.023),
                      ),
                    )
                  ],
                ),
              ),
              const Center(
                child: Text(
                  'Statistics',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.999999,
                  width: MediaQuery.of(context).size.height * 0.999999,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin:
                          Alignment(-0.1455439329147339, 0.13629785180091858),
                      end: Alignment(0.702239453792572, 0.15669594705104828),
                      colors: [
                        Color.fromRGBO(149, 202, 242, 1),
                        Color.fromRGBO(99, 182, 255, 1),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Color.fromRGBO(116, 214, 250, 0.965),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.16,
                              /*  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.1), */
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          color: Color.fromRGBO(72, 7, 169, 1),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        Text(
                                          "Average",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.022,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(28, 160, 181, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                      children: [
                                        Text(
                                          "8h",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(28, 160, 181, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Color.fromRGBO(250, 145, 163, 0.965),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.16,
                              /*  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.1), */
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.sunny,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          color: Color.fromRGBO(210, 31, 85, 1),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        Text(
                                          "Max",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.022,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(210, 31, 85, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                      children: [
                                        Text(
                                          "10h",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(210, 31, 85, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment(
                                0.13629785180091858, -0.1455439329147339),
                            end: Alignment(
                                0.15669594705104828, 0.702239453792572),
                            colors: [
                              Color.fromRGBO(31, 158, 255, 1),
                              Colors.black,
                            ],
                          ),
                        ),
                        child: BarChartSample3(),
                      )
                    ],
                  )),
            ),
            SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.999999,
                  width: MediaQuery.of(context).size.height * 0.999999,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin:
                          Alignment(-0.1455439329147339, 0.13629785180091858),
                      end: Alignment(0.702239453792572, 0.15669594705104828),
                      colors: [
                        Color.fromRGBO(149, 202, 242, 1),
                        Color.fromRGBO(99, 182, 255, 1),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Color.fromRGBO(116, 214, 250, 0.965),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.16,
                              /*  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.1), */
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          color: Color.fromRGBO(72, 7, 169, 1),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        Text(
                                          "Average",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.022,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(28, 160, 181, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                      children: [
                                        Text(
                                          "8h",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(28, 160, 181, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Color.fromRGBO(250, 145, 163, 0.965),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.16,
                              /*  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.1), */
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.sunny,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          color: Color.fromRGBO(210, 31, 85, 1),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        Text(
                                          "Max",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.022,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(210, 31, 85, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                      children: [
                                        Text(
                                          "10h",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(210, 31, 85, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.98,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment(
                                0.13629785180091858, -0.1455439329147339),
                            end: Alignment(
                                0.15669594705104828, 0.702239453792572),
                            colors: [
                              Color.fromRGBO(31, 158, 255, 1),
                              Colors.black,
                            ],
                          ),
                        ),
                        child: BarChartSampleMonth3(),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
