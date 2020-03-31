import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studio_application/models/request.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference requestCollection = Firestore.instance.collection('requests');

  // request list from snapshot
  List<Request> _requestListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Request(
        title: doc.data['title'],
        artist: doc.data['artist'],
        date: doc.data['date'],
        url: doc.data['url'] ?? '',
        id: doc.data['id']
      );
    });
  }

  //get requests stream
  Stream<List<Request>> get requests {
    return requestCollection.snapshots().map(_requestListFromSnapshot);
  }

}