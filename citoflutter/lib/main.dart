import 'package:flutter/material.dart';

import 'package:citoflutter/route_home.dart';
import 'package:citoflutter/route_SignIn.dart';
import 'package:citoflutter/route_SignUp.dart';

void main() => runApp(StartApp());

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        'SignUp': (context) => RouteSignUp(),
        'SignIn': (context) => RouteSignIn(),
      },
    );
  }
}
