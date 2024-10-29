import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '/screens/chat_screen.dart';
import '/screens/login_screen.dart';
import '/screens/profile_screen.dart';
import '/screens/registration_screen.dart';
import '/screens/welcome_screen.dart';
import 'consts/consts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: kSecondaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        // primaryColor: kPrimaryColor,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: kSecondaryColor),
      ),
      title: 'Chat APP',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}

/*
Make sure your root app widget has provided a way to generate
E/flutter ( 1578): this route.
E/flutter ( 1578): Generators for routes are searched for in the following order:
E/flutter ( 1578):  1. For the "/" route, the "home" property, if non-null, is used.
E/flutter ( 1578):  2. Otherwise, the "routes" table is used, if it has an entry for the route.
E/flutter ( 1578):  3. Otherwise, onGenerateRoute is called. It should return a non-null value for any valid route not handled by "home" and "routes".
E/flutter ( 1578):  4. Finally if all else fails onUnknownRoute is called.

 */
