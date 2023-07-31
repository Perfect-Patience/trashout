import 'package:flutter/material.dart';

import '../constants/globalVariables.dart';

class WasteTypeTile extends StatefulWidget {

  final Widget icon;
  final String text;

  const WasteTypeTile({super.key,
    required this.icon, required this.text
  });

  @override
  State<WasteTypeTile> createState() => _WasteTypeTileState();
}

class _WasteTypeTileState extends State<WasteTypeTile> {

  void _onTap() {
    wasteType = widget.text;
    Navigator.pushNamed(context, "/payment");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
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
            widget.icon,
            const SizedBox(height: 15,),
            Text(widget.text, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}

