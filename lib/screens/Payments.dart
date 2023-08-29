// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      child:  Center(
        child: Text("You've made no Payments",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[300],
        ),
      ),
      )

    );
  }
}
