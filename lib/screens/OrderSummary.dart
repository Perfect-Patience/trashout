import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trashout/components/button.dart';
import 'package:trashout/constants/constants.dart';
import 'package:trashout/readData/readAgencyData.dart';
import 'package:trashout/screens/setLocation/SetLocation.dart';

import '../constants/globalVariables.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    if ( date.isEmpty){
      //get current date
      DateTime currentDate = DateTime.now().toLocal();
      date = DateFormat('dd/MM/yy').format(currentDate);
    }
    return  Scaffold(
      body: SafeArea(child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const Center(
              child: Text("Order Summary", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ), textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 35,),

            const Divider(thickness: 2,),

            const SizedBox(height: 20,),

            const GreenText(text: "Date:"),

            const SizedBox(height: 10,),

            Text(date, style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),

            const SizedBox(height: 20,),

            const GreenText(text: "Location:"),

            const SizedBox(height: 10,),


            Text(pickUpLocation, style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),),

            // const SizedBox(height: 10,),

            const SizedBox(height: 20,),

            const GreenText(text: "Waste Type:"),

            const SizedBox(height: 10,),

            Text(wasteType, style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),

            const SizedBox(height: 20,),

            const GreenText(text: "Payment Method:"),
            const SizedBox(height: 10,),

            Text(paymentType, style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),

            const SizedBox(height: 20,),


            const GreenText(text: "Agency:"),

            const SizedBox(height: 10,),

            GetAgencyName(agencyID: pickUpAgencyID, style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 25,),
            const Divider(thickness: 2,),
            const SizedBox(height: 70,),

            GreenButton("Confirm Order", () { }),
            const SizedBox(height: 30,),
            // GreenButton("Reschedule", () { }),
            SizedBox(
              height: 50,
              width: 360,
              child: OutlinedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const SetLocation()));
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2, color: primaryColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0))
                  ),

                  child: const Text("Reschedule",style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),)
              ),
            )

          ],
        ),
      )),
    );
  }
}

class GreenText extends StatelessWidget {
  const GreenText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text , style: const TextStyle(
      fontWeight: FontWeight.w500,
      color: primaryColor,
      fontSize: 20
    ),);
  }
}
