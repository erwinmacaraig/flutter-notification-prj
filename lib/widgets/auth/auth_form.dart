import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget{
  
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.all(16), 
            child: Form(child: Column(
              mainAxisSize: MainAxisSize.min, // make sure that the column does not take as much height as possible but take as much as needed
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email address'
                  )
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Usename'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 12,),
                ElevatedButton(child: const Text('Login'),onPressed: (){}),
                TextButton(child: const Text('Create new account'), onPressed: (){})
              ]
            ),),)
          ),),
      );
  }
}
