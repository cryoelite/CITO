import 'package:citoflutter/class_screenSize.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget pp() {
    
    return Text("pp");
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: ScreenSize.maxh / 2,
                child: Container(
                  child: pp(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
