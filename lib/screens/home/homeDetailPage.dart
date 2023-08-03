import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trashout/constants/constants.dart';
import 'package:trashout/screens/setLocation/SetLocation.dart';
import 'package:trashout/screens/signIn/sign_in.dart';

import '../../components/cardTile.dart';
import '../../constants/globalVariables.dart';
import '../Notifications.dart';
import '../Payments.dart';
import '../RecycleIt.dart';
import '../ReportMissedPickUp.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({super.key});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  var _dateSelected;
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2027))
        .then((value) {
      setState(() {
        _dateSelected = value!;
        date = DateFormat('dd/MM/yy').format(_dateSelected);
      });
      if (_dateSelected != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SetLocation()));
      }
    });
  }

  void signOutUser() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      // Redirect the user to the login screen or any other screen as needed
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignIn(),
          ));
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffE7EFF9),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Text(
          "Home",
          style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            onSelected: (value) {
              if (value == 'logout') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Logout'),
                      content: Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Logout'),
                          onPressed: () {
                            signOutUser();
                            // Call the signOutUser function
                            // Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else if (value == 'Sign in') {
                Navigator.pushNamed(context, "/login");
              }
            },
            itemBuilder: (BuildContext context) => [
              FirebaseAuth.instance.currentUser != null
                  ? PopupMenuItem<String>(
                      value: 'logout',
                      child: Text('Logout'),
                    )
                  : PopupMenuItem<String>(
                      value: 'Sign in',
                      child: Text('Sign in'),
                    )
            ],
          ),
        ],
      ),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: ListView(
            children: [
              Column(
                children: [
                  // const SizedBox(height:60.0,),
                  Text(
                    "Welcome,",
                    style: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("what do you want to do today?"),

                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: [
                      CardTileComponent(
                        icon: Icons.fire_truck_sharp,
                        text: "request a pick up",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SetLocation()));
                        },
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      CardTileComponent(
                        icon: Icons.calendar_month_rounded,
                        text: "schedule a pick up",
                        onTap: () {
                          _showDatePicker();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  Row(
                    children: [
                      CardTileComponent(
                        icon: Icons.credit_card,
                        text: "payments and invoices",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Payments()));
                        },
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      CardTileComponent(
                        icon: Icons.recycling,
                        text: "recycle it",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecycleIt()));
                        },
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      CardTileComponent(
                        icon: Icons.notifications_none,
                        text: "notifications",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifications()));
                        },
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      CardTileComponent(
                        icon: Icons.flag_outlined,
                        text: "report a missed pick up",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ReportMissedPickup()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),

              Row(
                children: [
                  CardTileComponent(
                    icon: Icons.credit_card,
                    text: "payments and invoices",
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Payments()));
                    },
                  ),
                  const SizedBox(width: 20.0,),
                  CardTileComponent(
                    icon: Icons.recycling,
                    text: "recycle it",
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RecycleIt()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20.0,),
              Row(
                children: [
                  CardTileComponent(
                    icon: Icons.notifications_none,
                    text: "notifications",
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Notifications()));
                    },
                  ),
                  const SizedBox(width: 20.0,),
                  CardTileComponent(
                    icon: Icons.flag_outlined,
                    text: "report a missed pick up",
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const ReportMissedPickup()));
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
