import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studio_application/services/database.dart';
import 'package:studio_application/shared/constants.dart';

class RequestList extends StatefulWidget {
  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {

  int numOfRequests;
  int isPlayedCount;
  int deletedCount;

  _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    return Center(
      child: Card(
        margin: EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 0),
        child: Wrap(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.queue_music),
                  title: Text(snapshot['title']),
                  subtitle: Text(snapshot['artist']),
                ),
                Divider(),
                ButtonBar(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Broadcasted',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () {
                        snapshot.reference.updateData({
                          'isPlayed': true
                        });
                        if (snapshot['isPlayed'] == false) {
                          Firestore.instance.runTransaction((transaction) async {
                            DocumentSnapshot freshSnap = await transaction.get(DatabaseService.counterDocRef);
                            transaction.update(DatabaseService.counterDocRef, {
                              'isPlayedCount': freshSnap.data['isPlayedCount'] + 1
                            });
                          });
                        }

                        // Migrating data to a collection where broadcast requests are stored
                        // isPlayedCount = snapshot.data.documents[0]['isPlayedCount']; // todo: read needed here
                        int currentMonth = DateTime.now().month;
                        String historyID = DatabaseService.generateRequestID(isPlayedCount, currentMonth);
                        DatabaseService.historyCollection.document(snapshot.documentID).setData({
                          'title': snapshot['title'],
                          'artist': snapshot['artist'],
                          'date': snapshot['date'],
                          'period': snapshot['period'],
                          'url': snapshot['url'],
                          'isPlayed': snapshot['isPlayed'],
                        });
                        snapshot.reference.delete();
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'Delete',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () {
                        Firestore.instance.runTransaction((transaction) async {
                          DocumentSnapshot freshSnap = await transaction.get(DatabaseService.counterDocRef);
                          transaction.update(DatabaseService.counterDocRef, {
                            'deletedCount': freshSnap.data['deletedCount'] + 1
                          });
                        });
                        snapshot.reference.delete();
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService.requestCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Out of requests.');
          } else {
            return ListView.builder(
                itemExtent: 160.0,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {

                  // Getting data from the counter document
                  if (snapshot.data.documents[index]['id'] == '0000') {

                    // Getters of the counter document
                    numOfRequests = snapshot.data.documents[0]['numOfRequests'];
                    isPlayedCount = snapshot.data.documents[0]['isPlayedCount'];
                    deletedCount = snapshot.data.documents[0]['deletedCount'];
                    int n = numOfRequests - deletedCount;

                    return Text('Requests played: ' + '$isPlayedCount' + '/' + '$n');
                  }
                  return Center(
                    child: Column(
                      children: <Widget>[
                        _buildListItem(context, snapshot.data.documents[index])
                      ],
                    ),
                  );
                }
            );
          }
        }
    );
  }
}