import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/consts/consts.dart';
import '/screens/welcome_screen.dart';
import '../components/app_bar_title.dart';
import '../components/message_bubbles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static const String id = 'chat-screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  String messageText = '';
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: AppBarTitle(),
          actions: [
            PopupMenuButton(
                color: kBackgroundColor,
                child: const Icon(Icons.more_vert),
                onSelected: (val) async {
                  await _firebaseAuth.signOut();
                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, WelcomeScreen.id, (route) => false);
                  }
                },
                itemBuilder: (_) => [
                      const PopupMenuItem(
                          value: 0,
                          child: ListTile(
                            leading: Icon(Icons.logout_outlined),
                            title: Text('Logout'),
                          )),
                    ]),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: kBackgroundColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MessageBubbles(isMe: _firebaseAuth.currentUser!.email.toString()),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (val) {
                        messageText = val;
                      },
                      controller: messageController,
                      cursorColor: kSecondaryColor,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        await _firebaseFireStore.collection('messages').add({
                          "sender": _firebaseAuth.currentUser!.email,
                          "time": Timestamp.now(),
                          "message": messageText,
                        }).then((onValue) => messageController.clear());
                      },
                      child: Text(
                        'SEND',
                        style: GoogleFonts.josefinSans(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
