import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_application/admin_pages/admin_home.dart';
import 'package:studio_application/authenticate/authenticate.dart';
import 'package:studio_application/home/home.dart';
import 'package:studio_application/services/auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      if (user.uid == 'K2JVVw1IlXPFZc0QOMKnYSSiHk13') {
        return AdminHome();
      } else {
        return Home();
      }
    }
  }
}
