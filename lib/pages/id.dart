import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  static List<String> memberList = ['Ardai \"Kalácska\" Balázs', 'Berkes Attila', 'Besenyei Virág', 'Bucsai László', 'Fekete Martin',
    'Kovács Balázs', 'Nagy \"Fikusz\" Dávid', 'Pósán Milán', 'Ujlakán \"Koxos\" Botond', 'Vida \"Hobbit\" Bernadett'];
  int crewSize = memberList.length;

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
      body: ListView(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 15.0),
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icon.png'),
              radius: 40.0
            )
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              'T.Á.G. Stúdió',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                letterSpacing: 2.0
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Leader',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black38
            )
          ),
          SizedBox(height: 5.0),
          Text(
            'Kovács István',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white
            )
          ),
          SizedBox(height: 30.0),
          Text(
            'Student Leader',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black38
            )
          ),
          SizedBox(height: 5.0),
          Text(
            'Tárkányi László',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white
            )
          ),
          SizedBox(height: 30.0),
          Text(
            'Social Media Manager',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black38
            )
          ),
          SizedBox(height: 5.0),
          Text(
            'Silling Dorottya',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white
            )
          ),
          SizedBox(height: 30.0),
          Text(
            'Members ($crewSize)',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black38
            )
          ),
          SizedBox(height: 5.0),
          Text(
            memberList.toString(),
            style: TextStyle(
              fontSize: 15.0,
              letterSpacing: 2.0,
              color: Colors.white
            )
          ),
          SizedBox(height: 30.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.email,
                color: Colors.grey[400],
              ),
              SizedBox(width: 10.0),
              Text(
                'studio@toharpadgimnazium.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0
                )
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.camera_alt,
                color: Colors.grey[400],
              ),
              SizedBox(width: 10.0),
              Text(
                '@tagstudioofficial56',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0
                )
              ),
            ],
          ),
        ],
      )
    );
  }
}
//TODO: design a simple page with some data: email, instagram, phone number, number of members, executives, etc.