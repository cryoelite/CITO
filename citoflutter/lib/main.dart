import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Page1(),
  ));
}

class Page1 extends StatelessWidget {
  Offset offset1 = Offset(0.4, 0.7);
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(offset1.dx)
        ..rotateY(offset1.dy),
      alignment: FractionalOffset.center,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            child: Text('Go!'),
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}
