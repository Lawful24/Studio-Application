import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid }); // do we need a constructor?

  // Collection- and document references
  static final CollectionReference requestCollection = Firestore.instance.collection('requests');
  static final DocumentReference counterDocRef = requestCollection.document('0000');
  static final CollectionReference historyCollection = Firestore.instance.collection('history');

  static wipeOutCollection(String collectionName) {
    Firestore.instance.collection(collectionName).getDocuments().then((snapshot) {
      for (DocumentSnapshot document in snapshot.documents) {
        document.reference.delete();
      }
    });
  }
}