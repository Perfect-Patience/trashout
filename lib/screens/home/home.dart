import 'package:flutter/material.dart';
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
    const HomeDetailPage(), const TrackOrderPage(), const UserInfoPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,),
              activeIcon: Icon(Icons.home_filled, color: primaryColor,),
            label: "Home"
          ),BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined,),
              activeIcon: Icon(Icons.location_on_outlined, color: primaryColor,),
              label: "Track Order"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined,),
              activeIcon: Icon(Icons.person_outline_outlined, color: primaryColor,),
              label: "me"
          )
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}
