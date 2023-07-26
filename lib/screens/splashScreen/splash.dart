import 'dart:async';

import 'package:flutter/material.dart';

import '../introScreens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    startTimer();
    super.initState();
    }

  startTimer(){
    var duration =  const Duration(seconds: 5);
    return Timer(duration, route);
  }
  route(){
    //Navigator.of(context).pushReplacementNamed("/intro");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IntroScreen() ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00bf63),
      body:
      Center(
          child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset('assets/logo.jpg'),
          )
      ),
      );
  }
}
