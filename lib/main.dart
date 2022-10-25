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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.pink,
          brightness: Brightness.dark,          
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        // primarySwatch: Colors.blue,
        // backgroundColor: Colors.blue,
        // ColorScheme: 
      ),
      home: AuthScreen() //ChatScreen(),
    );
  }

  
}

