import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled3/screens/profile_screen.dart';

import '/components/rounded_button.dart';
import '/consts/consts.dart';
import '/screens/registration_screen.dart';
import '../components/container_box.dart';
import '../components/text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  bool _securePassword = true;
  bool _isLoading = false;

  final firebaseAuth = FirebaseAuth.instance;

  _securedPassword() {
    setState(() {
      _securePassword = !_securePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'login'.toUpperCase(),
                style: const TextStyle(fontSize: 30, color: Colors.black),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  onChanged: (val) {
                    email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: kSecondaryColor,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
                ),
              ),
              const Gap(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                child: TextField(
                  onChanged: (val) {
                    password = val;
                  },
                  obscureText: _securePassword,
                  cursorColor: kSecondaryColor,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_open_outlined),
                    suffix: IconButton(
                      onPressed: _securedPassword,
                      icon: _securePassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
              ),
              const AppTextButton(
                title: "Don't have an account?\t\t",
                subTitle: "Register Here",
                screenName: RegistrationScreen.id,
              ),
              const Gap(30),
              _isLoading
                  ? const ContainerBox(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                  : RoundedButton(
                      function: () async {
                        if (email.isEmpty || password.isEmpty) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill all the fields')),
                            );
                          }
                          return;
                        }

                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          UserCredential user =
                              await firebaseAuth.signInWithEmailAndPassword(
                                  email: email, password: password);
                          if (user.user != null) {
                            if (context.mounted) {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                ProfileScreen.id,
                                // FeedScreen.id,
                                (route) => false,
                              );
                            }
                          } else {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Error in Login')),
                              );
                            }
                            log('Error in Login');
                          }
                        } on FirebaseAuthException catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('${e.code} --> ${e.message}')),
                            );
                          }
                          log('${e.code} --> ${e.message}');
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: 'login')
            ],
          ),
        ),
      ),
    );
  }
}
