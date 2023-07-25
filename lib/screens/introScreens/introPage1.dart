import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding:const  EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 90.0,),
                  Image.asset("assets/page1.png"),
                  const Text("ORDER A PICKUP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  const SizedBox(height: 20,),
                  const Text(
                      "Place on order for your trash to be picked and confirm your pickup",
                  textAlign: TextAlign.center,
                  )


                ],

              )
            );
  }
}
