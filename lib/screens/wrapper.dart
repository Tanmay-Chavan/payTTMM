import 'package:flutter/material.dart';
import 'package:payttmm1/models/user.dart';
import 'package:payttmm1/screens/authenticate/authenticate.dart';
import 'package:payttmm1/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    //return either Home or Authenticate widget
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
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


