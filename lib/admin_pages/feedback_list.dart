import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studio_application/services/database.dart';

class FeedbackList extends StatefulWidget {
  @override
  _FeedbackListState createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {

  _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    return Center(
      child: Container(
        child: Wrap(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(snapshot['message']),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService.feedbackCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('No new messages.');
          } else {
            return ListView.builder(
              itemExtent: 100.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      _buildListItem(context, snapshot.data.documents[(snapshot.data.documents.length - index - 1)])
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
