import 'package:flutter/material.dart';
import 'package:studio_application/admin_pages/blacklist_list.dart';
import 'package:studio_application/services/database.dart';
import 'package:studio_application/shared/constants.dart';

class AdminBlacklistPage extends StatefulWidget {
  @override
  _AdminBlacklistPageState createState() => _AdminBlacklistPageState();
}

class _AdminBlacklistPageState extends State<AdminBlacklistPage> {

  final _formKey = GlobalKey<FormState>();

  String blacklistID = '';
  String _title = '';
  String _artist = '';

  _showAddSongPanel() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
        child: Form( // covered by the keyboard
          key: _formKey,
          child: Wrap(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Add a new song to the Blacklist.'),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Title'),
                    validator: (val) => val.isEmpty ? 'Enter a title' : null,
                    controller: controller,
                    onChanged: (val) => setState(() => _title = val)
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Artist'),
                    validator: (val) => val.isEmpty ? 'Enter an artist' : null,
                    controller: secondController,
                    onChanged: (val) => setState(() => _artist = val)
                  ),
                  SizedBox(height: 20),
                  RaisedButton.icon(
                    icon: Icon(
                      Icons.queue_music,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Add to Blacklist',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    color: Colors.black,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        DatabaseService.blacklistCollection.add({
                          'title': _title,
                          'artist': _artist
                        });
                      }
                      controller.text = '';
                      secondController.text = '';
                    },
                  )
                ],
              ),
            ],
          ),
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'The Void',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            label: Text(
              'Add',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              _showAddSongPanel();
            },
          )
        ],
      ),
      body: BlacklistList()
    );
  }
}