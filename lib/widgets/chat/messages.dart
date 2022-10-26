import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './message.bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }
        final chatDocs = chatSnapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemCount: chatSnapshot.data!.docs.length,
          itemBuilder: (ctx, index) => MessageBubble(
              chatDocs[index]['text'],
              chatDocs[index]['username'],
              chatDocs[index]['userId'] == FirebaseAuth.instance.currentUser!.uid,
              keyy: ValueKey(chatDocs[index].id),
          ),
        );
      },
    );
  }
}