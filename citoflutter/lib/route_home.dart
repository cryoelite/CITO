import 'package:citoflutter/class_screenSize.dart';
import 'package:citoflutter/class_screenTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
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
        child: Stack(
          children: [
            ScreenTheme().radialWidget(
              ScreenSize.maxh,
              ScreenSize.maxw,
            ),
            Positioned(
              top: ScreenSize.h * 16,
              left: ScreenSize.w * 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's sign you in.",
                    style: GoogleFonts.kameron(
                      color: Colors.white,
                      fontSize: ScreenSize.w * 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\nWelcome Back.\nYou've been missed!",
                    style: GoogleFonts.kameron(
                      color: Colors.white,
                      fontSize: ScreenSize.w * 8,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: ScreenSize.h * 50,
              left: ScreenSize.w * 10,
              child: Container(
                height: ScreenSize.h * 25,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (ScreenSize.maxw) - (ScreenSize.w * 20),
                      height: ScreenSize.h * 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: (ScreenSize.maxw) - (ScreenSize.w * 20),
                      height: ScreenSize.h * 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: ScreenSize.h * 100,
              left: ScreenSize.w * 10,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: ScreenSize.maxw,
                      child: Center(
                        child: Text(
                          "Don't have an account?",
                          style: GoogleFonts.kameron(
                            color: Color(
                              0xff656570,
                            ),
                            fontSize: ScreenSize.w * 6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
