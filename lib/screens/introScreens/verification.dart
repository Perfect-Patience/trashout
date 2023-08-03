import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:trashout/components/button.dart';

import '../signIn/sign_in.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    String phoneNum = "";
    if (ModalRoute.of(context)?.settings.arguments != null) {
      phoneNum = ModalRoute.of(context)!.settings.arguments as String;
    }

    return Material(
        child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back)),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              "Enter OTP CODE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("A code was sent to $phoneNum ",
                  style: const TextStyle(
                    fontSize: 16.0,
                  )),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Edit phone number",
                textAlign: TextAlign.start,
                style: TextStyle(color: Color(0xff00bf63), fontSize: 14.0),
              ),
            ),

            const SizedBox(
              height: 30.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       height: 68,
            //       width: 50,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(10)
            //       ),
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length == 1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         style: const TextStyle(fontSize: 30.0),
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //         decoration:  const InputDecoration(
            //           border: InputBorder.none,
            //           // fillColor: Colors.grey[400], // Set your desired fill color here
            //           // filled: true,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 68,
            //       width: 50,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(10)
            //       ),
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length == 1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         style: const TextStyle(fontSize: 30.0),
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //         decoration:  const InputDecoration(
            //           border: InputBorder.none,
            //           // fillColor: Colors.grey[400], // Set your desired fill color here
            //           // filled: true,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 68,
            //       width: 50,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(10)
            //       ),
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length == 1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         style: const TextStyle(fontSize: 30.0),
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //         decoration:  const InputDecoration(
            //           border: InputBorder.none,
            //           // fillColor: Colors.grey[400], // Set your desired fill color here
            //           // filled: true,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 68,
            //       width: 50,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(10)
            //       ),
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length == 1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         style: const TextStyle(fontSize: 30.0),
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //         decoration:  const InputDecoration(
            //           border: InputBorder.none,
            //           // fillColor: Colors.grey[400], // Set your desired fill color here
            //           // filled: true,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 68,
            //       width: 50,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(10)
            //       ),
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length == 1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         style: const TextStyle(fontSize: 30.0),
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //         decoration:  const InputDecoration(
            //           border: InputBorder.none,
            //           // fillColor: Colors.grey[400], // Set your desired fill color here
            //           // filled: true,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 68,
            //       width: 50,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(10)
            //       ),
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length == 1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         style: const TextStyle(fontSize: 30.0),
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //         decoration:  const InputDecoration(
            //           border: InputBorder.none,
            //           // fillColor: Colors.grey[400], // Set your desired fill color here
            //           // filled: true,
            //         ),
            //       ),
            //     ),
            //
            //
            //   ],
            // ),
            OtpTextField(
              numberOfFields: 6,
              fieldWidth: 47,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
            ),
          const Expanded(child: SizedBox(height: 50.0,)),
            GreenButton("VERIFY",
                    () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignIn()) );
                }),
            const SizedBox(height: 10.0,),
          Container(
            padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
            child: const Row(
              children: [
                Text("Didn't get code?...   "),
                Text("resend code",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff00bf63),
                  // decoration: TextDecoration.underline,
                ),
                )
              ],

            ),
          ),
          ],
        ),
      ),
    ));
  }
}
