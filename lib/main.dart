
import 'package:flutter/material.dart';
import 'package:trashout/onboarding.dart';
import 'package:trashout/splash.dart';
//import 'package:trashout/login.dart';

void main() {
  //runApp( const Trashout());
 runApp(MaterialApp(
    routes: {
      "/":(context) =>  const SplashScreen(),
      '/intro':(context)=> const IntroScreen(),
    //  "/login":(context) => const Login(),


    },

  ));
}

// class Trashout extends StatelessWidget {
//   const Trashout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const SplashScreen();
//   }
// }


