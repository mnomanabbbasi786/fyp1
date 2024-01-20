import 'package:flutter/material.dart';
import '../skindisease/skindisease4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: skindisease5(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 224, 217, 217)),
    );
  }
}

class skindisease5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.008,
                  top: MediaQuery.of(context).size.height * 0.09,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: MediaQuery.of(context).size.height * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.05,
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
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.05,
                    ),
                    child: Image.asset(
                      'images/clinic.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      size: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(
                      "Location",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.027,
                          color: Color.fromARGB(255, 99, 99, 99),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06,
                    top: MediaQuery.of(context).size.height * 0.015),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_alarm_sharp,
                      size: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.012,
                    ),
                    Text(
                      "Mon - Fri 10 AM - 4 PM",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.027,
                          color: Color.fromARGB(255, 99, 99, 99),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06,
                    top: MediaQuery.of(context).size.height * 0.015),
                child: Row(
                  children: [
                    Icon(
                      Icons.call,
                      size: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.012,
                    ),
                    Text(
                      "0308-1815182",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.027,
                          color: Color.fromARGB(255, 99, 99, 99),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.005),
                child: Divider(
                  // This is the Divider widget
                  color: Color.fromARGB(
                      255, 203, 199, 199), // Customize the color of the line
                  thickness: 2, // Customize the thickness of the line
                  indent: 20, // Customize the starting indentation of the line
                  endIndent: 29, // Customize the ending indentation of the line
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.01),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          begin: Alignment(
                              -0.1455439329147339, 0.13629785180091858),
                          end:
                              Alignment(0.702239453792572, 0.15669594705104828),
                          colors: [
                            Color.fromRGBO(45, 123, 191, 1),
                            Color.fromRGBO(149, 202, 242, 1),
                          ],
                        ).createShader(Rect.fromLTWH(0, 0, 200,
                            100)), // Adjust width and height as needed
                    ),
                    children: [
                      TextSpan(text: 'Diagnosis and treatments'),
                    ],
                  ),
                ),
              ),
              /* Add your list

              of treatments

               here nomi don 
               
               */
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mapscreen()),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
