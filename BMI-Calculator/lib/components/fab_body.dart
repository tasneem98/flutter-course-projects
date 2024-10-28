import 'package:flutter/material.dart';

class FabBody extends StatelessWidget {
  const FabBody({super.key, required this.onPressed, required this.icon});

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed(),
      constraints: const BoxConstraints.tightFor(height: 56, width: 56),
      elevation: 0.0,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
