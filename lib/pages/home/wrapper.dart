import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_application/models/user.dart';
import 'package:studio_application/pages/authenticate/authenticate.dart';
import 'package:studio_application/pages/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
