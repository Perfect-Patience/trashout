import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trashout/components/uncolored_button.dart';
import 'package:trashout/constants/constants.dart';

import '../searchLocation/SearchLocation.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationState();
}
class _SetLocationState extends State<SetLocation> {
  @override

  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.red,
      body: Stack(
        children: [

             Container(
              color: Colors.red,
              padding: const EdgeInsets.all(20.0),
            ),
          Positioned(
            bottom: 0.0,
            child: Container(

              width: screenWidth ,
              height: 450,
              padding:const  EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              ),
              // height: 100.0,
              child: Column(
                children: [
                  const SizedBox(height: 40.0,),
                  const FaIcon(FontAwesomeIcons.mapLocationDot, size: 50.0, color: primaryColor,),
                  const SizedBox(height: 30.0,),
                  const Text("Set pick up location", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                  ),),
                  const SizedBox(height: 25.0,),

                  const Text(
                    "choose a location so agents can find and pick up your trash",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 18.0,
                  ),),
                  const SizedBox(height: 30.0,),
                  UnColoredButton("Use my location", () { }, primaryColor, Colors.white),
                  const SizedBox(height: 25.0,),
                  UnColoredButton("Search location", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchLocation()));
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
