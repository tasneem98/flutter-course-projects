import 'package:flutter/material.dart';

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Color(0xff70A2A8), blurRadius: 2, offset: Offset(0, 3)),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
