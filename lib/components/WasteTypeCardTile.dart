import 'package:flutter/material.dart';

class WasteTypeTile extends StatelessWidget {

  final Widget icon;
  final String text;
  final Function()? onTap;

  const WasteTypeTile({super.key,
    required this.icon, required this.text, required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.0,
        width: 140.0,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,

        ),
        child: Column(
          children: [
            icon,
            const SizedBox(height: 15,),
            Text(text, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}

