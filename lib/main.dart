import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:payttmm1/screens/wrapper.dart';
import 'package:payttmm1/shared/start_loading.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(

      home: Wrapper(),
    );*/
    return 
      MaterialApp(
        home: SplashScreen(
        seconds: 4,
        backgroundColor: Colors.pink[50],
        image: Image.asset('images/clipart499896.png'),
        title: Text(
          'PayTTMM',
          style: TextStyle(
            fontSize: 60,
            fontFamily: 'Mitr',
          ),
        ),
        loaderColor: Colors.pink,
        photoSize: 100,
        navigateAfterSeconds: Wrapper(),
    ),
      );
  }
}
