import 'package:flutter/material.dart';

class ScreenTheme {
  static const Color color1 = Color(0xff191720);
  static const Color color2 = Color(0xff26242D);
  Widget radialWidget(double htx, double wtx) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [color1, color2],
          center: Alignment.bottomLeft,
        ),
      ),
      height: htx,
      width: wtx,
      child: Text(
        "see",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
