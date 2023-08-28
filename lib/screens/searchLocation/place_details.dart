import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDetails {
 late String placeId;
  late String name;
  late String address;
  late String phoneNumber;
  late String websiteUrl;
  late double rating;
  late Geometry geometry;
  late String vicinity;
  late List<String> types;
}


class Geometry {
  late LatLng location;
  late String viewport;
}