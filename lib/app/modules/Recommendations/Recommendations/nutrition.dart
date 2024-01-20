import 'package:flutter/material.dart';
import '../Recommendations/selectrecpage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class nutrition extends StatelessWidget {
  const nutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrition Recommendation',
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
                    'Average Nutrition',
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
                            'Nutrition',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 140, top: 20),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 55),
                                    child: Container(
                                      height: 50,
                                      child: Text(
                                        '1689',
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
                                    'consumed',
                                    style: TextStyle(fontSize: 13),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 140, top: 9),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 55),
                                    child: Container(
                                      height: 50,
                                      child: Text(
                                        '302',
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
                                    'Remaining',
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
                    "84.19%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color.fromRGBO(40, 228, 237, 0.612),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 190, top: 206),
                child: Image.asset('images/nutrition.png'),
              )
            ]),
            Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text(
                  'Nutrition Recommendation',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(right: 80),
                child: Text(
                  ' according to your Report',
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
                      DietTipsContainer(
                        text:
                            'Include a variety of colorful fruits and vegetables in your diet.',
                      ),
                      SizedBox(height: 8),
                      DietTipsContainer(
                        text:
                            'Choose whole grains over refined grains for added nutrients.',
                      ),
                      SizedBox(height: 8),
                      DietTipsContainer(
                        text:
                            'Incorporate lean proteins such as poultry, fish, and legumes.',
                      ),
                      SizedBox(height: 8),
                      DietTipsContainer(
                        text:
                            'Limit added sugars and opt for natural sweeteners in moderation.',
                      ),
                      SizedBox(height: 8),
                      DietTipsContainer(
                        text:
                            'Stay hydrated by drinking an adequate amount of water throughout the day.',
                      ),
                      SizedBox(height: 8),
                      DietTipsContainer(
                        text:
                            'Moderate your salt intake for better heart health.',
                      ),
                      SizedBox(height: 8),
                      DietTipsContainer(
                        text:
                            'Include healthy fats from sources like avocados, nuts, and olive oil.',
                      ),
                      SizedBox(height: 8),
                      DietTipsContainer(
                        text: 'Practice portion control to avoid overeating.',
                      ),
                      SizedBox(height: 8),
                      DietTipsContainer(
                        text:
                            'Plan and prepare meals ahead of time to make healthier choices.',
                      ),
                    ],
                  )),
                ))
          ]),
        ));
  }
}

class DietTipsContainer extends StatelessWidget {
  final String text;

  DietTipsContainer({required this.text});

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
