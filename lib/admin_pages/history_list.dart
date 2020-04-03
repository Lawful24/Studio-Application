import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {

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
        stream: Firestore.instance.collection('requests').snapshots(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) { // todo: change this
            return const Text('No broadcast history this month.');
          } else {
            return ListView.builder(
                itemExtent: 80.0,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    index++;
                  }

                  if (snapshot.data.documents[index]['isPlayed'] == true) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          // todo: if the request has been played

                          _buildListItem(context, snapshot.data.documents[index])
                        ],
                      ),
                    );
                  } else {
                    return null;
                  }
                }
            );
          }
        }
    );
  }
}