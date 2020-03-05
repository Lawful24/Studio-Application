import 'package:flutter/material.dart';
import 'package:studio_application/pages/home/wrapper.dart';
import 'package:studio_application/pages/loading.dart';
//import 'package:studio_application/pages/login.dart';
import 'package:studio_application/pages/home/home.dart';
import 'package:studio_application/pages/request.dart';
import 'package:studio_application/pages/blacklist.dart';
import 'package:studio_application/pages/feedback.dart';
import 'package:studio_application/pages/id.dart';

void main() => runApp(MaterialApp(
  home: Wrapper(),
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
//TODO: android/build.gradle has 4.0.1 in dependencies, might need to revert to 4.3.3
