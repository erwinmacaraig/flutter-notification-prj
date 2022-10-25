import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder:  (context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
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
            // print()
            // await _setup();
            // FirebaseFirestore.instance.collection('chats/ZlexVogs2L0vsi999jZL/messages').snapshots().listen((data) { 
            //   data.docs.forEach((element) {
            //     print(element['text']);
            //   });
            // });
          },
        ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }, future: _setup(),);
  }

  Future<bool> _setup() async {
    // WidgetsFlutterBinding.ensureInitialized(); 
    // make Flutter to ensure that all of the widget have been initialize before we begin our process
    // called flutter binding
    await Firebase.initializeApp();
    return true;
    
  }
}
