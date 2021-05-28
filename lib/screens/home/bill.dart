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
retItems(int idx) {
    //String nnn;
    //nnn = Group.main_bill[0];
    // for(int i=0;i < Group.main_bill[idx].length; i++) {
    //   nnn += ', ' + Group.main_bill[i] ;
    // }

  return Group.main_bill[idx].items.join(" ");
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
              color: Colors.yellow[100], //Color(0xF2EECBFF),
              margin: EdgeInsets.fromLTRB(40, 20, 40, 30),
              width: 500,
              child: Column(children: [Text(Group.main_bill[0].name +"'s share:   " + Group.main_bill[1].total.toString(), style: TextStyle(color: Colors.blue[900], fontSize: 24.0, fontFamily: 'Comics',),),
                SizedBox(height: 10,),
                Text(retItems(0), style: TextStyle(color: Colors.blue[900], fontSize: 16.0, fontFamily: 'Comics',),),
                SizedBox(height: 10,),
                //Text(, style: TextStyle(color: Colors.blue[900], fontSize: 24.0, fontFamily: 'Comics',),),
                Text(Group.main_bill[1].name +"'s share:   " + Group.main_bill[1].total.toString(), style: TextStyle(color: Colors.blue[900], fontSize: 24.0, fontFamily: 'Comics',),),
                SizedBox(height: 10,),
                Text(retItems(1), style: TextStyle(color: Colors.blue[900], fontSize: 16.0, fontFamily: 'Comics',),),
                SizedBox(height: 10,),
                Text(Group.main_bill[2].name +"'s share:   " + Group.main_bill[2].total.toString(), style: TextStyle(color: Colors.blue[900], fontSize: 24.0, fontFamily: 'Comics',),),
                SizedBox(height: 10,),
                Text(retItems(2), style: TextStyle(color: Colors.blue[900], fontSize: 16.0, fontFamily: 'Comics',),),
                SizedBox(height: 10,),
                Text(Group.main_bill[3].name +"'s share:   " + Group.main_bill[3].total.toString(), style: TextStyle(color: Colors.blue[900], fontSize: 24.0, fontFamily: 'Comics',),),
                Text(retItems(3), style: TextStyle(color: Colors.blue[900], fontSize: 16.0, fontFamily: 'Comics',),),
                SizedBox(height: 10,),],),


            ),
          );
        }
    );
  }
}
