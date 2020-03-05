import 'package:flutter/material.dart';

class Request extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Request',
          style: TextStyle(
            color: Colors.blue[800]
          )
        ),
        centerTitle: true,
      ),
    );
  }
}
