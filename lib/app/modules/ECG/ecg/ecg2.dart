import 'package:flutter/material.dart';
import '../ecg/ecg1.dart';

class ecg2 extends StatefulWidget {
  const ecg2({super.key});

  @override
  MyAppstate createState() => MyAppstate();
}

class MyAppstate extends State<ecg2> {
  List<String> items = [
    '12:00 AM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM'
  ];
  List<String> itemsbpm = ['80bpm', '160bpm', '90bpm', '110bpm', '103bpm'];
  final List<Color> tileColors = [
    Color.fromARGB(255, 251, 205, 255),
    Color.fromARGB(255, 194, 203, 255),
    Color.fromARGB(255, 198, 255, 242),
    Color.fromARGB(255, 248, 194, 181),
    Color.fromARGB(255, 250, 253, 205),
    // Add more colors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.023,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.4,
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
                    begin: Alignment(-0.1455439329147339, 0.13629785180091858),
                    end: Alignment(0.702239453792572, 0.15669594705104828),
                    colors: [
                      Color.fromRGBO(149, 202, 242, 1),
                      Color.fromRGBO(99, 182, 255, 1)
                    ]),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.07),
                child: Column(
                  children: [
                    Text(
                      "1st July",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      "All day ECG measurement",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.24),
                      child: Text(
                        "Results!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.03),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.27,
                left: MediaQuery.of(context).size.width * 0.06),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.06,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0)
                          .withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // How much the shadow spreads
                      blurRadius: 1, // How blurry the shadow is
                      offset: Offset(0, 3), // Offset in the (x, y) direction
                    ),
                  ],
                  color: Colors.white),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  Color backgroundColor = tileColors[index % tileColors.length];
                  Color textColor = index % 2 == 0
                      ? Color.fromARGB(255, 5, 62, 109)
                      : Color.fromARGB(255, 116, 3, 191);

                  return Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.1,
                      color: backgroundColor,
                      child: Row(children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        Text(
                          items[index],
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.bold,
                              color: textColor),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.18),
                        Text("ECG",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.bold,
                                color: textColor.withBlue(110))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        Text(itemsbpm[index],
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.bold,
                                color: backgroundColor.withGreen(1))),
                      ]),
                    ),
                  );
                },
              ),
            ),
          ),
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
                  MaterialPageRoute(builder: (context) => ecg1()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
