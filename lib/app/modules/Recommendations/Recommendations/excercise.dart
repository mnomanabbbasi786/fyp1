import 'package:flutter/material.dart';
import '../Recommendations/selectrecpage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class exercise extends StatelessWidget {
  const exercise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise Recommendation',
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
                    'Average Exercise',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 23, left: 115),
                  child: Text(
                    'Report',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(63, 90, 158, 100)),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 50),
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
                            'Exercise',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 130, top: 70),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 55),
                                    child: Container(
                                      height: 50,
                                      child: Text(
                                        '350',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'kcal',
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
                                    'Burned',
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
                    "65.02%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color.fromRGBO(40, 228, 237, 0.612),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 170, top: 162),
                child: Image.asset('images/exercise.png'),
              )
            ]),
            Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text(
                  'Exercise Recommendation',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 340,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      HealthContainer(
                        text: 'Drink plenty of water to stay hydrated.',
                      ),
                      SizedBox(height: 8),
                      HealthContainer(
                        text:
                            'Get at least 7-8 hours of quality sleep each night.',
                      ),
                      SizedBox(height: 8),
                      HealthContainer(
                        text:
                            'Eat a balanced diet with a variety of fruits and vegetables.',
                      ),
                      SizedBox(height: 8),
                      HealthContainer(
                        text:
                            'Engage in regular physical activity to keep your body active.',
                      ),
                      SizedBox(height: 8),
                      HealthContainer(
                        text:
                            'Practice mindfulness and stress-reducing activities.',
                      ),
                      SizedBox(height: 8),
                      HealthContainer(
                        text:
                            'Limit processed foods and prioritize whole, nutrient-rich foods.',
                      ),
                      SizedBox(height: 8),
                      HealthContainer(
                        text:
                            'Take breaks and stretch if you spend extended time sitting.',
                      ),
                      SizedBox(height: 8),
                      HealthContainer(
                        text:
                            'Maintain social connections for emotional well-being.',
                      ),
                      SizedBox(height: 8),
                      HealthContainer(
                        text:
                            'Schedule regular health check-ups with your healthcare provider.',
                      ),
                    ],
                  )),
                ))
          ]),
        ));
  }
}

class HealthContainer extends StatelessWidget {
  final String text;

  HealthContainer({required this.text});

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
