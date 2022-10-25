import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) => Container(
            padding: EdgeInsets.all(8),
            child: Text('This works'),
          ),
    ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        // print()
        await _setup();
        FirebaseFirestore.instance.collection('chats/ZlexVogs2L0vsi999jZL/messages').snapshots().listen((data) { 
          data.docs.forEach((element) {
            print(element['text']);
          });
        });
      },
    ),
    );
  }

  Future<void> _setup() async {
    // WidgetsFlutterBinding.ensureInitialized(); 
    // make Flutter to ensure that all of the widget have been initialize before we begin our process
    // called flutter binding
    await Firebase.initializeApp();
    
  }
}
