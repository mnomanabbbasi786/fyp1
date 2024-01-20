import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fyp1/app/models/model_reponse.dart';
import 'package:fyp1/app/modules/SkinDisease/skindisease/skindisease3.dart';
import 'package:image_picker/image_picker.dart';
import '../../home/landing.dart';
import 'skindisease2.dart';

class skindisease1 extends StatefulWidget {
  skindisease1({super.key});

  @override
  State<skindisease1> createState() => _skindisease1State();
}

class _skindisease1State extends State<skindisease1> {
  final API_URL = "https://autoderm.ai/v1/query";
  final API_KEY =
      "cc4ba97e-5dda-69ea-ca23-39d4e392efe1"; // Replace with your actual API key

  File? _imageFile;
  final picker = ImagePicker();
  Dio dio = Dio();

  void _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });

    if (_imageFile != null) {
      _sendQuery(pickedFile);
    }
  }

  void _sendQuery(XFile? imageFile) async {
    try {
      // Show circular progress indicator while waiting for the response
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(_imageFile!.path,
            filename: "skin.jpg"),
      });

      final response = await dio.post(
        API_URL,
        options: Options(
          headers: {"Api-Key": API_KEY},
          contentType: Headers.jsonContentType,
        ),
        data: formData,
        queryParameters: {"language": "en", "model": "autoderm_v2_0"},
      );

      final data = response.data;
      print(data);

      // Close the progress indicator
      Navigator.pop(context);

      // Parse the response data into SkinConditionPrediction
      final skinConditionPrediction = SkinConditionPrediction.fromJson(data);
      print(imageFile);
      print(skinConditionPrediction.predictions);
      // Navigate to the next screen and pass the prediction
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => skindisease3(
              predictions: skinConditionPrediction.predictions,
              capturedImagePath: imageFile),
        ),
      );
    } catch (e) {
      // Close the progress indicator
      Navigator.pop(context);

      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(children: [
            // First container
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                  left: MediaQuery.of(context).size.width * 0.03),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.21,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.08),
                        gradient: LinearGradient(
                            begin: Alignment(
                                -0.1455439329147339, 0.13629785180091858),
                            end: Alignment(
                                0.702239453792572, 0.15669594705104828),
                            colors: [
                              Color.fromRGBO(149, 202, 242, 1),
                              Color.fromRGBO(99, 182, 255, 1)
                            ]),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05),
                        child: Column(children: [
                          Text(
                            "Scan",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text.rich(TextSpan(
                                text: " Scan the suspected area of \n",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: "                  your body",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ))
                                ])),
                          )
                        ]),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 57, 48, 222),
                    radius: 25,
                    child: Text(
                      "1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                  ),
                ),
              ]),
            ),
            // Second Container
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.width * 0.03),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.21,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.08),
                        gradient: LinearGradient(
                            begin: Alignment(
                                -0.1455439329147339, 0.13629785180091858),
                            end: Alignment(
                                0.702239453792572, 0.15669594705104828),
                            colors: [
                              Color.fromRGBO(149, 202, 242, 1),
                              Color.fromRGBO(99, 182, 255, 1)
                            ]),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05),
                        child: Column(children: [
                          Text(
                            "Result",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text.rich(TextSpan(
                                text: " Get the disease detected \n",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: "         within seconds",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ))
                                ])),
                          )
                        ]),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 57, 48, 222),
                    radius: 25,
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                  ),
                ),
              ]),
            ),
            // third container
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.width * 0.03),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.21,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.08),
                        gradient: LinearGradient(
                            begin: Alignment(
                                -0.1455439329147339, 0.13629785180091858),
                            end: Alignment(
                                0.702239453792572, 0.15669594705104828),
                            colors: [
                              Color.fromRGBO(149, 202, 242, 1),
                              Color.fromRGBO(99, 182, 255, 1)
                            ]),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05),
                        child: Column(children: [
                          Text(
                            "Share",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text.rich(TextSpan(
                                text: " Share your result with your doctor \n",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          "         or nearby skin specialist",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ))
                                ])),
                          )
                        ]),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 57, 48, 222),
                    radius: 25,
                    child: Text(
                      "3",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                  ),
                ),
              ]),
            ),
            // button
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final cameras = await availableCameras();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CameraScreen(cameras: cameras)),
                      );
                    },
                    icon: Icon(
                        Icons.image_search), //icon data for elevated button
                    label: Text("Start Scan"), //label text
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.height * 0.07),
                      /* padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height * 0.01), */
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.height * 0.05)),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                  ElevatedButton.icon(
                    onPressed: () {
                      _getImage();
                    },
                    icon: Icon(Icons.image), //icon data for elevated button
                    label: Text("From Gallery"), //label text
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.height * 0.07),
                      /* padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height * 0.01), */
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.height * 0.05)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
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
        ],
      ),
    ));
  }
}
