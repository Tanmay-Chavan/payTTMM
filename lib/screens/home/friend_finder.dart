import 'package:payttmm1/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:payttmm1/models/user.dart';
import 'package:payttmm1/services/database.dart';
import 'package:payttmm1/screens/home/group.dart';

group(){

  Group();

}

class FriendFinder extends StatefulWidget {
  @override

  _FriendFinderState createState() => _FriendFinderState();
}

class _FriendFinderState extends State<FriendFinder> {
  final _formKey = GlobalKey<FormState>();

  String friend_id='';
  String if_found='';
  bool found=false;
  var _controllerfriend = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Username>>(

      stream: DatabaseServiceForUsers().usernames,
      builder: (context,list) {
        List all_users = list.data;         //List of users collection
        return Scaffold(

          backgroundColor: Colors.pink[100],

          body: Container(

            child: Form(
              key: _formKey,

              child: Column(
                children: [

                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(            //Accepts username to search
                    controller: _controllerfriend,
                    style: TextStyle(fontFamily: 'Comics'),
                    decoration: InputDecoration(
                        labelText: "Enter a username",
                        fillColor: Colors.white,
                        filled: true),
                    validator: (val) =>
                    val.isEmpty
                        ? 'Enter a username'
                        : null,
                    onChanged: (val) {
                      setState(() => friend_id = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                      color: Colors.amber,
                      child: Text(
                        'Find',
                        style: TextStyle(color: Colors.pink, fontFamily: 'Comics'),
                      ),
                      onPressed: () async {
                        found=false;


                        for (var i = 0; i < all_users.length; i++) {    //Search the list for username to be found
                          if (all_users[i].username == friend_id) {
                            found = true;
                            setState(() {
                              if_found = friend_id + ' found!';     //If it is found
                            });

                            break;
                          }

                        }
                        if (found == false) {
                          setState(() {
                            if_found = 'Not found!';        //If not found
                          });
                        }
                        //Function call of friend method
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //This text is result of whether friend is found or not
                  Text(
                    if_found,
                    style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: 'Comics'),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Visibility(visible: found, child: RaisedButton(
                      color: Colors.amber,
                      child: Text(
                        'add to group',
                        style: TextStyle(color: Colors.pink, fontFamily: 'Comics'),
                      ),
                      onPressed: () async {
                        Home.members.add(friend_id);
                        _controllerfriend.clear();
                        //Function call of friend method
                      }
                  ),),

                  SizedBox(
                    height: 20,
                  ),


                  Visibility(visible: found, child: RaisedButton(
                      color: Colors.pink,
                      child: Text(
                        'go to group',
                        style: TextStyle(color: Colors.amber, fontFamily: 'Comics'),
                      ),
                      onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Group()),
                  );
                  },
                  ),),
                ],
              ),
            ),

          ),
        );
      }
    );
  }
}
