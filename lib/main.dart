import 'package:flutter/material.dart';


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
      title: 'Kinder Caring Chat',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

