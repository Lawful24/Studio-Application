import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studio_application/services/database.dart';

class Blacklist extends StatefulWidget {
  @override
  _BlacklistState createState() => _BlacklistState();
}

class _BlacklistState extends State<Blacklist> {

  _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    return Center(
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 0),
        child: Wrap(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    snapshot['title'],
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  subtitle: Text(
                    snapshot['artist'],
                    style: TextStyle(
                        color: Colors.white
                    ),
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
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Blacklist',
          style: TextStyle(
              color: Colors.blue[800]
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: DatabaseService.blacklistCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    Text(
                      'No songs in the Blacklist.',
                      style: TextStyle(
                        color: Colors.white,
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
                      _buildListItem(context, snapshot.data.documents[snapshot.data.documents.length - index - 1])
                    ],
                  ),
                );
              }
            );
          }
        }
      )
    );
  }
}