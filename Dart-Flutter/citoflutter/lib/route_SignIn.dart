import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:citoflutter/class_screenSize.dart';
import 'package:citoflutter/class_screenTheme.dart';
import 'package:citoflutter/class_firebaseAuth.dart';

class RouteSignIn extends StatefulWidget {
  @override
  _RouteSignInState createState() => _RouteSignInState();
}

class _RouteSignInState extends State<RouteSignIn> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final double defLeftPadding = ScreenSize.w * 10;

  Widget buildInputBox({Widget childWidget}) {
    return Container(
      width: (ScreenSize.maxw) - (ScreenSize.w * 20),
      height: ScreenSize.h * 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(0xff1E1C24),
          border: Border.all(color: Color(0xff34333C))),
      child: childWidget ?? Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              left: defLeftPadding,
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
              left: defLeftPadding,
              child: Container(
                height: ScreenSize.h * 25,
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildInputBox(
                        childWidget: Padding(
                          padding: EdgeInsets.only(
                              top: ScreenSize.h * 0.8, left: ScreenSize.w * 6),
                          child: TextField(
                            controller: usernameController,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.emailAddress,
                            style: GoogleFonts.kameron(
                                color: Colors.white,
                                fontSize: ScreenSize.h * 3.5),
                            decoration: InputDecoration(
                              hintText: "Phone, Email or Username",
                              hintStyle: GoogleFonts.kameron(
                                color: Color(
                                  0xff656570,
                                ),
                                fontSize: ScreenSize.w * 6.8,
                              ),
                            ),
                            enableSuggestions: true,
                            autocorrect: false,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              paste: true,
                              cut: true,
                              selectAll: true,
                            ),
                          ),
                        ),
                      ),
                      buildInputBox(
                        childWidget: Padding(
                          padding: EdgeInsets.only(
                              top: ScreenSize.h * 0.8, left: ScreenSize.w * 6),
                          child: TextField(
                            controller: passwordController,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.emailAddress,
                            style: GoogleFonts.kameron(
                                color: Colors.white,
                                fontSize: ScreenSize.h * 3.5),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: GoogleFonts.kameron(
                                color: Color(
                                  0xff656570,
                                ),
                                fontSize: ScreenSize.w * 6.8,
                              ),
                            ),
                            enableSuggestions: true,
                            autocorrect: false,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              paste: true,
                              cut: true,
                              selectAll: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: ScreenSize.h * 95,
              child: Container(
                child: Container(
                  width: ScreenSize.maxw,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.kameron(
                            color: Color(
                              0xff656570,
                            ),
                            fontSize: ScreenSize.w * 6,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Register",
                            style: GoogleFonts.kameron(
                              color: Colors.white,
                              fontSize: ScreenSize.w * 6,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              'SignIn',
                              (_) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: ScreenSize.h * 102,
              left: defLeftPadding,
              child: Container(
                width: (ScreenSize.maxw) - (ScreenSize.w * 20),
                height: ScreenSize.h * 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: FlatButton(
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: GoogleFonts.kameron(
                        color: Colors.black,
                        fontSize: ScreenSize.w * 8,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
