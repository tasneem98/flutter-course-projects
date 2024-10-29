import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../consts/consts.dart';

class MessageBubbles extends StatelessWidget {
  MessageBubbles({super.key, required this.isMe});

  final String isMe;

  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firebaseFireStore
            .collection('messages')
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
              color: kSecondaryColor,
            ));
          }
          return Expanded(
              child: ListView(
            reverse: true,
            children: [
              for (var message in snapshot.data!.docs.reversed)
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    crossAxisAlignment: isMe == message['sender']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius: isMe == message['sender']
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))
                            : const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                        color: isMe == message['sender']
                            ? kSecondaryColor
                            : Colors.white,
                        elevation: 5,
                        child: GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Text(
                              '${message['message']}',
                              style: TextStyle(
                                  color: isMe == message['sender']
                                      ? kBackgroundColor
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        DateFormat.jm()
                            .format(DateTime.parse(
                                message['time'].toDate().toString()))
                            .toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
            ],
          ));
        });
  }
}
