import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          'About us',
          style: TextStyle(
            color: Colors.red[700]
          )
        ),
        centerTitle: true,
      ),
    );
  }
}
//TODO: design a simple page with some data: email, instagram, phone number, number of members, executives, etc.