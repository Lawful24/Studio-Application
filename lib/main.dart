import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_application/authenticate/authenticate.dart';
import 'package:studio_application/authenticate/register.dart';
import 'package:studio_application/authenticate/sign_in.dart';
import 'package:studio_application/home/home.dart';
import 'package:studio_application/home/wrapper.dart';
import 'package:studio_application/services/auth.dart';
import 'package:studio_application/shared/loading.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false
      ),
    );
  }
}
