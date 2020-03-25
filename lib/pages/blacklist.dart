import 'package:flutter/material.dart';
import 'package:studio_application/models/song.dart';

class Blacklist extends StatefulWidget {
  @override
  _BlacklistState createState() => _BlacklistState();
}

class _BlacklistState extends State<Blacklist> {

  List<Song> blacklist = [
    Song(title: 'Never Gonna Give You Up', artist: 'Rick Astley', duration: '3:33', isExplicit: false),
  ]; //TODO: import the api

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Blacklist',
          style: TextStyle(
            color: Colors.blue[800]
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: blacklist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 9,
                          child: Text(
                            blacklist[index].title
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                              blacklist[index].duration
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      blacklist[index].artist
                    ),
                  ],
                )
              )
            )
          );
        },
      )
    );
  }
}
//TODO: cards should display the names and artists of the songs