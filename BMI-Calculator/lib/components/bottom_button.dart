import 'package:flutter/material.dart';

import '/consts.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.data,
    required this.onTap,
  });
  final String data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: const BoxDecoration(
              color: kButtonColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10),
          height: 80,
          child: Text(
            data.toUpperCase(),
            style: kBottomButtonTextStyle,
          ),
        ));
  }
}
