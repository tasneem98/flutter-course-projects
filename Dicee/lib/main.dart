import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(MaterialApp(
      title: 'Dicee',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red.shade200,
        ),
        body: const DiceBody(),
      )));
}

class DiceBody extends StatefulWidget {
  const DiceBody({super.key});

  @override
  State<DiceBody> createState() => _DiceBodyState();
}

class _DiceBodyState extends State<DiceBody> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () => changeDice(),
                child: Image.asset('assets/images/dice$leftDice.png')),
          ),
          const Gap(10),
          Expanded(
            child: GestureDetector(
                onTap: () => changeDice(),
                child: Image.asset('assets/images/dice$rightDice.png')),
          ),
        ],
      ),
    );
  }

  changeDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }
}
