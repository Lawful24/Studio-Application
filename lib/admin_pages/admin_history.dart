import 'package:flutter/material.dart';
import 'package:studio_application/admin_pages/history_list.dart';

class AdminHistoryPage extends StatefulWidget {
  @override
  _AdminHistoryPageState createState() => _AdminHistoryPageState();
}

class _AdminHistoryPageState extends State<AdminHistoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Request History'),
          centerTitle: true,
          backgroundColor: Colors.blue[800]
        ),
        backgroundColor: Colors.blue[800],
        body: HistoryList()
    );
  }
}