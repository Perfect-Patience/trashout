import 'package:flutter/material.dart';
import 'package:trashout/components/button.dart';
import 'package:trashout/introScreens/introPage3.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const  EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 110.0,),
            Image.asset("assets/page2.png"),
            const SizedBox(height: 70.0,),
            const Text("SCHEDULE A PICKUP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(height: 20.0,),
            const Text(
              "Schedule a pickup days prior or set fixed days for your pickup",
              textAlign: TextAlign.center,
            )


          ],

        )
    );
  }
}
