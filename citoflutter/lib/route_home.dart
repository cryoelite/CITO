import 'package:citoflutter/class_screenSize.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home(BuildContext ctx) {
    print(ctx.size.height);
    ScreenSize(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              height: 233,
              child: Container(
                child: Text(ScreenSize.h.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
