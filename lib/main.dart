import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payttmm1/shared/start_loading.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartLoading(),
    );
  }
}
