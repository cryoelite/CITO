import 'package:citoflutter/class_screenSize.dart';
import 'package:citoflutter/class_screenTheme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:citoflutter/class_screenSize.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  /*  Future<Widget> docCount() async
  {
    final 
  } */

  @override
  Widget build(BuildContext context) {
    ScreenSize(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ScreenTheme.color1,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: ScreenTheme().radialWidget(
          ScreenSize.maxh,
          ScreenSize.maxw,
        ),
      ),
    );
  }
}
