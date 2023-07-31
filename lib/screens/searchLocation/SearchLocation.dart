import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trashout/components/locationListTile.dart';
import 'package:trashout/screens/models/placeAutoCompleteResponse.dart';
import 'package:trashout/utilities/locationNetworkUtility.dart';

import '../../constants/constants.dart';
import '../../constants/globalVariables.dart';
import '../SelectWasteType.dart';
import '../models/autocomplete_prediction.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  List <AutocompletePrediction> locationPrediction = [];

  Future<void> placeAutocomplete(String query) async {
    Uri uri = Uri.https("maps.googleapis.com",
        'maps/api/place/autocomplete/json',
        {
          "input": query,
          "key": mapApiKey,
        });

    String? response = await LocationNetworkUtility.fetchUrl(uri);
    if (response != null){
      PlaceAutocompleteResponse result = PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null){
          setState(() {
            locationPrediction = result.predictions!;
          });
      }
    }

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
              const SizedBox(height: 80.0,),
              Form(
                  child: TextFormField(
                onChanged: (value){
                  placeAutocomplete(value);
                },
                    textInputAction: TextInputAction.search ,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0
                        )
                      ),
                      hintText: "Search for a location or an address",
                      prefixIcon: Padding(
                        // padding: EdgeInsets.symmetric(vertical: ),
                        padding: EdgeInsets.all(10),
                        child: FaIcon(FontAwesomeIcons.magnifyingGlass),
                      ),
                    ),
              ),
              ),
                const SizedBox(height:30.0 ,),
                ElevatedButton.icon(onPressed: (){},
                    icon: const FaIcon(FontAwesomeIcons.locationDot),
                    label: const Text("Use current location"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black54,
                    // elevation: 0,
                    fixedSize: const Size(double.maxFinite, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                  ),
                ),

              const SizedBox(height: 20,),
              Expanded(child: ListView.builder(
                itemCount: locationPrediction.length,
                  itemBuilder: (context, index) =>
                      LocationListTile(
                          location: locationPrediction[index].description!,
                          press:() {
                            String? location = locationPrediction[index].description;
                            pickUpLocation = location!;
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const SelectWasteType()));

                          }
                          ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
