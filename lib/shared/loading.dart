import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
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
//TODO: sync this class with the stream