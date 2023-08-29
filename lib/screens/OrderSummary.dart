import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:trashout/components/button.dart';
import 'package:trashout/constants/constants.dart';
import 'package:trashout/readData/readAgencyData.dart';
// import 'package:trashout/screens/home/home.dart';
import 'package:trashout/screens/setLocation/SetLocation.dart';

import '../constants/globalVariables.dart';

class OrderSummary extends StatefulWidget {
  OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  late String docId;

  // initinfo() {
  //   var androidInitialize =
  //       const AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var iOSInitialize = const DarwinInitializationSettings();
  //   var initializationSettings =
  //       InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
  //       FlutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse:(String? payload){

  //       } )
  //       })
  // }

  @override
  Widget build(BuildContext context) {
    if (date.isEmpty) {
      //get current date
      DateTime currentDate = DateTime.now().toLocal();
      date = DateFormat('dd/MM/yy').format(currentDate);
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "Order Summary",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 35,
            ),

            const Divider(
              thickness: 2,
            ),

            const SizedBox(
              height: 20,
            ),

            const GreenText(text: "Date:"),

            const SizedBox(
              height: 10,
            ),

            Text(
              date,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),

            const SizedBox(
              height: 20,
            ),

            const GreenText(text: "Location:"),

            const SizedBox(
              height: 10,
            ),

            Text(
              pickUpLocation,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),

            // const SizedBox(height: 10,),

            const SizedBox(
              height: 20,
            ),

            const GreenText(text: "Waste Type:"),

            const SizedBox(
              height: 10,
            ),

            Text(
              wasteType,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),

            const SizedBox(
              height: 20,
            ),

            const GreenText(text: "Payment Method:"),
            const SizedBox(
              height: 10,
            ),

            Text(
              paymentType,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),

            const SizedBox(
              height: 20,
            ),

            const GreenText(text: "Agency:"),

            const SizedBox(
              height: 10,
            ),

            GetAgencyName(
              agencyID: pickUpAgencyID,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 70,
            ),

            GreenButton("Confirm Order", () async {
              Map<String, dynamic> orderDetailsToSave = {
                'Pickup Date': date,
                'Location': pickUpLocation,
                'Waste Type': wasteType,
                'Payment Method': paymentType,
                'AgencyID': pickUpAgencyID,
                'UserID': userID,
                'longitude': longitude,
                'latitude': latitude,
              };

              try {
                FirebaseFirestore firestore = FirebaseFirestore.instance;

                // Create a document reference
                DocumentReference docRef = firestore.collection("orders").doc();
                docId = docRef.id;

                await docRef.set(orderDetailsToSave);

                await getAgentToken(pickUpAgencyID);
              } catch (err) {
                print(err);
              }

              print(docId);

              // FirebaseFirestore.instance.collection("orders").add(orderDetailsToSave);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text(
                        "Driver found, You will receive a confirmation soon")),
              );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            }),
            const SizedBox(
              height: 30,
            ),
            // GreenButton("Reschedule", () { }),
            SizedBox(
              height: 50,
              width: 360,
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SetLocation()));
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2, color: primaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                  child: const Text(
                    "Reschedule",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}

Future<void> getAgentToken(agentId) async {
// Get the firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// Get the document reference
  DocumentReference docRef = firestore.collection("agencies").doc(agentId);

// Get the data
  DocumentSnapshot docSnap = await docRef.get();

// Get the data
  dynamic data = docSnap.data();
  agentToken = data['token'];
}

class GreenText extends StatelessWidget {
  const GreenText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w500, color: primaryColor, fontSize: 18),
    );
  }
}
