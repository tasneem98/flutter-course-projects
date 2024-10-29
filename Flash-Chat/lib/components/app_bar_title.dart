import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitle extends StatelessWidget {
  AppBarTitle({super.key});

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              _firebaseAuth.currentUser!.photoURL.toString(),
            ),
          ),
          const Gap(5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _firebaseAuth.currentUser!.displayName.toString(),
                style: GoogleFonts.josefinSans(fontSize: 16),
              ),
              Text(
                _firebaseAuth.currentUser!.email.toString(),
                style: GoogleFonts.josefinSans(fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
