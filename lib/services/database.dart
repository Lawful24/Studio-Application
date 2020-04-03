import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studio_application/models/request.dart';

class DatabaseService { // nothing else uses this todo: delete?

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference requestCollection = Firestore.instance.collection('requests');

  // request list from snapshot
  Request _requestFromSnapshot(DocumentSnapshot snapshot) {
    return Request(
      title: snapshot.data['title'],
      artist: snapshot.data['artist'],
      date: snapshot.data['date'],
      period: snapshot.data['period'],
      url: snapshot.data['url'] ?? '',
      id: snapshot.data['id']
    );
  }

  //get requests stream
  Stream<Request> get requests {
    return requestCollection.document().snapshots().map(_requestFromSnapshot);
  }
}