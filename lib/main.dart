import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_application/pages/home/wrapper.dart';
import 'package:studio_application/pages/loading.dart';
import 'package:studio_application/pages/login.dart';
import 'package:studio_application/pages/home/home.dart';
import 'package:studio_application/pages/request.dart';
import 'package:studio_application/pages/blacklist.dart';
import 'package:studio_application/pages/feedback.dart';
import 'package:studio_application/pages/id.dart';
import 'package:studio_application/services/auth.dart';
import 'models/user.dart';

void main() => runApp(MyApp(
  /*initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/request': (context) => Request(),
    '/blacklist': (context) => Blacklist(),
    '/feedback': (context) => FeedbackPage(),
    '/contact': (context) => Contact()
  },*/
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
