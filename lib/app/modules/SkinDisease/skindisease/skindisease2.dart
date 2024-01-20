import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../skindisease/skindisease1.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraScreen({super.key, required this.cameras});
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late XFile _capturedImage;
  @override
  void initState() {
    _initializeCamera(widget.cameras);
    super.initState();
  }

  Future<void> _initializeCamera(List<CameraDescription> cameras) async {
    //final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;

      // Ensure the controller is initialized before calling takePicture
      if (!_controller.value.isInitialized) {
        return;
      }

      // Open a file picker to let the user choose the save location
      final XFile? pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        return; // User canceled the file picking
      }

      // Take the picture and save it to the picked file
      await _controller.takePicture();

      // Update the _capturedImage variable with the captured image
      setState(() {
        _capturedImage = pickedFile;
      });

      // Perform any additional actions with the captured image if needed
    } catch (e) {
      print("Error capturing image: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => skindisease1()),
              );
            }),
        backgroundColor: const Color.fromARGB(255, 110, 148, 213),
        title: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.06),
          child: Text(
            'Scan the area',
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.17, // Adjust position as needed
            left: MediaQuery.of(context).size.width *
                0.1, // Adjust position as needed
            right: MediaQuery.of(context).size.height *
                0.06, // Adjust position as needed
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.3, // Adjust size as needed
              width: MediaQuery.of(context).size.width * 0.05,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.23,
          bottom: MediaQuery.of(context).size.height * 0.1,
        ),
        child: ElevatedButton.icon(
          onLongPress: () {},
          onPressed: () async {
            print(_capturedImage.path);
          },
          icon: Icon(Icons.image_search), //icon data for elevated button
          label: Text(
            "Start Scan",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.025,
            ),
          ), //label text
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 4, 60, 106),
            minimumSize: Size(MediaQuery.of(context).size.width * 0.5,
                MediaQuery.of(context).size.height * 0.08),
            /* padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.01), */
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.height * 0.05)),
            ),
          ),
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            // Handle the captured image here
          } catch (e) {
            print("Error capturing image: $e");
          }
        },
        child: Icon(Icons.camera),
      ), */
    );
  }
}
