import 'package:flutter/material.dart';
import 'package:fyp1/app/modules/ECG/ecg/ecg2.dart';
import 'package:fyp1/app/modules/ECG/ecg/wave.dart';
import 'package:fyp1/app/modules/home/landing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import 'utils.dart';

class ecg1 extends StatefulWidget {
  const ecg1({super.key});

  @override
  MyAppstate createState() => MyAppstate();
}

class MyAppstate extends State<ecg1> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  User? currentUser;

  @override
  void initState() {
    fetchCurrentUser();
    super.initState();
    // Fetch the current user information asynchronously in initState
  }

  Future<void> fetchCurrentUser() async {
    currentUser = Supabase.instance.client.auth.currentUser!;

    // Force a rebuild of the widget tree after fetching user information
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.001,
                ),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.27,
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
                          begin: Alignment(
                              -0.1455439329147339, 0.13629785180091858),
                          end:
                              Alignment(0.702239453792572, 0.15669594705104828),
                          colors: [
                            Color.fromRGBO(149, 202, 242, 1),
                            Color.fromRGBO(99, 182, 255, 1)
                          ]),
                    ),
                    child: Stack(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.08,
                            left: MediaQuery.of(context).size.width * 0.03,
                          ),
                          //bottom: MediaQuery.of(context).size.height * 0.02,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 45,
                            child: Icon(
                              Icons.person,
                              size: MediaQuery.of(context).size.height * 0.1,
                              color: Colors.white,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.15,
                              top: MediaQuery.of(context).size.height * 0.06),
                          child: Text.rich(TextSpan(
                              text: '${currentUser!.email}\n',
                              style: TextStyle(
                                color: Color.fromRGBO(11, 11, 11, 1),
                                fontFamily: 'Inter',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                height:
                                    MediaQuery.of(context).size.height * 0.002,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Your ECG record\n',
                                    style: TextStyle(
                                      color: Color.fromRGBO(11, 11, 11, 1),
                                      fontFamily: 'Inter',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]))),
                      Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.1,
                              top: MediaQuery.of(context).size.height * 0.217),
                          child: Text(
                            "Age :24",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ])),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.7,
                    top: MediaQuery.of(context).size.height * 0.015),
                child: Text(
                  "Recent",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              //////
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.12,
                    left: MediaQuery.of(context).size.width * 0),
                child: LineChartSample2(),
              ),
              TableCalendar(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  // Use `selectedDayPredicate` to determine which day is currently selected.
                  // If this returns true, then `day` will be marked as selected.

                  // Using `isSameDay` is recommended to disregard
                  // the time-part of compared DateTime objects.
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ecg2()),
                      );
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
              ),

              ///
            ],
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
                  MaterialPageRoute(builder: (context) => Landing()),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
