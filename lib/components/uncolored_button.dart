import 'package:flutter/material.dart';

class UnColoredButton extends StatelessWidget {
  final String text;
  final  void Function()? onPress;
  final Color buttonColor;
  final Color textColor;



  const UnColoredButton(this.text, this.onPress, this.buttonColor, this.textColor, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextButton(
        onPressed: onPress,
        child:  Text(
          text,
          style: TextStyle(
              color: textColor,
              // fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
      ),
    );
  }
}
