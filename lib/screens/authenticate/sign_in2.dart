import 'package:flutter/material.dart';
import 'package:payttmm1/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth1 = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[500],
        elevation: 1,
        title: Text('Sign in to PayTTMM'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
          child: Text('Sign in'),
          onPressed: () async{
            dynamic result = await _auth1.signInAnon();
            if(result == null){
              print('error signing in');
            }else{
              print('signed in');
            }
            print(result.uid);
          },
        ),
      ),
    );
  }
}
