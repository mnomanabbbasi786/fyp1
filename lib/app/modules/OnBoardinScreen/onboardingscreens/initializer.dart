import 'package:flutter/material.dart';
import 'package:fyp1/app/modules/home/landing.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'logoscreen.dart';

class initializer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppLauncher(),
    );
  }
}

class AppLauncher extends StatefulWidget {
  @override
  _AppLauncherState createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {
  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      // Navigate to the pages you want to show only on the first launch
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const logo()),
      );
      // Set the flag to false to indicate that the app has been launched
      prefs.setBool('isFirstLaunch', false);
    } else {
      // Navigate to the main page or home page
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Landing()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
