import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return FutureBuilder(
      future: _setup(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
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
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  side: const BorderSide(color: Colors.blue, width: 2),
                  textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        wordSpacing: 2,
                        letterSpacing: 2)
                )
              ),
              // primarySwatch: Colors.blue,
              // backgroundColor: Colors.blue,
              // ColorScheme: 
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, userSnapshot){
                if (userSnapshot.hasData) {
                  return ChatScreen();
                }
                return AuthScreen();
              } ,
            )  //AuthScreen() //ChatScreen(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
  }

  Future<bool> _setup() async {
    // WidgetsFlutterBinding.ensureInitialized(); 
    // make Flutter to ensure that all of the widget have been initialize before we begin our process
    // called flutter binding
    await Firebase.initializeApp();
    return true;    
  }
}


/*

*/
