import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState(); 


} 

class _AuthScreenState extends State<AuthScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(),
    );
  }
}