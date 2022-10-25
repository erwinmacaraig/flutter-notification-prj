import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../widgets/widgets.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState(); 
} 

class _AuthScreenState extends State<AuthScreen>{

  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(String email, String password, String user, bool isLogin) async {
    UserCredential authResult;
    try {

    } on PlatformException catch(err){
       var message = 'An error occurred, please check your credentials';
       if (err.message != null) {
        message = err.message!;
       }

       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } catch(err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm),
    );
  }
}