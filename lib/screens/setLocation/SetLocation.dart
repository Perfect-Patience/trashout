import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:trashout/components/uncolored_button.dart';
import 'package:trashout/constants/constants.dart';
import 'dart:async';
import "package:google_maps_flutter/google_maps_flutter.dart";
import '../../constants/globalVariables.dart';
import '../SelectWasteType.dart';
import '../searchLocation/SearchLocation.dart';
import 'package:geolocator/geolocator.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(6.673175, -1.565423);

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  // Future<void> GetAddressFromLatLong(BuildContext context ,Position position)async {
  //   List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark place = placemark[0];
  //   pickUpLocation = '${place.name}, ${place.street}, \n ${place.locality}';
  //   if (pickUpLocation.isNotEmpty){
  //     // Show a loading indicator while the next page is loading
  //     await Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectWasteType()));
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.red,
      body: Stack(
        children: [
          //  Container(
          //   color: Colors.red,
          //   padding: const EdgeInsets.all(20.0),
          // ),
          const GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: sourceLocation, zoom: 15)),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: screenWidth,
              height: 450,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              // height: 100.0,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  const FaIcon(
                    FontAwesomeIcons.mapLocationDot,
                    size: 50.0,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    "Set pick up location",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    "choose a location so agents can find and pick up your trash",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  UnColoredButton("Use my location", () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    Position? position = await _determinePosition();
                    if (position != null) {
                      longitude = position.longitude;
                      latitude = position.latitude;
                      List<Placemark> placemark =
                          await placemarkFromCoordinates(
                              position.latitude, position.longitude);
                      Placemark place = placemark[0];
                      pickUpLocation =
                          '${place.name}, ${place.street}, \n ${place.locality}';
                    }

                    Navigator.pop(context); // Hide the loading indicator

                    if (pickUpLocation != null && pickUpLocation.isNotEmpty) {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectWasteType()));
                    }
                  }, primaryColor, Colors.white),
                  const SizedBox(
                    height: 25.0,
                  ),
                  UnColoredButton("Search location", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchLocation()));
                  }, Colors.grey[200]!, Colors.black)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
