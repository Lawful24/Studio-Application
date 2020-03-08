import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {

    final songs = Provider.of<QuerySnapshot>(context);
    for (var doc in songs.documents) {
      print(doc.data);
    }

    return Container(

    );
  }
}
