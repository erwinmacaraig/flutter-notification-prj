import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kc_chat/widgets/chat/messages.dart';
import 'package:kc_chat/widgets/chat/new_message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  
  @override
  void initState() {
    super.initState();
   _init();
   FirebaseMessaging.onMessage.listen((RemoteMessage message) { 
    print('Got a message whilst in the foreground! ${DateTime.now()}');
    print('Message data: ${message.data}');
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
   });
  }

  void _init() async{
    final fbm = FirebaseMessaging.instance;
  //  fbm.requestPermission(
  //   alert: true,
  //   announcement: true,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: true,
  //   provisional: false,
  //   sound: true,
    
  //  );
    NotificationSettings settings = await fbm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');

    fbm.subscribeToTopic('chat');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo', style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          DropdownButton(
            underline: Container(),
            icon: const Icon(Icons.more_vert, color: Colors.pink), //Theme.of(context).primaryIconTheme.color
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
