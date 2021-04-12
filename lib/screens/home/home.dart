import 'package:flutter/material.dart';
import 'package:payttmm1/services/auth.dart';
import 'package:payttmm1/models/user.dart';
import 'package:payttmm1/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
//Home is changed from stateless to stateful widget just to test the find friend method
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String username_received='';
  String friend_id='';
  String if_found='';

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<Username>(
      stream: DatabaseServiceForUsers(uid: user.uid).username,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Username username= snapshot.data;
          username_received=username.username;
        }
        else{
          username_received='Not found';
        }
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
          body: Container(

            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  Text(
                          username_received,
                          style: TextStyle(color: Colors.blueAccent, fontSize: 14.0),
                        ),
                  SizedBox(
                    height:20,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter a username",
                        fillColor: Colors.white,
                        filled: true),
                    validator: (val) => val.isEmpty ? 'Enter an username' : null,
                    onChanged: (val) {
                      setState(() => friend_id = val);
                    },
                  ),
                  SizedBox(
                    height:20,
                  ),
                  RaisedButton(
                      color: Colors.red[50],
                      child: Text(
                        'Find',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        //Function call of friend method
                      }
                  ),
                  SizedBox(
                    height:20,
                  ),
                  /*
                  //This text is result of whether friend is found or not
                  Text(
                    if_found,
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  )
                  */

                ],
              ),
            ),
          )
        );
      }
    );
  }
}
