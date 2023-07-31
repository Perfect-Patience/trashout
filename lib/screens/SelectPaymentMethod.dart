import 'package:flutter/material.dart';
import 'package:trashout/components/button.dart';
import 'package:trashout/constants/constants.dart';

import '../constants/globalVariables.dart';
import 'SelectAgency.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({super.key});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Stack(
        children: [

          Container(
            padding: const EdgeInsets.all(20),
            color: primaryColor,
            width: screenWidth,
            height: double.maxFinite,
            child: const Column(
              children: [
                SizedBox(height: 100.0,),
                Text("SELECT PAYMENT METHOD", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )
                ),
              ],
            ),

          ),
          Positioned(
            bottom: 0.0,
              child: Container(
                height: 550,
                width: screenWidth,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    const Text("Current Payment Option",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 20,),

                    Container(
                      height:70,
                      decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                          )
                        ]
                      ),
                      child: GestureDetector(
                        onTap: (){
                         setState(() {
                           isSelected = !isSelected;
                         });
                        },
                        child: ListTile(
                          leading: const Image(image: AssetImage("assets/money.png"), height: 60, width: 60,),
                          title: const Text("Cash Payment"),
                          subtitle: const Text("Default method"),
                          trailing: Checkbox(value: isSelected, onChanged: (value){
                            setState(() {
                              isSelected = value! ?? false;
                            });
                            if (isSelected){
                               paymentType = "Cash Payment";
                            }
                          }),
                        ),
                      )
                    ),
                    const SizedBox(height: 30,),
                    const Divider(
                      thickness: 1,
                    ),

                    const SizedBox(height: 90),
                     Center(
                       child: Text("No Other Payment Methods Currently Available",
                    textAlign: TextAlign.center, style: TextStyle(
                          color: Colors.grey[500],
                        ),
                       ),
                     ),
                    const SizedBox(height: 150),

                    GreenButton("NEXT", () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SelectAgency()));
                    })
                  ],
                ) ,
              ),
          )
        ],
      ),
    );
  }
}
