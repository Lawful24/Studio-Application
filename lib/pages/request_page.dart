import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studio_application/services/database.dart';
import 'package:studio_application/shared/constants.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {

  final _formKey = GlobalKey<FormState>();

  // Text field state
  String title = '';
  String artist = '';
  String error = '';

  // Date picker and drop-down
  DateTime date = DateTime.now();
  String dateString = "${DateTime.now()}".split(' ')[0];
  List<String> periods = ['2. (9:40 - 9:45)', '3. (10:35 - 10:55)', '4. (11:40 - 11:50)', '5. (12:35 - 12:45)']; // not a valid solution
  String period = '';
  String dropdownValue;

  updateCounter(int currentMonth) {

    // Logic to update the month parameter in the counter document
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(DatabaseService.counterDocRef);

      int snapMonthData = freshSnap.data['month'];

      // Resets the counter document every month
      if (snapMonthData != currentMonth) {
        transaction.update(freshSnap.reference, {
          'numOfRequests': 0,
          'isPlayedCounter': 0,
          'month': currentMonth
        });
        DatabaseService.wipeOutCollection('history');
      }
    });

    // Increment the number of requests in the counter document
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(DatabaseService.counterDocRef);
      transaction.update(DatabaseService.counterDocRef, {
        'numOfRequests': freshSnap['numOfRequests'] + 1,
      });
    });
  }

  // Date picker widget builder
  Future<Null> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(now.year, now.month, now.day),
        lastDate: DateTime(now.year + 2) // needs adjustment in the future
    );

    // Handling illegal dates
    if (picked != null && picked != date)
      setState(() {
        if (picked.weekday < 6) {
          date = picked;
          dateString = '$date'.split(' ')[0];
        } else {
          dateString = 'Choose a valid date.'; // does not handle holidays
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService.requestCollection.snapshots(),
        builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.lightBlueAccent[200],
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
          body: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'Title'),
                            validator: (val) => val.isEmpty ? 'Enter the title' : null,
                            controller: controller,
                            onChanged: (val) {
                              setState(() => title = val);
                            }
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'Artist'),
                            validator: (val) => val.isEmpty ? 'Enter the artist' : null,
                            controller: secondController,
                            onChanged: (val) {
                              setState(() => artist = val);
                            }
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            width: 300.0,
                            height: 50.0,
                            child: RaisedButton.icon(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              color: Colors.white,
                              icon: Icon(Icons.date_range),
                              label: Text(
                                '$dateString',
                                style: TextStyle(fontSize: 20.0)
                              ),
                              onPressed: () => _selectDate(context)
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    DropdownButton(
                      value: dropdownValue, // error if value is not null when the widget is first built
                      items: periods.map((period) {
                        return DropdownMenuItem(
                            value: period,
                            child: Text(
                                '$period',
                                textAlign: TextAlign.center, // does not work
                                style: TextStyle(
                                    color: Colors.black
                                )
                            )
                        );
                      }).toList(),
                      hint: Text(
                        'Choose the period',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white
                        )
                      ),
                      isExpanded: true,
                      onChanged: (val) {
                        setState(() => period = val);
                        dropdownValue = val;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.send),
            onPressed: () async { // too many async functions?
              if(_formKey.currentState.validate()) {
                setState(() async {

                  if (period == null) period = 'No selected period';
                  int currentMonth = DateTime.now().month;

                  // FATAL EXCEPTION: AsyncTask #8
                  DatabaseService.counterDocRef.setData(updateCounter(currentMonth)); // runs second, supposed to run second
                  int numOfRequests = snapshot.data.documents[0]['numOfRequests'];
                  String requestID = DatabaseService.generateRequestID(numOfRequests, currentMonth);

                  DatabaseService.requestCollection.document(requestID).setData({ // runs first, supposed to run second. try await?
                    'title': title,
                    'artist': artist,
                    'date': dateString,
                    'period': period,
                    'isPlayed': false,
                  });
                });
              }
              controller.text = '';
              secondController.text = '';
            }
          ),
        );
      }
    );
  }
}
