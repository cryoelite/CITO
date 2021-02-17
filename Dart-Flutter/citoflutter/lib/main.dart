import 'package:flutter/material.dart';
import 'dart:math' show pow;

main() {
  runApp(MaterialApp(
    home: Page1(),
  ));
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  double x = 0.0;
  double y = 0.0;
  List ss = [];
  double z = 0.0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Transform(
          transform: Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, x, y, z, 1)
            ..setEntry(3, 2, 0.001)
            ..rotateX(x)
            ..rotateY(y)
            ..rotateZ(z),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onDoubleTap: () => Navigator.of(context).push(_createRoute()),
            onPanUpdate: (details) {
              setState(() {
                print("oan and $x $y $z");

                x = x + details.delta.dy / 100;
                y = y - details.delta.dx / 100;
              });
            },
            child: Container(
              height: 120,
              width: 120,
              color: Colors.red,
            ),
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
      Offset begin = Offset(1, 0);
      Offset end = Offset(0, 0);
      Curve curve = Curves.bounceIn;
      Animatable<Offset> tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      Animation offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
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
