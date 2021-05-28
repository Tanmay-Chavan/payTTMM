import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payttmm1/screens/home/friend_finder.dart';
import 'package:payttmm1/services/auth.dart';
import 'package:payttmm1/models/user.dart';
import 'package:payttmm1/services/database.dart';
import 'package:provider/provider.dart';

import 'package:payttmm1/screens/home/home.dart';
import 'package:payttmm1/screens/home/group.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

class Bill extends StatefulWidget {

  @override
  _BillState createState() => _BillState();

}


class _BillState extends State<Bill> {
  final _formKey = GlobalKey<FormState>();


  bool found=true;
  bool bruh = false;
retItems(int idx) {
    //String nnn;
    //nnn = Group.main_bill[0];
    // for(int i=0;i < Group.main_bill[idx].length; i++) {
    //   nnn += ', ' + Group.main_bill[i] ;
    // }

  return Group.main_bill[idx].items.join(" ");
  }

  sendMail() async {
    final smtpServer = gmail("pbl.payttmm@gmail.com", "paise420");

    String mailContent = "";

    mailContent += "<h2>" + Group.main_bill[0].name +"'s share:   " + Group.main_bill[0].total.toString() + "</h2>";
    mailContent += "<h3>" + retItems(0) + "</h3><br><br>";
    mailContent += "<h2>" + Group.main_bill[1].name +"'s share:   " + Group.main_bill[1].total.toString() + "</h2>";
    mailContent += "<h3>" + retItems(1) + "</h3><br><br>";
    mailContent += "<h2>" + Group.main_bill[2].name +"'s share:   " + Group.main_bill[2].total.toString() + "</h2>";
    mailContent += "<h3>" + retItems(2) + "</h3><br><br>";
    mailContent += "<h2>" + Group.main_bill[3].name +"'s share:   " + Group.main_bill[3].total.toString() + "</h2>";
    mailContent += "<h3>" + retItems(3) + "</h3><br><br>";

    final message = Message()
      ..from = Address("magician685@yahoo.com", 'payTTMM team')
      ..recipients.add('earendil01tc@gmail.com')
    // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Your bill!'
     // ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>PayTTMM BILL</h1>\n<p><h1>Hi! thi bill was splitted as follows</h1><br></p>" + mailContent;


    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }

    // final MailOptions mailOptions = MailOptions(
    //   body: 'a long body for the email <br> with a subset of HTML',
    //   subject: 'the Email Subject',
    //   recipients: ['earendil01tc@gmail.com'],
    //   isHTML: true,
    //   // bccRecipients: ['other@example.com'],
    //   // ccRecipients: ['third@example.com'],
    //   // attachments: [ 'path/to/image.png', ],
    // );
    //
    // String platformResponse;
    //
    // final MailerResponse response = await FlutterMailer.send(mailOptions);
    // switch (response) {
    //   case MailerResponse.saved: /// ios only
    //     platformResponse = 'mail was saved to draft';
    //     break;
    //   case MailerResponse.sent: /// ios only
    //     platformResponse = 'mail was sent';
    //     break;
    //   case MailerResponse.cancelled: /// ios only
    //     platformResponse = 'mail was cancelled';
    //     break;
    //   case MailerResponse.android:
    //     platformResponse = 'intent was successful';
    //     break;
    //   default:
    //     platformResponse = 'unknown';
    //     break;
    // }


  }

  @override
  Widget build(BuildContext context) {
    sendMail();
             //List of users collection
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
                SizedBox(height: 10,),
                RaisedButton(child: Text("send mail", style: TextStyle(color: Colors.pink, fontFamily: 'Comics'),), onPressed: () { setState(() => bruh = false); sendMail();}),

              ],),


            ),
          );
        }
}
