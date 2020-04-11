import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_application/home/wrapper.dart';
import 'package:studio_application/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        theme: ThemeData(fontFamily: 'Rubik'),
        debugShowCheckedModeBanner: false
      ),
    );
  }
}
