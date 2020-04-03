import 'package:flutter/material.dart';
import 'package:studio_application/admin_pages/request_list.dart';

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
}