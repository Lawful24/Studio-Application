import 'package:flutter/material.dart';
import 'package:studio_application/shared/constants.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Feedback',
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
                decoration: textInputDecoration.copyWith(
                  hintText: 'Leave a comment NOW',
                  contentPadding: EdgeInsets.symmetric(vertical: 50.0),
                ),
                textAlign: TextAlign.center, //todo: format this so that the text is broken into lines and starts at the top left corner
              ),
              SizedBox(height: 20.0),
              RaisedButton.icon(
                onPressed: () {},
                label: Text('Send message'),
                icon: Icon(Icons.mail_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}