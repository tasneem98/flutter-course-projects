import 'package:flutter/material.dart';

import 'container_box.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.function,
    required this.child,
  });
  final Function function;
  final String child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: ContainerBox(
          child: Text(
        child.toUpperCase(),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      )),
    );
  }
}
