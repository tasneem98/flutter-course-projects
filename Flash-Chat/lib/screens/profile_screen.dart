import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '/consts/consts.dart';
import '/screens/welcome_screen.dart';
import 'chat_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String id = 'profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _displayName = '';

  final _firebaseAuth = FirebaseAuth.instance;

  _updateProfile() async {
    await _firebaseAuth.currentUser!.updateDisplayName(_displayName);

    await _firebaseAuth.currentUser!.updatePhotoURL(
        'https://ouch-cdn2.icons8.com/YURagrNnL8vsIvm1HHFEAKNG2A5p6fT-yuJOH_DEVYc/rs:fit:368:368/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNTc2/LzUxMDlhMzA1LTRh/YTktNDIzZS1iMjli/LTY4OWQ0ZTdiMmE3/NS5zdmc.png');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatty', style: GoogleFonts.josefinSans()),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              await _firebaseAuth.signOut();
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                    context, WelcomeScreen.id, (route) => false);
              }
            },
            icon: const Icon(Icons.logout),
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _firebaseAuth.currentUser!.displayName == null
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          onChanged: (val) {
                            _displayName = val;
                            print('DisplayName: $_displayName');
                          }),
                    ),
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, ChatScreen.id),
                          child: const Text(
                            'Chatty',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: _updateProfile,
                            child: const Text('Update Profile')),
                      ],
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(top: 10),
                      height: 250,
                      decoration: BoxDecoration(
                          color: _firebaseAuth.currentUser!.photoURL == null
                              ? kSecondaryColor.withOpacity(0.5)
                              : Colors.transparent,
                          image: DecorationImage(
                            image: NetworkImage(
                                _firebaseAuth.currentUser!.photoURL.toString()),
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        _firebaseAuth.currentUser!.displayName.toString(),
                        style: GoogleFonts.josefinSans(fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _firebaseAuth.currentUser!.email.toString(),
                          style: GoogleFonts.josefinSans(fontSize: 20),
                        ),
                        const Gap(3),
                        Icon(
                          _firebaseAuth.currentUser!.emailVerified
                              ? Icons.verified
                              : Icons.verified_outlined,
                          color: _firebaseAuth.currentUser!.emailVerified
                              ? Colors.blue
                              : Colors.grey,
                          size: 15,
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(50, 50, 50, 5),
                      child: Divider(),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, ChatScreen.id),
                      child: const Text(
                        'Chatty',
                        style: TextStyle(color: kSecondaryColor),
                      ),
                    ),
                    /*  TextButton(
                onPressed: () {
                  _firebaseAuth.currentUser!.updateDisplayName('Tasneem');
                },
                child: const Text(
                  'Update Profile',
                  style: TextStyle(color: kSecondaryColor),
                ),
              ),*/
                  ],
                ),
        ),
      ),
    );
  }
}
