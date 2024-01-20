import 'package:flutter/material.dart';
import '../Recommendations/selectrecpage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class heartrate extends StatelessWidget {
  const heartrate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Heart Rate Recommendation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => selectpagerec()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Padding(
                  padding: EdgeInsets.only(left: 19),
                  child: Text(
                    'Average Heart Rate',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 23, left: 127),
                  child: Text(
                    'Report',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(63, 90, 158, 100)),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 50),
                child: Container(
                    height: 307,
                    width: 372,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(159, 209, 246, 100),
                              Color.fromRGBO(10, 109, 203, 30)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 15),
                          child: Text(
                            'Heart Rate',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 125, top: 60),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 55),
                                    child: Container(
                                      height: 50,
                                      child: Text(
                                        '80',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'bpm',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: 33,
                                  left: 60,
                                  child: Text(
                                    'avg heart rate',
                                    style: TextStyle(fontSize: 13),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 33, top: 125),
                child: new CircularPercentIndicator(
                  radius: 70.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.7,
                  center: new Text(
                    "82.09%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color.fromRGBO(40, 228, 237, 0.612),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 230, top: 182),
                child: Image.asset('images/heartrate.png'),
              )
            ]),
            Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  'Heart Rate Recommendation',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 268,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      HeartRateContainer(
                        text:
                            'Aim for a target heart rate during cardio exercises.',
                      ),
                      SizedBox(height: 8),
                      HeartRateContainer(
                        text:
                            'Monitor your resting heart rate regularly for fitness assessment.',
                      ),
                      SizedBox(height: 8),
                      HeartRateContainer(
                        text:
                            'Incorporate aerobic exercises like brisk walking or running.',
                      ),
                      SizedBox(height: 8),
                      HeartRateContainer(
                        text:
                            'Include strength training to improve overall cardiovascular health.',
                      ),
                      SizedBox(height: 8),
                      HeartRateContainer(
                        text:
                            'Avoid excessive consumption of caffeine and stimulants.',
                      ),
                      SizedBox(height: 8),
                      HeartRateContainer(
                        text:
                            'Maintain a healthy weight to reduce strain on your heart.',
                      ),
                      SizedBox(height: 8),
                      HeartRateContainer(
                        text:
                            'Practice relaxation techniques to manage stress and lower heart rate.',
                      ),
                      SizedBox(height: 8),
                      HeartRateContainer(
                        text: 'Ensure adequate sleep for optimal heart health.',
                      ),
                      SizedBox(height: 8),
                      HeartRateContainer(
                        text:
                            'Consult your doctor for personalized heart rate guidelines.',
                      ),
                    ],
                  )),
                ))
          ]),
        ));
  }
}

class HeartRateContainer extends StatelessWidget {
  final String text;

  HeartRateContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromRGBO(131, 159, 228, 0.843),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
