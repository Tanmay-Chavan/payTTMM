import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payttmm1/screens/home/friend_finder.dart';
import 'package:payttmm1/services/auth.dart';
import 'package:payttmm1/models/user.dart';
import 'package:payttmm1/services/database.dart';
import 'package:provider/provider.dart';

import 'package:payttmm1/screens/home/home.dart';
import 'package:payttmm1/screens/home/group.dart';

class Bill extends StatefulWidget {

  @override
  _BillState createState() => _BillState();

}


class _BillState extends State<Bill> {
  final _formKey = GlobalKey<FormState>();


  bool found=true;



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
              color: Colors.yellow[100], //Color(0xF2EECBFF),
              margin: EdgeInsets.fromLTRB(40, 20, 40, 30),
              width: 500,
              child: Column(children: [Text(Group.main_bill[0].name,style: TextStyle(color: Colors.blue[900], fontSize: 14.0, fontFamily: 'Comics',),),
                SizedBox(height: 20,),
                Text(Group.main_bill[1].name +"'s share:   " + Group.main_bill[1].total.toString(), style: TextStyle(color: Colors.blue[900], fontSize: 24.0, fontFamily: 'Comics',),),],),

            ),
          );
        }
    );
  }
}
