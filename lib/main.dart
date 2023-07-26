import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trashout/screens/introScreens/onboarding.dart';
import 'package:trashout/screens/introScreens/verification.dart';
import 'package:trashout/screens/splashScreen/splash.dart';

import 'firebase_options.dart';

void main() async {
  //runApp( const Trashout());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const SplashScreen(),
      '/intro': (context) => const IntroScreen(),
      //  "/login":(context) => const Login(),
      '/verification': (context) => const OtpVerification()
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


