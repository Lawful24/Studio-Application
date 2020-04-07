import 'package:flutter/material.dart';
import 'package:studio_application/services/database.dart';
import 'package:studio_application/shared/constants.dart';

class FeedbackPage extends StatefulWidget {

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();

  String _message = '';

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
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Message us! Tell us what you think!',
                  contentPadding: EdgeInsets.symmetric(vertical: 50.0),
                ),
                validator: (val) => val.isEmpty ? 'This cannot remain blank' : null,
                textAlign: TextAlign.center, //todo: format this so that the text is broken into lines and starts at the top left corner
                onChanged: (val) => setState(() => _message = val),
              ),
              SizedBox(height: 20.0),
              RaisedButton.icon(
                label: Text('Send message'),
                icon: Icon(Icons.mail_outline),
                onPressed: () {
                  DatabaseService.feedbackCollection.add({
                    'message': _message
                  });
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}