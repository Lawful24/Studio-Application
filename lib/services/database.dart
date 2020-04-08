import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid }); // do we need a constructor?

  // Collection- and document references
  static final CollectionReference requestCollection = Firestore.instance.collection('requests');
  static final DocumentReference counterDocRef = requestCollection.document('0000');
  static final CollectionReference historyCollection = Firestore.instance.collection('history');
  static final CollectionReference periodCollection = Firestore.instance.collection('periods');
  static final CollectionReference blacklistCollection = Firestore.instance.collection('blacklist');
  static final CollectionReference feedbackCollection = Firestore.instance.collection('feedback');

  static wipeOutCollection(String collectionName) {
    Firestore.instance.collection(collectionName).getDocuments().then((snapshot) {
      for (DocumentSnapshot document in snapshot.documents) {
        document.reference.delete();
      }
    });
  }

  // Custom ID generator
  static String generateRequestID(int num, int currentMonth) {
    String monthComponent;
    String nR;

    if (currentMonth < 10) {
      monthComponent = '0' + currentMonth.toString();
    } else {
      monthComponent = currentMonth.toString();
    }

    if (num < 10) {
      nR = '0' + num.toString();
    } else {
      nR = num.toString();
    }

    return monthComponent + nR;
  }
}