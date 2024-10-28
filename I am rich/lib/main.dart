import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'I am Rich',
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
              'I am Rich',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            backgroundColor: Colors.blueGrey[900]),
        backgroundColor: Colors.blueGrey,
        body: Center(
          // child: Image.network('https://static.toiimg.com/thumb/msid-99951507,width-1070,height-580,imgsize-33238,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg')
          child: Image.asset('images/diamond.png'),
        ),
      ),
    ),
  );
}
