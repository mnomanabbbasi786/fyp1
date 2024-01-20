import 'package:flutter/material.dart';
import '../Recommendations/selectrecpage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class mentalhealth extends StatelessWidget {
  const mentalhealth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mental Health Recommendation',
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
                    'Average Mental Health',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 23, left: 157),
                  child: Text(
                    'Report',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(63, 90, 158, 100)),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 50),
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
                            'Mental Health',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 130, top: 30),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 55),
                                    child: Container(
                                      height: 50,
                                      child: Text(
                                        'More Self love &',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: 20,
                                  left: 56,
                                  child: Text(
                                    'Fulfilment',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
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
                    "88.05%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color.fromRGBO(40, 228, 237, 0.612),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 195, top: 175),
                child: Image.asset('images/mentalhealth.png'),
              )
            ]),
            Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'Mental Health Recommendation',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(right: 100),
                child: Text(
                  ' according to your Report',
                  style: TextStyle(
                    fontSize: 23,
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
                        MentalHealthContainer(
                          text:
                              'Practice mindfulness and meditation for mental clarity.',
                        ),
                        SizedBox(height: 8),
                        MentalHealthContainer(
                          text:
                              'Engage in activities that bring you joy and relaxation.',
                        ),
                        SizedBox(height: 8),
                        MentalHealthContainer(
                          text:
                              'Connect with friends and family for emotional support.',
                        ),
                        SizedBox(height: 8),
                        MentalHealthContainer(
                          text:
                              'Set realistic goals and celebrate small achievements.',
                        ),
                        SizedBox(height: 8),
                        MentalHealthContainer(
                          text:
                              'Prioritize self-care, including adequate sleep and nutrition.',
                        ),
                        SizedBox(height: 8),
                        MentalHealthContainer(
                          text:
                              'Limit exposure to negative news and social media.',
                        ),
                        SizedBox(height: 8),
                        MentalHealthContainer(
                          text:
                              'Seek professional help if your experiencing mental health challenges.',
                        ),
                        SizedBox(height: 8),
                        MentalHealthContainer(
                          text:
                              'Engage in hobbies or activities that bring a sense of purpose.',
                        ),
                        SizedBox(height: 8),
                        MentalHealthContainer(
                          text:
                              'Practice gratitude to foster a positive mindset.',
                        ),
                      ],
                    ),
                  ),
                ))
          ]),
        ));
  }
}

class MentalHealthContainer extends StatelessWidget {
  final String text;

  MentalHealthContainer({required this.text});

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
