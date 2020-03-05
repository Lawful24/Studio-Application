import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void load() async {
    print('loaded');
    await Future.delayed(Duration(seconds: 2)); //TODO: change this placeholder with an actual Future call
    Navigator.pushReplacementNamed(context, '/home');
  }

  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 60.0
        ),
      ),
    );
  }
}
