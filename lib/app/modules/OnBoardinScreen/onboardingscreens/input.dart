import 'package:flutter/material.dart';
import 'package:fyp1/app/modules/Auth/widgets/startingscreens/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Input extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String name = '';
  double age = 0;
  bool isMale = false;
  bool isFemale = false;
  double height = 0;
  double weight = 0;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9999999999,
          height: MediaQuery.of(context).size.height * 0.99999999999,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-0.1455439329147339, 0.13629785180091858),
                end: Alignment(0.702239453792572, 0.15669594705104828),
                colors: [
                  Color.fromRGBO(149, 202, 242, 1),
                  Color.fromRGBO(99, 182, 255, 1)
                ]),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                                MediaQuery.of(context).size.height *
                                    0.02), // Set your desired top radius
                            bottom: Radius.circular(
                                MediaQuery.of(context).size.height *
                                    0.02), // Set your desired bottom radius
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.004,
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelStyle: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  'Age: ${age.toInt()}',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Slider(
                  value: age,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: age.toInt().toString(),
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Gender',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                CheckboxListTile(
                  title: Text(
                    'Male',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  value: isMale,
                  onChanged: (value) {
                    setState(() {
                      isMale = value!;
                      isFemale = !value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(
                    'Female',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  value: isFemale,
                  onChanged: (value) {
                    setState(() {
                      isFemale = value!;
                      isMale = !value;
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  "Height (cm)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                              MediaQuery.of(context).size.height *
                                  0.02), // Set your desired top radius
                          bottom: Radius.circular(
                              MediaQuery.of(context).size.height *
                                  0.02), // Set your desired bottom radius
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.002),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        height = double.parse(value);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  'Weight (kg)',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                              MediaQuery.of(context).size.height *
                                  0.02), // Set your desired top radius
                          bottom: Radius.circular(
                              MediaQuery.of(context).size.height *
                                  0.02), // Set your desired bottom radius
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.002),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        weight = double.parse(value);
                        // Calculate BMI
                        bmi = weight / ((height / 100) * (height / 100));
                      });
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.36),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Do something with the collected data, e.g., send it to a server
                      final SharedPreferences isLoggedIn =
                          await SharedPreferences.getInstance();
                      await isLoggedIn.setBool('onboarding', true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signin()),
                      );
                      print('Name: $name');
                      print('Age: $age');
                      print('Gender: ${isMale ? 'Male' : 'Female'}');
                      print('Height: $height cm');
                      print('Weight: $weight kg');
                      print('BMI: $bmi');
                    },
                    child: Text('Submit',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
