import 'package:flutter/material.dart';

import '../consts.dart';

class IconBody extends StatelessWidget {
  const IconBody({super.key, required this.icon, required this.data});

  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
        ),
        Text(
          data.toUpperCase(),
          style: kTextStyle,
        ),
      ],
    );
  }
}
