import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/button.dart';
import 'getStarted.dart';
import 'introPage1.dart';
import 'introPage2.dart';
import 'introPage3.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  bool onLastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            //checks if on last page
            onPageChanged: (index) {
              setState(() {
                onLastpage = (index == 2);
              });
            },
            children: const [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.65),
              margin: const EdgeInsets.fromLTRB(20, 0, 10, 40),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const SlideEffect(
                        spacing: 20.0,
                        dotHeight: 15,
                        dotWidth: 15,
                        activeDotColor: Color(0xff00bf63),
                        dotColor: Color(0xffd9d9d9),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    onLastpage
                        ? GreenButton("GET STARTED", () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool("shoeHome", true);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetStarted()));
                          })
                        : GreenButton("NEXT", () {
                            _controller.nextPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          })
                  ])),
        ],
      ),
    );
  }
}
