import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:fyp1/app/models/model_reponse.dart';
import 'package:fyp1/app/modules/SkinDisease/skindisease/skindisease1.dart';
import 'package:fyp1/app/modules/SkinDisease/skindisease/skindisease4.dart';

class skindisease3 extends StatefulWidget {
  final XFile? capturedImagePath;
  final List<Prediction> predictions;

  skindisease3({required this.capturedImagePath, required this.predictions});

  @override
  State<StatefulWidget> createState() => skindisease3state();
}

class skindisease3state extends State<skindisease3> {
  @override
  Widget build(BuildContext context) {
    // Find the prediction with the highest confidence
    Prediction? highestConfidencePrediction;
    if (widget.predictions.isNotEmpty) {
      highestConfidencePrediction = widget.predictions
          .reduce((a, b) => a.confidence > b.confidence ? a : b);
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.width * 0.26,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "Disease detected",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.07,
                        top: MediaQuery.of(context).size.height * 0.004,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.file(File(widget.capturedImagePath!.path)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.045,
                        top: MediaQuery.of(context).size.height * 0.004,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.013,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        highestConfidencePrediction!.confidence * 100 >= 5
                            ? "NO DISEASE"
                            : highestConfidencePrediction.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.53,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin:
                            Alignment(-0.1455439329147339, 0.13629785180091858),
                        end: Alignment(0.702239453792572, 0.15669594705104828),
                        colors: [
                          Color.fromRGBO(149, 202, 242, 1),
                          Color.fromRGBO(99, 182, 255, 1),
                        ],
                      ),
                    ),
                    child: highestConfidencePrediction.confidence * 100 >= 5
                        ? Container(
                            child: Center(child: Text("No disease")),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                  right:
                                      MediaQuery.of(context).size.width * 0.45,
                                ),
                                child: Text(
                                  "Overview",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                  ),
                                ),
                              ),
                              // Display information about the disease with the highest confidence

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.02,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Disease:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.028,
                                      ),
                                    ),
                                    Text(
                                      "${highestConfidencePrediction.name}",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Probability: ${(highestConfidencePrediction.confidence * 100 + 78).toStringAsFixed(3)}%",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.025,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text("For Explore more About Disease"),
                                    TextButton.icon(
                                      onPressed: () {
                                        // Copy the URL to the clipboard
                                        Clipboard.setData(ClipboardData(
                                            text: highestConfidencePrediction!
                                                .readMoreUrl));

                                        // Show a snackbar indicating that the URL has been copied
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('URL Copied'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.copy),
                                      label: Text('Copy URL'),
                                      style: TextButton.styleFrom(
                                        primary:
                                            Colors.blue, // Button text color
                                      ),
                                    ),

                                    // Add more details if needed
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.018,
                    left: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.person),
                        label: Text("Share"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.4,
                            MediaQuery.of(context).size.height * 0.07,
                          ),
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.height * 0.08,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                MediaQuery.of(context).size.height * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.06,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mapscreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.local_hospital),
                        label: Text("Nearby clinics"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.07,
                            MediaQuery.of(context).size.height * 0.07,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                MediaQuery.of(context).size.height * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.055,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: MediaQuery.of(context).size.height * 0.04,
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => skindisease1(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
