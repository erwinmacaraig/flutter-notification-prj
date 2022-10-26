import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kc_chat/widgets/chat/messages.dart';
import 'package:kc_chat/widgets/chat/new_message.dart';

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
            NewMessage(),            
          ],
        ),
      ),    
      
    );
  }

  
}
