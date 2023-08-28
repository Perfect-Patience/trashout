import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trashout/screens/SelectAgency.dart';
import 'package:trashout/screens/SelectPaymentMethod.dart';
import 'package:trashout/screens/home/home.dart';
import 'package:trashout/screens/introScreens/onboarding.dart';
import 'package:trashout/screens/introScreens/verification.dart';
import 'package:trashout/screens/signIn/sign_in.dart';
import 'package:trashout/screens/splashScreen/splash.dart';
import 'package:trashout/api/firebase_api.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const SplashScreen(),
      '/intro': (context) => const IntroScreen(),
      '/verification': (context) => const OtpVerification(),
      '/payment': (context) => const SelectPaymentMethod(),
      '/selectAgency': (context) => const SelectAgency(),
      '/home': (context) => const HomePage()
    },
    home: const SignIn(),
  ));
}
