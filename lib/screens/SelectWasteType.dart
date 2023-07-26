import 'package:flutter/material.dart';
import 'package:trashout/components/WasteTypeCardTile.dart';
import 'package:trashout/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectWasteType extends StatelessWidget {
  const SelectWasteType({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primaryColor,
            width: screenWidth,
            height: double.maxFinite,
            child: const Column(
              children: [
                SizedBox(height: 120,),
                Text("SELECT WASTE TYPE",textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding:const EdgeInsets.all(20),
              color: Colors.grey[200],
              width: screenWidth ,
              height: 600,
              child:  Center(
                child: Column(
                  children: [
                    const Text("WHAT TYPE OF WASTE ARE WE PICKING?"),
                    const SizedBox(height: 30,),
                    Row(
                      children: [

                        WasteTypeTile(
                    icon:  SvgPicture.asset("assets/knotted-sack-icon.svg", width: 50, height: 50,),
                    text: "Domestic Waste",
                    onTap: (){}),
                        const SizedBox(width: 30,),
                        WasteTypeTile(
                            icon:  SvgPicture.asset("assets/hospital-trash-can-icon.svg", width: 50, height: 50,),
                            text: "Medical waste",
                            onTap: (){}),
                      ],
                    ),
                    const SizedBox(height: 30,),

                    Row(
                      children: [

                        WasteTypeTile(
                            icon:  SvgPicture.asset("assets/knotted-sack-icon.svg", width: 50, height: 50,),
                            text: "Domestic Waste",
                            onTap: (){}),
                        const SizedBox(width: 30,),
                        WasteTypeTile(
                            icon:  SvgPicture.asset("assets/biohazard-icon.svg", width: 50, height: 50,),
                            text: "Hazardous waste",
                            onTap: (){}),
                      ],
                    ),
                    const SizedBox(height: 30,),

                    Row(
                      children: [

                        WasteTypeTile(
                            icon:  SvgPicture.asset("assets/plastic-bottle-icon.svg", width: 50, height: 50,),
                            text: "Plastic Waste",
                            onTap: (){}),
                        const SizedBox(width: 30,),
                        WasteTypeTile(
                            icon:  SvgPicture.asset("assets/commercial-complex-icon.svg", width: 50, height: 50,),
                            text: "Commercial Waste",
                            onTap: (){}),
                      ],
                    )

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
