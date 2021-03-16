import 'package:flutter/material.dart';

class SignIn1 extends StatefulWidget {
  @override
  _SignIn1State createState() => _SignIn1State();
}

class _SignIn1State extends State<SignIn1> {

  void fn() {
    print('hello world!');
//  return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xe60073ff),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              // 'images/circle-cropped.png'
              SizedBox(
                height:100,
              ),
              Image(
                image: AssetImage('images/clipart499896.png'),
                height: 75,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 70, 30, 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "email ID",
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 40),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "password",
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                height: 50,
                child: TextButton(
                  onPressed: fn,
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.amber),
                      foregroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent)),
                  child: Text("LOG IN"),
                ),
              ),

              Container(
                height: 10,
                margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Divider(thickness: 2, color: Colors.yellow,),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(30, 15, 30, 20),
                height: 50,
                child: TextButton(
                  onPressed: fn,
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent),
                      foregroundColor:
                      MaterialStateProperty.all(Colors.amber)),
                  child: Text("SIGN UP"),
                ),
              ),
            ],
          ),
        ));
  }
}
