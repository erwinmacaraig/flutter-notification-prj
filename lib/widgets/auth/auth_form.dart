import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget{
  const AuthForm(this.submitFn, this.isLoading, {super.key});

  final void Function(String email, String password, String userName, bool isLogin, BuildContext ctx) submitFn;
  final bool isLoading;
  
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;  

  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit(){
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save(); 
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(), _isLogin, context);
      // print(_userEmail);
      // print(_userName);
      // print(_userPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.all(16), 
            child: Form(
              key: _formKey,
              child: Column(
              mainAxisSize: MainAxisSize.min, // make sure that the column does not take as much height as possible but take as much as needed
              children: <Widget>[
                TextFormField(
                   key: const ValueKey('email'),
                   autocorrect: false,
                   textCapitalization: TextCapitalization.none,
                   enableSuggestions: false,
                  validator: (value){
                    if (value!.isEmpty || !value!.contains('@')){
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value){
                    // store the entered value
                    _userEmail = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email address'
                  )
                ),
                if (!_isLogin)
                TextFormField(
                  key: const ValueKey('username'),
                  autocorrect: true,
                  textCapitalization: TextCapitalization.words,
                  enableSuggestions: false,
                  validator: (value){
                    if (value!.isEmpty || value.length < 4){
                      return 'Please enter at least 4 characters';
                    }
                    return null;
                  },            
                  onSaved: (value){
                    _userName = value!;
                  },      
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextFormField(
                   key: const ValueKey('password'),
                  validator: (value){
                    if(value!.isEmpty || value.length < 7){
                      return 'Password must be at leas 7 characters long';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _userPassword = value!;
                  },
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 12,),
                if(widget.isLoading) CircularProgressIndicator(),
                if(!widget.isLoading)
                ElevatedButton(
                  onPressed:  _trySubmit,child: 
                  Text(_isLogin ? 'Login' : 'Signup'),
                ),
                if(!widget.isLoading)
                TextButton(
                  child: Text(_isLogin? 'Create new account' : 'I already have an account'),
                  onPressed: (){
                  setState(() {
                    _isLogin = !_isLogin;
                  },);
                })
              ]
            ),),)
          ),),
      );
  }
}
