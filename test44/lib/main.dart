import 'package:flutter/material.dart';

void main() => runApp(ST1());

class ST1 extends StatelessWidget {
  const ST1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Text("yas"),
              Text("sasd"),
            ],
          ),
        ),
      ),
    );
  }
}
