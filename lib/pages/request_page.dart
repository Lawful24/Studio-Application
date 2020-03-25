import 'package:flutter/material.dart';
import 'package:studio_application/models/request.dart';
import 'package:studio_application/models/user.dart';
import 'package:studio_application/shared/constants.dart';
import 'package:studio_application/services/database.dart';
import 'package:studio_application/services/auth.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {

  final _formKey = GlobalKey<FormState>();

  // text field state
  String title = '';
  String artist = '';
  String date = ''; //todo: format?
  String url = '';
  String error = '';
  Request request;

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
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Title'),
                validator: (val) => val.isEmpty ? 'Enter the artist' : null,
                onChanged: (val) {
                  setState(() => title = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Artist'),
                validator: (val) => val.isEmpty ? 'Enter the artist' : null,
                onChanged: (val) {
                  setState(() => artist = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Date'), //todo: format?
                validator: (val) => val.isEmpty ? 'Enter the artist' : null,
                onChanged: (val) {
                  setState(() => date = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Link (optional)'),
                //validator: (val) => val.isEmpty ? 'Enter the artist' : null,
                onChanged: (val) {
                  setState(() => url = val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton.icon(
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    setState(() {
                      //DatabaseService().updateUserData(name, requests); //todo: figure this out and finish the setState
                    });
                  }
                },
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
