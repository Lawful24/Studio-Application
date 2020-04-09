import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studio_application/services/database.dart';

class FeedbackList extends StatefulWidget {
  @override
  _FeedbackListState createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {

  _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    return Card(
      margin: EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 0),
      child: Wrap(
        children: <Widget>[
          ListTile(
            title: Text(snapshot['message']),
            // subtitle: [the user's email address] // for future development
            trailing: Container(
              padding: EdgeInsets.all(5.0),
              child: FloatingActionButton(
                child: Icon(Icons.done),
                onPressed: () {
                  snapshot.reference.delete();
                }
              ),
            )
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService.feedbackCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    Text(
                      'No new messages.',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 20.0,
                        fontFamily: 'Rubik'
                      )
                    )
                  ],
                )
              ),
            );
          } else {
            return ListView.builder(
              itemExtent: 80.0,
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
