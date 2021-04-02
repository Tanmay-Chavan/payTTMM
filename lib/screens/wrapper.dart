import 'package:flutter/material.dart';
import 'package:payttmm1/screens/authenticate/authenticate.dart';
import 'package:payttmm1/screens/home/home.dart';


class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //return start loading widget for the first 4 secs
    //return Home or Authenticate widget depending on if the user is signed in or not
    return Authenticate();
  }
}

// class Wrapper extends StatefulWidget {
//   @override
//   _WrapperState createState() => _WrapperState();
// }
//
// class _WrapperState extends State<Wrapper> {
//
//   /*bool isTimerDone =false;
//   void initStartScreen() async {
//     await Future.delayed(Duration(seconds: 3), (){
//       print('reached');
//       setState(() {
//         isTimerDone = true;
//         print('Timer: $isTimerDone');
//         return Home();
//       });
//     });
//   }*/
//
// /*
//  @override
//   void initState(){
//     super.initState();
//     initStartScreen();
//   }*/
//
//   @override
//   Widget build(BuildContext context) {
//     return Authenticate();
//   }
// }
//


