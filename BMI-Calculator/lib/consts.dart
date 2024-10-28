import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0A0E21);
const kButtonColor = Color(0xffeb1555);
const kTextColor = Color(0xff8e8d98);
const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);

const kBuildBigTextStyle = TextStyle(
  fontSize: 50,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kTextStyle = TextStyle(color: kTextColor, fontSize: 20);

const kSliderThemeData = SliderThemeData(
    activeTrackColor: kButtonColor,
    inactiveTrackColor: Colors.grey,
    thumbColor: kButtonColor,
    overlayColor: Color(0x29EB1555),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 30));

const kBottomButtonTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2);

const kTitleTextStyle =
    TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold);

const kResultTextStyle = TextStyle(fontSize: 100, fontWeight: FontWeight.bold);

const kBodyTextStyle = TextStyle(fontSize: 22);
