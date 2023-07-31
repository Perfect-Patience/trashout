import 'package:flutter/material.dart';
import 'package:trashout/components/button.dart';
import 'package:trashout/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trashout/constants/globalVariables.dart';
import 'package:trashout/readData/readAgencyData.dart';

import 'OrderSummary.dart';

class SelectAgency extends StatefulWidget {
  const SelectAgency({super.key});

  @override
  State<SelectAgency> createState() => _SelectAgencyState();
}

class _SelectAgencyState extends State<SelectAgency> {
  int? _value;
  bool isSelected = false;
  bool isTapped = false;
  bool dataFetched = false;
  // get a list of all available agents by id


  //list to store IDs
  late List<String> agencyIDs = [];

  // get the ids

  Future getAgencyID() async{
    agencyIDs.clear();
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('agencies').get();
    // loop through snapshot for individual ids.
        for(QueryDocumentSnapshot agency in snapshot.docs){
          agencyIDs.add(agency.id);
        }
        dataFetched = true;
  }


  @override
// check is data is already loaded
  Widget build(BuildContext context) {
    if (!dataFetched) {
      // If data has not been fetched, call the function
      return FutureBuilder(
        future: getAgencyID(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Now, data has been fetched, rebuild the widget with the fetched data
            return buildWidget();
          } else {
            // While data is being fetched, show a loading indicator
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      );
    } else {
      // Data has already been fetched, build the widget with the fetched data
      return buildWidget();
    }
  }

  Widget buildWidget()
  {
    return  Scaffold(
      body: Column(
        children: [
          Stack(
            children:[
              const SizedBox(
              height: 250,
              child: Image(image: AssetImage("assets/delivery.png")),
            ),
              Container(
                color: primaryColor.withOpacity(0.15),
                height: 250,
              )
          ]
          ),
          const Column(
            children: [
              SizedBox(
                width: 100,
                child: Divider(
                  thickness: 4,
                ),
              ),

              SizedBox(height: 10,),

              Text("Select Preferred Waste Disposal Agency", style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
            ]
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: FutureBuilder(
               future: getAgencyID(),
              builder: (context, snapshot){
                return ListView.builder(
                    itemCount: agencyIDs.length ,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[400]!.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                  )
                                ]
                            ),
                            //create list view form agency details.
                            child: RadioListTile(
                                value: index,
                                groupValue: _value,
                                controlAffinity: ListTileControlAffinity.trailing,
                                title: GetAgencyName(agencyID: agencyIDs[index],),
                                subtitle: GetAgencyLocation(agencyID: agencyIDs[index]),
                                secondary: const Icon(Icons.account_circle, color: primaryColor, size: 40,),
                                activeColor: primaryColor,
                                onChanged:
                                    (value) {
                                  setState(() {
                                    _value = value;
                                    isSelected = true;
                                  });
                                  pickUpAgencyID = agencyIDs[index];
                                }),
                          ),
                          // const Divider(thickness: 2,),
                          const SizedBox(height: 15,),
                        ],
                      );
                    }

                );
              },
            )
          ),
          const SizedBox(height: 10,),
          GreenButton("NEXT", (){
             if(isSelected){
               Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderSummary()));
             }
             else {
               return ;
             }
            // Navigator
          }),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }
}
