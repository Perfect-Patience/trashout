import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const  EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 90.0,),
            Image.asset("assets/page3.png"),
            const SizedBox(height: 56,),
            const Text("TRACK PICKUP AGENT ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
            const SizedBox(height: 20.0,),
            const Text(
              "Live Track pickup Agent and place reports for missed pickups ",
              textAlign: TextAlign.center,
            )


          ],

        )
    );
  }
}
