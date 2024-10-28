import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IamPoor(),
    );
  }
}

class IamPoor extends StatelessWidget {
  const IamPoor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I Am Poor',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueGrey.shade900,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.blueGrey.shade300,
      body: Center(
        child: Image.asset('assets/images/poor.png'),
      ),
    );
  }
}
