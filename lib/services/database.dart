import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference songCollection = Firestore.instance.collection('Songs');

  Future updateUserData(String name, int requests, String messages) async {
    return await songCollection.document(uid).setData({
      'name': name,
      'requests': requests,
      'messages': messages,
    });
  }

}