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

  void _submitAuthForm(
      String email, String password, String user, bool isLogin, BuildContext ctx) async {
    UserCredential authResult;
    try {
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      }
    } on PlatformException catch(err){
       var message = 'An error occurred, please check your credentials';
       if (err.message != null) {
        message = err.message!;
       }

       ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 60),
          action: SnackBarAction(
          label: 'ACTION',
          onPressed: () { },
        ),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
    } catch(err) {     
      print(err);
      var message = 'An error occurred, please check your credentials';       
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
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