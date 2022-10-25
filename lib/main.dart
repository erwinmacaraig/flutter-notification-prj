import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//SCREENS
import './screens/screens.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Notifications',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }

  
}

