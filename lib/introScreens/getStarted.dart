import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trashout/introScreens/phoneNumber.dart';
class Getstarted extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:[
            const SizedBox(height: 300.0),
          const Text("ENTER YOUR PHONE NUMBER",
          style: TextStyle(
            fontWeight: FontWeight.bold,

          )
          ),
            const SizedBox(height: 50.0),
          // Number input field
          InkWell(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const GetNumber()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50.0,
              width: 450.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(5),
                  color: const Color(0x0A000000),
              ),

              child: Row(
                children: [
                   Image.asset("assets/Ghana_Flag.png",
                  height: 40,
                  width: 40,),
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_drop_down_sharp),
                  const SizedBox(width: 20),
                  const Text("+233"),
                ],
              ),
            ),
          ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 SizedBox(
                   width: 140.0,
                   child: Divider(
                    height: 50.0,
                    thickness: 1.3,
                     color: Colors.black12,
                ),
                 ),
                SizedBox(height: 75.0,),
                Text("OR"),
                SizedBox(
                  width: 140.0,
                  child: Divider(
                    height: 50.0,
                    thickness: 1.3,
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
              Container(
                width: 240,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: const Color(0x0A000000),
                ),
                child: TextButton.icon(
                    onPressed: (){},
                    icon: Image.asset(
                        "assets/google_logo.png",
                            width: 30,
                            height: 30,

                    ),


                    label: const Text("        Sign in with google")),
              ),
            SizedBox(height: 30.0,),
            Container(
              width: 240,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: const Color(0x0A000000),
              ),
              child: TextButton.icon(
                  onPressed: (){},
                  icon: Image.asset(
                    "assets/facebook_logo.png",
                    width: 30,
                    height: 30,

                  ),


                  label: const Text("        Sign in with google")),
            )
          ]),
      )
    );

  }
}
