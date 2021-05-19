import 'package:flutter/material.dart';
import 'package:payttmm1/screens/home/friend_finder.dart';
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

  String username_received='';

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<Username>(
      stream: DatabaseServiceForUsers(uid: user.uid).username,
      builder: (context, snapshot){                        //Saves the name of logged in user
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

              Text(
                username_received,                  //Displays the username of logged in user
                style: TextStyle(color: Colors.black, fontSize: 14.0),
              ),

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

            child: FriendFinder()       //Widget to search another user
          )
        );
      }
    );
  }
}
