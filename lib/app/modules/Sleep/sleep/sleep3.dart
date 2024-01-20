import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../sleep/Selectpage.dart';
import '../sleep/wavesleep.dart';

class Sleep3 extends StatefulWidget {
  const Sleep3({Key? key}) : super(key: key);

  @override
  _Sleep3State createState() => _Sleep3State();
}

DateTime currentDate = DateTime.now();

// Format the date as a string
String formattedDate =
    "${currentDate.day}/${currentDate.month}/${currentDate.year}";

class _Sleep3State extends State<Sleep3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.999999,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.1455439329147339, 0.13629785180091858),
              end: Alignment(0.702239453792572, 0.15669594705104828),
              colors: [
                Color.fromRGBO(149, 202, 242, 1),
                Color.fromRGBO(99, 182, 255, 1),
              ],
            ),
          ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child: RichText(
                    text: TextSpan(
                      // style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sleep Report\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03),
                        ),
                        TextSpan(
                          text: 'Quality report of your sleep',
                          style: TextStyle(
                              //fontStyle: FontStyle.italic,
                              color: const Color.fromARGB(255, 251, 251, 251),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.height * 0.01),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.height * 0.06),
                        bottomLeft: Radius.circular(
                            MediaQuery.of(context).size.height * 0.06),
                        bottomRight: Radius.circular(
                            MediaQuery.of(context).size.height * 0.06),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment(
                              -0.1455439329147339, 0.13629785180091858),
                          end:
                              Alignment(0.702239453792572, 0.15669594705104828),
                          colors: [
                            Color.fromRGBO(223, 238, 249, 1),
                            Color.fromRGBO(205, 214, 223, 1),
                          ]),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.03,
                              top: MediaQuery.of(context).size.height * 0.03),
                          child: RichText(
                            text: TextSpan(
                              // style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '80\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                ),
                                TextSpan(
                                  text: 'Sleep Score\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                ),
                                TextSpan(
                                  text: formattedDate,
                                  style: TextStyle(
                                      //fontStyle: FontStyle.italic,
                                      color: Color.fromARGB(121, 72, 64, 64),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.17,
                            left: MediaQuery.of(context).size.width * 0.06,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Night Sleep",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 1, 81, 147),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Icon(
                                CupertinoIcons.moon_stars,
                                color: Color.fromARGB(255, 1, 81, 147),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.22,
                          ),
                          child: LineChartSample3(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.42,
                              left: MediaQuery.of(context).size.width * 0.08),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  // style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Sleep Time ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ),
                                    TextSpan(
                                      text: '22:00',
                                      style: TextStyle(
                                          //fontStyle: FontStyle.italic,
                                          color:
                                              Color.fromARGB(255, 40, 33, 243),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              RichText(
                                text: TextSpan(
                                  // style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'WakeUp Time  ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ),
                                    TextSpan(
                                      text: '06:00',
                                      style: TextStyle(
                                          //fontStyle: FontStyle.italic,
                                          color:
                                              Color.fromARGB(255, 40, 33, 243),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.22,
                          ),
                          child: LineChartSample3(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.46,
                              left: MediaQuery.of(context).size.width * 0.22),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  // style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Sleep Duration ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ),
                                    TextSpan(
                                      text: '7hour 30min',
                                      style: TextStyle(
                                          //fontStyle: FontStyle.italic,
                                          color:
                                              Color.fromARGB(255, 40, 33, 243),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.26,
                              top: MediaQuery.of(context).size.height * 0.03),
                          child: ratingbox(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ratingbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ratingboxstate();
  }
}

class ratingboxstate extends State<StatefulWidget> {
  int rating = 0;
  setratingstateasone() {
    setState(() {
      if (rating == 0) {
        rating = 1;
      } else {
        rating = 0;
      }
    });
  }

  setratingstateastwo() {
    setState(() {
      rating = 2;
    });
  }

  setratingstateasthree() {
    setState(() {
      rating = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
              child: IconButton(
                  onPressed: () {
                    setratingstateasone();
                  },
                  icon: Icon(
                    rating >= 1 ? Icons.star : Icons.star_border,
                    color: Color.fromARGB(255, 62, 2, 145),
                    size: MediaQuery.of(context).size.height * 0.035,
                  ))),
          Container(
            child: IconButton(
                onPressed: () {
                  setratingstateastwo();
                },
                icon: Icon(
                  rating >= 2 ? Icons.star : Icons.star_border,
                  color: Color.fromARGB(255, 62, 2, 145),
                  size: MediaQuery.of(context).size.height * 0.035,
                )),
          ),
          Container(
              child: IconButton(
                  onPressed: () {
                    setratingstateasthree();
                  },
                  icon: Icon(
                    rating >= 3 ? Icons.star : Icons.star_border,
                    color: Color.fromARGB(255, 62, 2, 145),
                    size: MediaQuery.of(context).size.height * 0.035,
                  ))),
        ],
      ),
    );
  }
}
