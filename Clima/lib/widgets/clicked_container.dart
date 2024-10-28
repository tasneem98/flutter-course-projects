import 'package:clima/utilities/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickedContainer extends StatelessWidget {
  const ClickedContainer(
      {super.key, required this.data, required this.isLoading});

  final String data;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.sizeOf(context).width / 1.5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isLoading ? mainColor : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Text(
        data,
        style: GoogleFonts.alexandria(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: isLoading ? Colors.white : mainColor),
      ),
    );
  }
}
