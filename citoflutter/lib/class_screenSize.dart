import 'package:flutter/cupertino.dart';

class ScreenSize {
  static double h;
  static double maxh;
  static double w;
  static double maxw;
  ScreenSize(BuildContext ctx) {
    h = ctx.size.height / 128;
    maxh = ctx.size.height;
    w = ctx.size.width / 128;
    maxw = ctx.size.width;
  }
}
