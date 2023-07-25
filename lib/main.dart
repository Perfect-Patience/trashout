
import 'package:flutter/material.dart';
import 'package:trashout/screens/introScreens/onboarding.dart';
import 'package:trashout/screens/introScreens/verification.dart';
import 'package:trashout/screens/splashScreen/splash.dart';

void main() {
  //runApp( const Trashout());
 runApp(MaterialApp(


    routes: {
      "/":(context) =>  const SplashScreen(),
      '/intro':(context)=> const IntroScreen(),
    //  "/login":(context) => const Login(),
      '/verification':(context) => const OtpVerification()


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


