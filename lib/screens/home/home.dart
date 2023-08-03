import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:trashout/constants/constants.dart';
import 'package:trashout/screens/trackOrderPage.dart';
import 'package:trashout/screens/userInfoPage.dart';
import 'homeDetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeDetailPage(),
    const TrackOrderPage(),
    const UserInfoPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          rippleColor: Colors.grey, // tab button ripple color when pressed
          hoverColor: Colors.grey, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 30,
          tabMargin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          // backgroundColor: Colors.redAccent,
          tabActiveBorder: Border.all(
              color: Colors.transparent, width: 1), // tab button border
          tabBorder: Border.all(
              color: Colors.transparent, width: 0), // tab button border
          tabShadow: [
            // BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          ], // tab button shadow
          curve: Curves.easeInOut, // tab animation curves
          // duration: Duration(milliseconds: 100), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.green,
          tabBackgroundGradient: RadialGradient(
            colors: [
              Colors.grey.shade100,
              Colors.grey.shade600,

              // Colors.transparent,
            ],
            radius: 3,
            // begin: Alignment.centerLeft,
            // end: Alignment.centerRight,
          ), // selected icon and text color
          iconSize: 30, // tab button icon size
          // tabBackgroundColor: Colors.grey.shade300,
          textStyle: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800),
          // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.location_on_outlined,
              text: 'Track Order',
            ),
            GButton(
              icon: Icons.person_outline_outlined,
              text: 'Me',
            ),
          ]),

      // BottomNavigationBar(
      //   currentIndex: _currentIndex,

      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_filled,),
      //         activeIcon: Icon(Icons.home_filled, color: primaryColor,),
      //       label: "Home"
      //     ),BottomNavigationBarItem(
      //         icon: Icon(Icons.location_on_outlined,),
      //         activeIcon: Icon(Icons.location_on_outlined, color: primaryColor,),
      //         label: "Track Order"
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person_outline_outlined,),
      //         activeIcon: Icon(Icons.person_outline_outlined, color: primaryColor,),
      //         label: "me"
      //     )
      //   ],
      // ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}
