import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trashout/screens/SelectPaymentMethod.dart';
import 'package:trashout/screens/introScreens/onboarding.dart';
import 'package:trashout/screens/introScreens/verification.dart';
import 'package:trashout/screens/splashScreen/splash.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const SplashScreen(),
      '/intro': (context) => const IntroScreen(),
      '/verification': (context) => const OtpVerification(),
      '/payment': (context) => const SelectPaymentMethod()
    },
  ));
}



