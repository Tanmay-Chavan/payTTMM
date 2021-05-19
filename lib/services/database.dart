import 'package:payttmm1/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseServiceForUsers{

  final String uid;
  DatabaseServiceForUsers({this.uid});

  //Collection reference
  final CollectionReference userCollection= Firestore.instance.collection('users');

  //To set the username
  Future<void> updateUserData(String username) async {
    return await userCollection.document(uid).setData({
      'username': username,
    });
  }

  //User data from snapshot
  Username _usernameFromSnapshot(DocumentSnapshot snapshot) {
    return Username(
      uid: uid,
      username: snapshot.data['username']
    );
  }

  //Get user doc stream
  Stream<Username> get username {
    return userCollection.document(uid).snapshots()
        .map(_usernameFromSnapshot);
  }

  //Find a friend method

  List<Username> _usernamesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Username(
          uid: doc.data['uid'],
          username: doc.data['username']
      );
    }).toList();
  }

  //Get users doc stream
  Stream<List<Username>> get usernames {
    return userCollection.snapshots()
        .map(_usernamesFromSnapshot);
  }

}