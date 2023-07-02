import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final  void Function()? onPress;

  const GreenButton(this.text, this.onPress, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 360,
      decoration: BoxDecoration(
        color: const Color(0xff00bf63),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextButton(
        onPressed: onPress,
        child:  Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}
