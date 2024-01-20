import 'package:flutter/material.dart';
import 'package:fyp1/app/modules/SkinDisease/skindisease/skindisease5.dart';
import 'package:fyp1/app/modules/home/landing.dart';
//import 'package:googleMapscreens_flutter/googleMapscreens_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mapscreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

class Mapscreen extends StatefulWidget {
  @override
  _MapscreenState createState() => _MapscreenState();
}

class _MapscreenState extends State<Mapscreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431279),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;
  Marker _origin = Marker(markerId: MarkerId(''));
  Marker _dest = Marker(markerId: MarkerId(''));

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: {
            if (_origin.markerId.value != '') _origin,
            if (_dest.markerId.value != '') _dest
          },
          onLongPress: _addmarker,
        ),
        ////////////
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.63,
              left: MediaQuery.of(context).size.width * 0.03),
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: MediaQuery.of(context).size.height * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.04),
                    gradient: LinearGradient(
                        begin:
                            Alignment(-0.1455439329147339, 0.13629785180091858),
                        end: Alignment(0.702239453792572, 0.15669594705104828),
                        colors: [
                          Color.fromRGBO(110, 184, 241, 1),
                          Color.fromRGBO(64, 141, 208, 1)
                        ]),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        //right: MediaQuery.of(context).size.height * 0.27,
                        top: MediaQuery.of(context).size.height * 0.06),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.56),
                        child: TextButton(
                          child: Text(
                            "Clinic Name",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.028),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => skindisease5()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.009),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              size: MediaQuery.of(context).size.height * 0.05,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Text(
                              "Location",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  color: Color.fromARGB(255, 65, 64, 64),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.018,
                            left: MediaQuery.of(context).size.width * 0.022),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_alarm_sharp,
                              size: MediaQuery.of(context).size.height * 0.04,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.012,
                            ),
                            Text(
                              "Mon - Fri 10 AM - 4 PM",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  color: Color.fromARGB(255, 65, 64, 64),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ]),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.width * 0.04),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 57, 48, 222),
                radius: 38,
                backgroundImage: AssetImage('images/clinic.jpeg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07,
                  left: MediaQuery.of(context).size.width * 0.6),
              child: Text(
                "3.4 Mile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.028),
              ),
            ),
          ]),
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
      ]),
      /* floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: Icon(Icons.center_focus_strong),
      ), */
    );
  }

  void _addmarker(LatLng pos) {
    if (_origin.markerId.value == '' ||
        (_origin.markerId.value != '' && _dest.markerId.value != '')) {
      setState(() {
        _origin = Marker(
          markerId: MarkerId("origin"),
          infoWindow: InfoWindow(title: 'origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
    } else {
      _dest = Marker(
        markerId: MarkerId("destination"),
        infoWindow: InfoWindow(title: 'destination'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: pos,
      );
    }
  }
}
