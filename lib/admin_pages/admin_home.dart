import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studio_application/admin_pages/admin_blacklist.dart';
import 'package:studio_application/admin_pages/admin_history.dart';
import 'package:studio_application/admin_pages/admin_request_page.dart';
import 'package:studio_application/services/auth.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

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
            icon: Icon(Icons.person),
            label: Text('Log out'),
            onPressed: () async {
              await _auth.signOut();
            },
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
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.blue[100],
                color: Colors.white,
                textColor: Colors.grey[700],
                child: Text(
                  'Request list',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminRequestPage()),
                    );
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.blue[100],
                color: Colors.white,
                textColor: Colors.grey[700],
                child: Text(
                  'History',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminHistoryPage()),
                    );
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.blue[100],
                color: Colors.white,
                textColor: Colors.grey[700],
                child: Text(
                  'Blacklist',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminBlacklistPage()),
                    );
                  });
                },
              ),
            ),
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.blue[100],
                color: Colors.white,
                textColor: Colors.grey[700],
                child: Text(
                  'Feedback',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminHistoryPage()),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
