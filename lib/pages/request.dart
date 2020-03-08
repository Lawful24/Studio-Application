import 'package:flutter/material.dart';
import 'package:studio_application/shared/constants.dart';

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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Artist'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Title'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Link (optional)'),
              ),
              SizedBox(height: 20.0),
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.send),
                label: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
