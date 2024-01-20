import 'dart:async';

import 'package:flutter/material.dart';
import '../onboardingscreens/onboardingscreen.dart';

class logo extends StatelessWidget {
  const logo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: logostate(title: ''),
    );
  }
}

class logostate extends StatefulWidget {
  const logostate({super.key, required this.title});

  final String title;

  @override
  State<logostate> createState() => _logoState();
}

class _logoState extends State<logostate> {
  void initState() {
    super.initState();
    // Call the function to navigate after 3 seconds
    _navigateToNextPage();
  }

  // Function to navigate to the next page after 3 seconds
  void _navigateToNextPage() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => onboarding(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(159, 209, 246, 100),
              Color.fromRGBO(43, 105, 163, 1)
            ],
          ),
        ),
        child: Center(
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
