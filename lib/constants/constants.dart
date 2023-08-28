import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';



const primaryColor = Color(0xff00bf63);

const String mapApiKey = "AIzaSyC2v7hFbkcRBVszI12qQSN2tYabWpzZgg4";

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseMessaging fcm = FirebaseMessaging.instance;
