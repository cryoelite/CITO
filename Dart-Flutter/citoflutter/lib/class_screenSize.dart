import 'package:flutter/cupertino.dart';

class ScreenSize {
  static double h;
  static double maxh;
  static double w;
  static double maxw;
  ScreenSize(BuildContext ctx) {
    final Size mediaq = MediaQuery.of(ctx).size;
    h = mediaq.height / 128;
    maxh = mediaq.height;
    w = mediaq.width / 128;
    maxw = mediaq.width;
  }
}
