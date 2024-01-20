import 'package:flutter/material.dart';
import 'package:fyp1/app/modules/home/landing.dart';
import '../Recommendations/excercise.dart';
import '../Recommendations/mentalhealth.dart';
import '../Recommendations/nutrition.dart';

class selectpagerec extends StatelessWidget {
  const selectpagerec({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const selectpagerecstate(title: ''),
    );
  }
}

class selectpagerecstate extends StatefulWidget {
  const selectpagerecstate({super.key, required this.title});

  final String title;

  @override
  State<selectpagerecstate> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<selectpagerecstate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Landing()),
              );
            },
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => exercise()),
                      );
                      ;
                    },
                    child: Container(
                      height: 175,
                      width: 370,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(224, 114, 183, 243),
                            Color.fromRGBO(0, 106, 206, 100)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Center(
                          child: Text(
                        'Excercise/Health Tips',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 27),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 40),
                  child: Container(
                    height: 76,
                    width: 76,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(63, 90, 158, 1)),
                    child: Center(
                        child: Text(
                      '1',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mentalhealth()),
                      );
                    },
                    child: Container(
                      height: 175,
                      width: 370,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(224, 114, 183, 243),
                            Color.fromRGBO(0, 106, 206, 100)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Center(
                          child: Text(
                        'Mental Health Tips',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 27),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 40),
                  child: Container(
                    height: 76,
                    width: 76,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(63, 90, 158, 1)),
                    child: Center(
                        child: Text(
                      '2',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => nutrition()),
                      );
                      ;
                    },
                    child: Container(
                      height: 175,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(224, 114, 183, 243),
                            Color.fromRGBO(0, 106, 206, 100)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                          child: Text(
                        'Diet Tips',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 27),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 40),
                  child: Container(
                    height: 76,
                    width: 76,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(63, 90, 158, 1)),
                    child: Center(
                        child: Text(
                      '3',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.white),
                    )),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
