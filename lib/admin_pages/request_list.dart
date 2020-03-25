import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestList extends StatefulWidget {
  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {

  _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile( //todo: probably should display a column instead of listtile
          leading: Icon(Icons.queue_music),
          title: Text(document['title']),
          subtitle: Text(document['artist']),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    //final requests = Provider.of<List<Request>>(context); // accessing the data from the stream todo: rethink this according to the new collections

    return StreamBuilder(
        stream: Firestore.instance.collection('requests').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Out of requests.');
          } else {
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          }
        }
    );
  }
}