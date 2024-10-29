import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Magic8Balls());
  }
}

class Magic8Balls extends StatefulWidget {
  const Magic8Balls({super.key});

  @override
  State<Magic8Balls> createState() => _Magic8BallsState();
}

class _Magic8BallsState extends State<Magic8Balls> {
  int _ballNumber = 1;

  void _randomizeBall() {
    setState(() {
      _ballNumber = Random().nextInt(4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ask Me anything'.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.blue,
      body: GestureDetector(
        onTap: _randomizeBall,
        child: Center(
          child: Image.asset(
            'assets/images/ball$_ballNumber.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
