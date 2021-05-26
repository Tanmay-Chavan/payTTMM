import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payttmm1/screens/home/friend_finder.dart';
import 'package:payttmm1/services/auth.dart';
import 'package:payttmm1/models/user.dart';
import 'package:payttmm1/services/database.dart';
import 'package:provider/provider.dart';

import 'package:payttmm1/screens/home/home.dart';

bool pressAttention = false;
class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  final _formKey = GlobalKey<FormState>();

  String friend_id='';
  String if_found='';
  bool found=true;

  bool pressAttention1 = false;
  bool pressAttention2 = false;
  bool pressAttention3 = false;
  bool pressAttention4 = false;

  int length = Home.members.length;
  
  String name(int idx) {
    if(idx < length){
      return Home.members[idx];
    }
    else {
      {
        return "NADA";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Username>>(
        stream: DatabaseServiceForUsers().usernames,
        builder: (context,list) {
          List all_users = list.data;         //List of users collection
          return Scaffold(
            backgroundColor: Colors.pink[100],

            appBar: AppBar(
              title: Text('PayTTMM', style: TextStyle(fontFamily: 'Comics', color: Colors.amber), ),
              backgroundColor: Colors.pink[800],
              actions: <Widget>[

                Text('Payttmm',
               //Displays the username of logged in user
                  style: TextStyle(color: Colors.amber, fontSize: 14.0, fontFamily: 'Comics',),
                  textAlign: TextAlign.right,

                ),

              ],
            ),

            body: Container(

              margin: EdgeInsets.fromLTRB(20, 40, 20, 30),


              child: Form(
                key: _formKey,

                child: Column(
                  children: [

                    SizedBox(
                      height: 20,
                    ),

                    Container(


                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[700],
                      ),
                      height: 220,

                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                            child: TextFormField(
                            style: TextStyle(fontFamily: 'Comics',fontSize: 18,),
                            decoration: InputDecoration(

                                border: new OutlineInputBorder(

                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(20.0),

                                  ),

                                ),
                                hintText: "name",
                                fillColor: Colors.white,
                                filled: true),

                          ),),

                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[700],

                            ),
                            child: TextFormField(

                              //Accepts username to search
                              style: TextStyle(fontFamily: 'Comics',fontSize: 18,),
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                    ),
                                  ),
                                  hintText: "amount",
                                  fillColor: Colors.white,
                                  filled: true),

                            ),),],

                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    RaisedButton(
                        color: Colors.amber,
                        child: Text(
                          'next',
                          style: TextStyle(color: Colors.pink, fontFamily: 'Comics'),
                        ),
                        onPressed: () async {
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      //alignment: Alignment.centerLeft,
                      width: 800,
                      child: Visibility(visible: (Home.members.length > 0), child: RaisedButton(

                        color: pressAttention ? Colors.lightGreenAccent[700] : Colors.white,
                        child: Text(
                          name(0),
                          style: TextStyle(color: Colors.pink, fontFamily: 'Comics',),
                        ),
                        onPressed: () => setState(() => pressAttention = !pressAttention),
                        highlightColor: Colors.lightGreenAccent,
                    ),),),

                    Container(
                      //alignment: Alignment.centerLeft,
                      width: 800,
                      child: Visibility(visible: (Home.members.length > 1), child: RaisedButton(

                          color: pressAttention1 ? Colors.lightGreenAccent[700] : Colors.white,
                          highlightColor: Colors.lightGreenAccent,
                          child: Text(
                            name(1),
                            style: TextStyle(color: Colors.pink, fontFamily: 'Comics',),
                          ),
                        onPressed: () => setState(() => pressAttention1 = !pressAttention1),
                      ),),),

                    Container(
                      //alignment: Alignment.centerLeft,
                      width: 800,
                      child: Visibility(visible: (Home.members.length > 2), child: RaisedButton(
                          highlightColor: Colors.lightGreenAccent,
                          color: pressAttention2 ? Colors.lightGreenAccent[700] : Colors.white,
                          child: Text(
                            name(2),
                            style: TextStyle(color: Colors.pink, fontFamily: 'Comics',),
                          ),
                        onPressed: () => setState(() => pressAttention2 = !pressAttention2),
                      ),),),

                    Container(
                      //alignment: Alignment.centerLeft,
                      width: 800,
                      child: Visibility(visible: (Home.members.length > 3), child: RaisedButton(
                          highlightColor: Colors.lightGreenAccent,
                          color: pressAttention3 ? Colors.lightGreenAccent[700] : Colors.white,
                          child: Text(
                            name(3),
                            style: TextStyle(color: Colors.pink, fontFamily: 'Comics',),
                          ),
                        onPressed: () => setState(() => pressAttention3 = !pressAttention3),
                      ),),),
                  ],
                ),
              ),

            ),
          );
        }
    );
  }
}
