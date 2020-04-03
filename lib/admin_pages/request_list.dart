import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestList extends StatefulWidget {
  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {

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
                        snapshot.reference.setData({
                          'isPlayed': true
                        });
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'Delete',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () {},
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
      stream: Firestore.instance.collection('requests').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('Out of requests.');
        } else {
          return ListView.builder(
            itemExtent: 160.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              if (index == 0) { // a little parkouring to skip the counter document
                index++;
              }
              return Center(
                child: Column(
                  children: <Widget>[
                    // todo: if the request has not been played or deleted yet


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