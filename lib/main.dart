import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trashout/screens/SelectAgency.dart';
import 'package:trashout/screens/SelectPaymentMethod.dart';
import 'package:trashout/screens/home/home.dart';
import 'package:trashout/screens/introScreens/onboarding.dart';
import 'package:trashout/screens/introScreens/verification.dart';
import 'package:trashout/screens/signIn/sign_in.dart';
import 'package:trashout/api/firebase_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  await FirebaseMessaging.instance.getInitialMessage();
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/intro': (context) => const IntroScreen(),
        '/verification': (context) => const OtpVerification(),
        '/payment': (context) => const SelectPaymentMethod(),
        '/selectAgency': (context) => const SelectAgency(),
        '/home': (context) => const HomePage()
      },
      home: showHome ? const SignIn() : const IntroScreen(),
    );
  }
}
