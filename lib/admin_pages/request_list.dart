import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_application/admin_pages/request_tile.dart';
import 'package:studio_application/services/database.dart';
import 'package:studio_application/models/request.dart';

class RequestList extends StatefulWidget {
  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {


  @override
  Widget build(BuildContext context) {

    final requests = Provider.of<List<Request>>(context);
    requests.forEach((request) {
      print(request.title);
      print(request.artist);
      print(request.date);
      print(request.url);
    });

    /*return StreamProvider<List<Request>>.value(
      value: DatabaseService().requests,
    );*/

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        return RequestTile(request: requests[index]);
      },
    );
  }
}