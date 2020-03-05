import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/request');
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
            SizedBox(height: 30.0,),
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/blacklist');
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
            SizedBox(height: 30.0,),
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/feedback');
                  });
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
            SizedBox(height: 30.0,),
            Container(
              width: menuButtonWidth,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/contact');
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
