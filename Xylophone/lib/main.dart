import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const XylophonePage(),
    );
  }
}

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              xylophoneBody(color: Colors.red, note: 1),
              xylophoneBody(color: Colors.orange, note: 2),
              xylophoneBody(color: Colors.yellow, note: 3),
              xylophoneBody(color: Colors.green, note: 4),
              xylophoneBody(color: Colors.teal, note: 5),
              xylophoneBody(color: Colors.blue, note: 6),
              xylophoneBody(color: Colors.purple, note: 7),
            ]),
      ),
    );
  }

  xylophoneBody({required Color color, required int note}) => GestureDetector(
        onTap: () {
          playSound(note);
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 8,
          color: color,
        ),
      );

  playSound(int soundTrack) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundTrack.wav'), volume: 5.0);
  }
}
