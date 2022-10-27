import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/widgets.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState(); 
} 

class _AuthScreenState extends State<AuthScreen>{

  @override
  void initState(){
    init();
    super.initState();
  }

  init() async {
    String deviceToken = await getDeviceToken();
    print("############################### DEVICE TOKEN #################");
    print(deviceToken);
    print("");
  }
  


  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
      String email, String password, String username, bool isLogin, BuildContext ctx) async {
    UserCredential authResult;
    try {
      setState((){
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
         await FirebaseFirestore.instance.collection('users').doc(authResult.user!.uid).set({
          'username': username,
          'email': email
         });
      }

     

    } on PlatformException catch(err){
      setState((){
        _isLoading = false;
      });
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
      setState((){
        _isLoading = false;
      });     
      print(err);
      var message = 'An error occurred, please check your credentials';       
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(err.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }

  Future getDeviceToken() async{
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
    return (fcmToken == null) ? "" : fcmToken;
  }
}