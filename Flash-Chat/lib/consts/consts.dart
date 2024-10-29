import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kBackgroundColor = Color(0xffF9F9F9);
const Color kPrimaryColor = Colors.black;
const Color kSecondaryColor = Color(0xffCD5C08);

const InputDecoration kTextFieldDecoration = InputDecoration(
  hintText: '',
  prefixIcon: Icon(Icons.person_outlined),
  focusColor: kPrimaryColor,
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  ),
);

InputDecoration kMessageTextFieldDecoration = InputDecoration(
  hintText: 'Type Your Message',
  hintStyle:
      GoogleFonts.josefinSans(color: Colors.grey, fontWeight: FontWeight.bold),
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
);
