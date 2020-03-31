import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studio_application/shared/constants.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {

  final _formKey = GlobalKey<FormState>();

  // text field state
  String title = '';
  String artist = '';
  DateTime date = DateTime.now();
  String dateString = "${DateTime.now()}".split(' ')[0];
  String url = '';
  String error = '';
  static CollectionReference requestCollection = Firestore.instance.collection('requests');
  DocumentReference snDocRef = requestCollection.document('0000');

  incrementReqNum() {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(snDocRef);
      await transaction.update(freshSnap.reference, {
        'numOfRequests': freshSnap['numOfRequests'] + 1
      });
    });
  }

  String generateRequestID(int numReq) {
    DateTime now = DateTime.now();
    String monthComponent;
    String nR;
    if (now.month < 10) {
      monthComponent = '0' + now.month.toString();
    } else {
      monthComponent = now.month.toString();
    }

    if (numReq < 10) {
      nR = '0' + numReq.toString();
    } else {
      nR = numReq.toString();
    }
    return monthComponent + nR;
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(DateTime.now().year + 2) // needs adjustment in the future
    );
    if (picked != null && picked != date)
      setState(() {
        date = picked;
        dateString = "$date".split(' ')[0];
      });
  }

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
      body: StreamBuilder(
        stream: requestCollection.snapshots(),
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Title'),
                    validator: (val) => val.isEmpty ? 'Enter the title' : null,
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
                  Row(
                    children: <Widget>[
                      RaisedButton(
                          child: Text('Pick a date'),
                          color: Colors.white,
                          onPressed: () => _selectDate(context)
                      ),

                      // todo: row alignment

                      Text(("$date".split(' ')[0]))
                    ],
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Link (optional)'),
                    onChanged: (val) {
                      setState(() => url = val);
                    }
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton.icon(
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        setState(() {
                          snDocRef.setData(incrementReqNum());
                          int numOfRequests = (snapshot.data.documents[0]['numOfRequests'] + 1);
                          String requestID = generateRequestID(numOfRequests);
                          requestCollection.document(requestID).setData({
                            'title': title,
                            'artist': artist,
                            'date': dateString,
                            'url': url,
                            'id': requestID
                          });
                        });
                      }
                    },
                    icon: Icon(Icons.send),
                    label: Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
