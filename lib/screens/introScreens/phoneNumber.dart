import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trashout/components/button.dart';

import 'verification.dart';

class GetNumber extends StatefulWidget {
  const GetNumber({super.key});

  @override
  State<GetNumber> createState() => _GetNumberState();
}

class _GetNumberState extends State<GetNumber> {
  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(

          children: [
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const  Icon(Icons.arrow_back )),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0 , 0 ,0 ,0),
              child: Text("ENTER YOUR PHONE NUMBER",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                  )
              ),
            ),

            const SizedBox(height: 30,),
            //number input field
            Form(
              child: IntlPhoneField(
                onChanged : (number){
                  setState(() {
                    phoneNumber = number.completeNumber;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'GHA',
              ),
            ),
            const SizedBox(height: 20,),
            const Text("You will receive an SMS code to verify your phone number",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
            ),

            const Expanded(child: SizedBox(height: 300,)),

            GreenButton("Continue", () {
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) => const OtpVerification()));

              Navigator.pushNamed(context, '/verification', arguments: phoneNumber);

            }
            ),
          ],
        ),
      ),
    );
  }
}
