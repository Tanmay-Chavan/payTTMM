import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payttmm1/screens/home/friend_finder.dart';
import 'package:payttmm1/services/auth.dart';
import 'package:payttmm1/models/user.dart';
import 'package:payttmm1/services/database.dart';
import 'package:provider/provider.dart';

import 'package:payttmm1/screens/home/home.dart';
import 'package:payttmm1/screens/home/bill.dart';


class Group extends StatefulWidget {
  static var main_bill = [];

  @override
  _GroupState createState() => _GroupState();

}

class Member {
  String name;
  double total;
  int idx;
  var items = [];
}



int totalBill=0;
int currValue = 0;
class _GroupState extends State<Group> {
  final _formKey = GlobalKey<FormState>();



  String friend_id='';
  String if_found='';
  bool found=true;
  bool pressAttention = false;
  bool pressAttention1 = false;
  bool pressAttention2 = false;
  bool pressAttention3 = false;
  bool pressAttention4 = false;

  var currChoices = [];



  bool currTaskDone = false;

  var _controller = TextEditingController();
  var _controller2 = TextEditingController();

  int length = Home.members.length;

  String name_item;
  String amount;
  bool firstAction = true;
  var bill = [];


  
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

              margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Form(
                key: _formKey,

                child: Column(
                  children: [

                    Container(child: Text("total amount: " + totalBill.toString(), style: TextStyle(fontFamily: 'Comics', fontSize: 25),
                    ),
                    ),

                    SizedBox(
                      height: 10,
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

                            child:   new TextFormField(
                              controller: _controller,
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

                              onChanged: (val) {
                                setState(() => name_item = val);
                              },
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
                              controller: _controller2,
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

                              onChanged: (val) {
                                setState(() => currValue = int.parse(val));
                              },

                            ),),],

                      ),
                    ),

                    SizedBox(
                      height: 20,
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

                    RaisedButton(
                        color: Colors.amber,
                        child: Text(
                          'next',
                          style: TextStyle(color: Colors.pink, fontFamily: 'Comics'),
                        ),
                        onPressed: () async {

                          if ( firstAction == true) {
                            for(int i =0; i < Home.members.length;i++){
                              var mm = new Member();

                              mm.name = Home.members[i];
                              mm.idx = i;
                              mm.total = 0;
                              bill.insert(i, mm);
                              firstAction = false;
                            }
                          }

                          currChoices = [pressAttention, pressAttention1, pressAttention2, pressAttention3, ];  // pressAttention4
                          int selected = 0;
                          for(bool kkk in currChoices){
                            if(kkk == true) {
                              selected++;
                            }
                          }
                          totalBill += currValue;

                          for(Member j in bill){

                            if (currChoices[j.idx] == true ){
                              j.items.add(name_item);
                              j.total += currValue / selected ;
                            }

                          }
                          currValue = 0;
                          pressAttention = false;
                          pressAttention1 = false;
                          pressAttention2 = false;
                          pressAttention3 = false;
                          pressAttention4 = false;

                          _controller.clear();
                          _controller2.clear();
                           setState(() => pressAttention == false);

                        }
                    ),

                    RaisedButton(
                        color: Colors.amber,
                        child: Text(
                          'finish!',
                          style: TextStyle(color: Colors.pink, fontFamily: 'Comics'),
                        ),
                        onPressed: () async {
                          Group.main_bill = bill;
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Bill()));
                        },
                    ),
                  ],
                ),
              ),

            ),
          );
        }
    );
  }
}
