import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studio_application/services/database.dart';
import 'package:studio_application/shared/constants.dart';

class BlacklistList extends StatefulWidget {
  @override
  _BlacklistListState createState() => _BlacklistListState();
}

class _BlacklistListState extends State<BlacklistList> {

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
                  title: Text(snapshot['title']),
                  subtitle: Text(snapshot['artist']),
                  trailing: FloatingActionButton(
                    child: Icon(Icons.delete),
                    onPressed: () {
                      snapshot.reference.delete();
                    },
                  ),
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
        stream: DatabaseService.blacklistCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('No songs in the Blacklist.');
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
