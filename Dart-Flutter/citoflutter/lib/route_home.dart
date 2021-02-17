import 'package:citoflutter/class_screenSize.dart';
import 'package:citoflutter/class_screenTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ScreenTheme.color1,
      ),
    );
    return Scaffold(
      backgroundColor: ScreenTheme.color1,
      body: FutureBuilder<void>(
        future: Future<void>.delayed(
            Duration(
              milliseconds: 5000,
            ), () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            'SignIn',
            (_) => false,
          );
        }),
        builder: (_, AsyncSnapshot<void> connection) {
          return Container();
        },
      ),
    );
  }
}
