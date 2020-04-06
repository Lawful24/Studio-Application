import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studio_application/services/database.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {

  int isPlayedCount;

  _buildListItem(BuildContext context, DocumentSnapshot document) {
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
                  title: Text(document['title']),
                  subtitle: Text(document['artist']),
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
        stream: DatabaseService.historyCollection.snapshots(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Text('No broadcast history this month.');
          } else {
            return ListView.builder(
                itemExtent: 80.0,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
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