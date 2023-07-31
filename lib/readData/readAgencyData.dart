import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetAgencyName extends StatelessWidget {
  const GetAgencyName({super.key, required this.agencyID, this.style});
  final String agencyID;
  final TextStyle? style;
  //get the collection
  
  @override
  Widget build(BuildContext context) {
    CollectionReference agencies = FirebaseFirestore.instance.collection('agencies');
    return FutureBuilder<DocumentSnapshot>(
      future: agencies.doc(agencyID).get(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['name']}', style: style,);
          }
          else{
            return const Text("loading");
          }
        });
  }
}


class GetAgencyLocation extends StatelessWidget {
  const GetAgencyLocation({super.key, required this.agencyID});
  final String agencyID;
  //get the collection

  @override
  Widget build(BuildContext context) {
    CollectionReference agencies = FirebaseFirestore.instance.collection('agencies');
    return FutureBuilder<DocumentSnapshot>(
        future: agencies.doc(agencyID).get(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['location']}');
          }
          else{
            return const Text("loading");
          }
        });
  }
}

