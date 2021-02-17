import 'package:flutter/material.dart';

class ScreenTheme {
  static const Color color1 = Color(0xff191720);
  static const Color color2 = Color(0xff26242D);
  Widget radialWidget(double htx, double wtx) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.96, -0.06),
          radius: 1.606,
          colors: [color1, color2],
          stops: [0.0, 1.0],
        ),
      ),
      height: htx,
      width: wtx,
    );
  }
}
