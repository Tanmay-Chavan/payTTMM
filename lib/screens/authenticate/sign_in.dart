import 'package:flutter/material.dart';
import 'package:payttmm1/services/auth.dart';


class SignIn extends StatefulWidget {


  final Function toggleView;
  SignIn({ this.toggleView });
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = '';
  //bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xe60073ff),
        body: Container(
          child: Form(
            key:_formKey ,
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
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 40),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "password",
                        fillColor: Colors.white,
                        filled: true),
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  height: 50,
                  child: TextButton(

                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.amber),
                        foregroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent)),
                    child: Text("LOG IN"),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        dynamic result=await _auth.signInEmailPassword(email, password);
                        if(result==null){
                          setState((){
                            error='Could not sign in with those credentials';
                          });
                        }
                      }

                    },
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
                    onPressed: () => widget.toggleView(),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent),
                        foregroundColor:
                        MaterialStateProperty.all(Colors.amber)),
                    child: Text("SIGN UP"),
                  ),
                ),


                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0,),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        )
    );
  }
}
