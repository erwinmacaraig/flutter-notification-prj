import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('chats/ZlexVogs2L0vsi999jZL/messages').snapshots(),
              builder:(ctx, streamSnapshot){
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final documents = streamSnapshot.data?.docs;

               return ListView.builder(
                itemCount: streamSnapshot.data?.docs.length,
                itemBuilder: (ctx, index) => Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(documents![index]['text']),
                ),);
              }, 
              ),
        
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            FirebaseFirestore.instance.collection('chats/ZlexVogs2L0vsi999jZL/messages').add({
              'text': 'This was added by clicking the button'
            });
          },
        ),
        );
  }

  
}
