import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studio_application/pages/blacklist.dart';
import 'package:studio_application/pages/id.dart';
import 'package:studio_application/pages/request_page.dart';
import 'package:studio_application/pages/feedback.dart';
import 'package:studio_application/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();
  double menuButtonWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Main Menu',
          style: TextStyle(
            color: Colors.blue[800]
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.person),
            label: Text('Log out'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestPage()),
                    );
                  });
                },
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.blue[100],
                color: Colors.white,
                textColor: Colors.grey[700],
                child: Text(
                  'Submit a request',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Blacklist()),
                    );
                  });
                },
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.blue[100],
                color: Colors.white,
                textColor: Colors.grey[700],
                child: Text(
                  'Blacklist',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()),
                  );
                },
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.blue[100],
                color: Colors.white,
                textColor: Colors.grey[700],
                child: Text(
                  'Feedback',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contact()),
                    );
                  });
                },
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.blue[100],
                color: Colors.white,
                textColor: Colors.grey[700],
                child: Text(
                  'About us',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
