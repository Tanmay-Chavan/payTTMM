import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StartLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Column(
        children: <Widget>[
          SizedBox(height: 250,),
          Image(
              image: AssetImage('images/clipart499896.png'),
            height: 100,
          ),
          SizedBox(height: 20,),
          Text(
            'PayTTMM',
            style: TextStyle(
              fontSize: 60,
              fontFamily: 'Mitr',
            ),
          ),
          SizedBox(height: 100,),
          SpinKitCircle(
            color: Colors.pink,
            size: 60,
          )
        ],
      ),
    );
  }
}
