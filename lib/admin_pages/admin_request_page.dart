import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_application/admin_pages/request_list.dart';
import 'package:studio_application/models/request.dart';
import 'package:studio_application/services/database.dart';

class AdminRequestPage extends StatefulWidget {
  @override
  _AdminRequestPageState createState() => _AdminRequestPageState();
}

class _AdminRequestPageState extends State<AdminRequestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RequestList()
    );
  }
//    return StreamProvider<List<Request>>.value( // stream listener
//      value: DatabaseService().requests, // called stream of requests
//      child: Scaffold(
//        backgroundColor: Colors.blue[800],
//        appBar: AppBar(
//          title: Text('Requests'),
//          backgroundColor: Colors.white,
//        ),
//        body: RequestList(),
//      ),
//    );
//  }
}