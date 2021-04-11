import 'package:flutter/material.dart';
import 'package:payttmm1/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
          title: Text('PayTTMM'),
        backgroundColor: Colors.pink[800],
        actions: <Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label:Text('Log Out'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
