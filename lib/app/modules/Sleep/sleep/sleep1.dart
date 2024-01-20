import 'package:flutter/material.dart';
import 'package:fyp1/app/modules/home/landing.dart';
import '../sleep/Selectpage.dart';
import '../sleep/sleep2.dart';
import 'package:intl/intl.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class Sleep1 extends StatefulWidget {
  const Sleep1({Key? key}) : super(key: key);

  @override
  _Sleep1State createState() => _Sleep1State();
}

class _Sleep1State extends State<Sleep1> {
  String currentTime = '';
  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;
  Time _selectedTime = Time(hour: 0, minute: 0);

  @override
  void initState() {
    super.initState();
    // Initialize the time when the widget is created
    updateTime();
  }

  void updateTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('hh:mm a').format(now);

    setState(() {
      currentTime = formattedTime;
    });

    // Update the time every second
    Future.delayed(Duration(seconds: 1), updateTime);
  }

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  DateTime dateTime = DateTime.now();

  Future<void> _showPopup() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 0, 106, 193),
          actions: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.08),
                color: Colors.white,
              ),
              child: TimePickerSpinner(
                locale: const Locale('en', ''),
                time: dateTime,
                is24HourMode: false,
                isShowSeconds: false,
                itemHeight: 80,
                normalTextStyle: const TextStyle(
                  fontSize: 24,
                ),
                highlightedTextStyle:
                    const TextStyle(fontSize: 24, color: Colors.blue),
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    dateTime = time;
                  });
                },
              ),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ))),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetAlarm(
                                  dateTime: dateTime,
                                )),
                      );
                    },
                    child: Text("Ok",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ))),
              ],
            )

            /* Switch(
              value: iosStyle,
              onChanged: (newVal) {
                setState(() {
                  iosStyle = newVal;
                });
              },
            ) */
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.999999,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(149, 202, 242, 1),
                Color.fromRGBO(99, 182, 255, 1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.17,
                ),
                child: Text(
                  "Good Night",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.03),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                ),
                child: Text(
                  "$currentTime",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 252, 252),
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.04),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Container(
                  alignment: Alignment.centerRight,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'images/SleepingAstronaut.png',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: ElevatedButton(
                  onPressed: () {
                    _showPopup();
                  },
                  child: Text("Start Sleeping"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.2,
                        MediaQuery.of(context).size.height * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.height * 0.05)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.055),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Landing()),
              );
            },
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.055),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => selectpagesleep()),
              );
            },
          ),
        ),
      ]),
    );
  }
}

void main() => runApp(MaterialApp(home: Sleep1()));
