import 'package:flutter/material.dart';

import '../consts/consts.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.screenName});

  final String title;
  final String subTitle;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(color: kPrimaryColor)),
        GestureDetector(
          child: Text(
            subTitle,
            style: const TextStyle(
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: kSecondaryColor),
          ),
          onTap: () => Navigator.pushNamedAndRemoveUntil(
            context,
            screenName,
            (route) => false,
          ),
        ),
      ],
    );
  }
}
