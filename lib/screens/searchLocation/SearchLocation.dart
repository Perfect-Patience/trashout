import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trashout/components/locationListTile.dart';
import 'package:trashout/models/placeAutoCompleteResponse.dart';
import 'package:trashout/utilities/locationNetworkUtility.dart';

import '../../constants/constants.dart';
import '../../constants/globalVariables.dart';
import '../SelectWasteType.dart';
import 'package:trashout/models/autocomplete_prediction.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'place_details.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  // final googlePlaces = GooglePlaces(apiKey: mapApiKey);
  List<AutocompletePrediction> locationPrediction = [];

  Future<void> placeAutocomplete(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": query,
      "key": mapApiKey,
    });

    String? response = await LocationNetworkUtility.fetchUrl(uri);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          locationPrediction = result.predictions!;
        });
      }
    }
  }

  // void getLatLng(String? placeId) async {
  //   // Get the place details for the place with the ID "ChIJy6235724uoARmS41Y5y_47s".
  //   PlaceDetails placeDetails = await googlePlaces.getDetailsByPlaceId(placeId);

  //   // Save the latitude and longitude of the place in variables.
  //   double latitude = placeDetails.geometry.location.latitude;
  //   double longitude = placeDetails.geometry.location.longitude;

  //   // Do something with the latitude and longitude.
  // }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 80.0,
              ),
              Form(
                child: TextFormField(
                  onChanged: (value) {
                    placeAutocomplete(value);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
                    hintText: "Search for a location or an address",
                    prefixIcon: Padding(
                      // padding: EdgeInsets.symmetric(vertical: ),
                      padding: EdgeInsets.all(10),
                      child: FaIcon(FontAwesomeIcons.magnifyingGlass),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton.icon(
                onPressed: () async {
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
                    List<Placemark> placemark = await placemarkFromCoordinates(
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
                },
                icon: const FaIcon(FontAwesomeIcons.locationDot),
                label: const Text("Use current location"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black54,
                    // elevation: 0,
                    fixedSize: const Size(double.maxFinite, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: locationPrediction.length,
                  itemBuilder: (context, index) => LocationListTile(
                      location: locationPrediction[index].description!,
                      press: () async {
                        String? location =
                            locationPrediction[index].description;
                        pickUpLocation = location!;
                        placeID = locationPrediction[index].placeId;
                        locations =
                            await locationFromAddress(location);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectWasteType()));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
