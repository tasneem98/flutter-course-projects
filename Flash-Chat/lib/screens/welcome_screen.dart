import 'package:flutter/material.dart';

import '/screens/login_screen.dart';
import '/screens/registration_screen.dart';
import '../components/rounded_button.dart';
import '../consts/consts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String id = 'welcome-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              'assets/animated/dizzy-blue-speech-bubbles-with-text.gif',
              color: kSecondaryColor,
              width: 300,
              // height: 300,
            ),
          ),
          RoundedButton(
            function: () => Navigator.pushNamed(context, LoginScreen.id),
            child: 'login',
          ),
          RoundedButton(
            function: () => Navigator.pushNamed(context, RegistrationScreen.id),
            child: 'Register',
          ),
        ],
      ),
    ));
  }
}
