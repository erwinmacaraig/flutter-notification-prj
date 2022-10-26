import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kc_chat/widgets/chat/messages.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo', style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert, color: Colors.pink), //Theme.of(context).primaryIconTheme.color
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Container(
                  child: Row(
                    children: const [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (value){
              if(value == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            }
          )
        ],
      ),
      body: Container(
        child: Column(
          children: const <Widget>[
            Expanded(child: Messages()),            
          ],
        ),
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
