import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kButtonTextStyle400 = GoogleFonts.alexandria(
    fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

TextStyle kButtonTextStyle200 = GoogleFonts.alexandria(
    fontSize: 20, fontWeight: FontWeight.w200, color: Colors.white);

TextStyle kSubTitleStyle = GoogleFonts.alexandria(
    fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey.shade600);

TextStyle kWhiteTitleStyle = GoogleFonts.alexandria(
  color: Colors.white,
  // fontSize: 35,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
);
TextStyle kTitleStyle = GoogleFonts.sansita(
  color: const Color(0xff364847),
  fontSize: 35,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
);

const kLoadingScreenDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xffF0F0F1), Color(0xffC7D3D5)],
  ),
);

const mainColor = Color(0xff3D808A);
const subTitleColor = Color(0xff8DB5BA);

const kAppEndPoint = 'https://api.openweathermap.org/data/2.5';
const kImageUrl = 'https://openweathermap.org/img/wn';
const kAppId = 'dae48a56c7bcafa246ab1715f6d54b46';
