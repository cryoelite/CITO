import 'package:flutter/material.dart';
import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class POP extends StatelessWidget {
  POP({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 1.0),
            child: Container(
              width: 375.0,
              height: 666.0,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.96, -0.06),
                  radius: 1.606,
                  colors: [const Color(0xff191720), const Color(0xff26242d)],
                  stops: [0.0, 1.0],
                  transform: GradientXDTransform(
                    1.0,
                    0.019,
                    -0.011,
                    0.582,
                    0.005,
                    0.172,
                    Alignment(
                      -0.96,
                      -0.06,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(6.0, 1.5),
            child: SizedBox(
              width: 364.0,
              height: 16.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(290.5, 2.0, 73.0, 14.0),
                    size: Size(363.5, 16.0),
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Right Detail' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(10.5, 0.0, 62.5, 14.0),
                          size: Size(73.0, 14.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Battery' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(36.0, 1.0, 26.5, 11.5),
                                size: Size(62.5, 14.0),
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child:
                                    // Adobe XD layer: 'Battery Icon' (group)
                                    Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 24.0, 11.5),
                                      size: Size(26.5, 11.5),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child:
                                          // Adobe XD layer: 'Battery Outline' (shape)
                                          SvgPicture.string(
                                        _svg_dxasg4,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(25.0, 3.6, 1.5, 4.2),
                                      size: Size(26.5, 11.5),
                                      pinRight: true,
                                      fixedWidth: true,
                                      fixedHeight: true,
                                      child:
                                          // Adobe XD layer: 'Battery Connector' (shape)
                                          SvgPicture.string(
                                        _svg_aikx33,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(2.0, 2.0, 20.0, 7.5),
                                      size: Size(26.5, 11.5),
                                      pinLeft: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      fixedWidth: true,
                                      child:
                                          // Adobe XD layer: 'Battery Fill' (shape)
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 33.0, 14.0),
                                size: Size(62.5, 14.0),
                                pinLeft: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child:
                                    // Adobe XD layer: '100%' (text)
                                    SingleChildScrollView(
                                        child: Text(
                                  '100%',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 12,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.right,
                                )),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.5, 7.0, 12.0),
                          size: Size(73.0, 14.0),
                          pinLeft: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'bluetooth' (shape)
                              SvgPicture.string(
                            _svg_54fa53,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(159.5, 0.0, 44.0, 16.0),
                    size: Size(363.5, 16.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Time' (text)
                        Text(
                      '9:41 AM',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 12,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 3.5, 34.0, 10.0),
                    size: Size(363.5, 16.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Left Detail' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 16.5, 10.0),
                          size: Size(34.0, 10.0),
                          pinLeft: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'Signal' (shape)
                              SvgPicture.string(
                            _svg_j28alt,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(21.0, 0.5, 13.0, 9.0),
                          size: Size(34.0, 10.0),
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'Wifi' (shape)
                              SvgPicture.string(
                            _svg_1d1v2c,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(290.5, 2.0, 73.0, 14.0),
                    size: Size(363.5, 16.0),
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Right Detail' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(10.5, 0.0, 62.5, 14.0),
                          size: Size(73.0, 14.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Battery' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(36.0, 1.0, 26.5, 11.5),
                                size: Size(62.5, 14.0),
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child:
                                    // Adobe XD layer: 'Battery Icon' (group)
                                    Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 24.0, 11.5),
                                      size: Size(26.5, 11.5),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child:
                                          // Adobe XD layer: 'Battery Outline' (shape)
                                          SvgPicture.string(
                                        _svg_dxasg4,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(25.0, 3.6, 1.5, 4.2),
                                      size: Size(26.5, 11.5),
                                      pinRight: true,
                                      fixedWidth: true,
                                      fixedHeight: true,
                                      child:
                                          // Adobe XD layer: 'Battery Connector' (shape)
                                          SvgPicture.string(
                                        _svg_aikx33,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(2.0, 2.0, 20.0, 7.5),
                                      size: Size(26.5, 11.5),
                                      pinLeft: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      fixedWidth: true,
                                      child:
                                          // Adobe XD layer: 'Battery Fill' (shape)
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 33.0, 14.0),
                                size: Size(62.5, 14.0),
                                pinLeft: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child:
                                    // Adobe XD layer: '100%' (text)
                                    SingleChildScrollView(
                                        child: Text(
                                  '100%',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 12,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.right,
                                )),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.5, 7.0, 12.0),
                          size: Size(73.0, 14.0),
                          pinLeft: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'bluetooth' (shape)
                              SvgPicture.string(
                            _svg_54fa53,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(159.5, 0.0, 44.0, 16.0),
                    size: Size(363.5, 16.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Time' (text)
                        Text(
                      '9:41 AM',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 12,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 3.5, 34.0, 10.0),
                    size: Size(363.5, 16.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Left Detail' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 16.5, 10.0),
                          size: Size(34.0, 10.0),
                          pinLeft: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'Signal' (shape)
                              SvgPicture.string(
                            _svg_j28alt,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(21.0, 0.5, 13.0, 9.0),
                          size: Size(34.0, 10.0),
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child:
                              // Adobe XD layer: 'Wifi' (shape)
                              SvgPicture.string(
                            _svg_9znq0s,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 105.0),
            child: Text(
              'Let\'s sign you in.',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 28,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 150.0),
            child: Text(
              'Welcome Back.You\'ve been missed!',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 22,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 270.0),
            child: SizedBox(
              width: 293.0,
              height: 55.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 293.0, 55.0),
                    size: Size(293.0, 55.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: const Color(0xff1e1c24),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff34333c)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(17.0, 18.0, 192.0, 19.0),
                    size: Size(293.0, 55.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Phone, email or username',
                      style: TextStyle(
                        fontFamily: 'Rockwell',
                        fontSize: 16,
                        color: const Color(0xff656570),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 350.0),
            child: SizedBox(
              width: 293.0,
              height: 55.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 293.0, 55.0),
                    size: Size(293.0, 55.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: const Color(0xff1e1c24),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff34333c)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(17.0, 18.0, 71.0, 19.0),
                    size: Size(293.0, 55.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontFamily: 'Rockwell',
                        fontSize: 16,
                        color: const Color(0xff656570),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 590.0),
            child: SizedBox(
              width: 293.0,
              height: 55.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 293.0, 55.0),
                    size: Size(293.0, 55.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(122.0, 18.0, 50.0, 19.0),
                    size: Size(293.0, 55.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontFamily: 'Rockwell',
                        fontSize: 16,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(71.0, 563.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Rockwell',
                  fontSize: 16,
                  color: const Color(0xff656570),
                ),
                children: [
                  TextSpan(
                    text: 'Don\'t have an account? ',
                  ),
                  TextSpan(
                    text: 'Register',
                    style: TextStyle(
                      color: const Color(0xffffffff),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_dxasg4 =
    '<svg viewBox="0.0 0.5 24.0 11.5" ><path transform="translate(0.0, 0.5)" d="M 0 2.5 C 0 1.119288086891174 1.119288086891174 0 2.5 0 L 21.5 0 C 22.88071250915527 0 24 1.119288086891174 24 2.5 L 24 9 C 24 10.38071155548096 22.88071250915527 11.5 21.5 11.5 L 20.14764022827148 11.5 L 0 11.5 L 2.5 11.5 C 1.119288086891174 11.5 0 10.38071155548096 0 9 L 0 2.5 Z" fill="none" fill-opacity="0.47" stroke="#000000" stroke-width="1" stroke-opacity="0.47" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_aikx33 =
    '<svg viewBox="25.0 4.1 1.5 4.2" ><path transform="translate(25.0, 4.13)" d="M 0 0.000204105643206276 C 0.8737806677818298 0.3090051710605621 1.500300049781799 1.142308712005615 1.500300049781799 2.122200012207031 C 1.500300049781799 3.101381778717041 0.8737806677818298 3.935094356536865 0 4.244100570678711 L 0 0.000204105643206276 Z" fill="#ffffff" fill-opacity="0.58" stroke="none" stroke-width="1" stroke-opacity="0.58" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_54fa53 =
    '<svg viewBox="0.5 1.0 7.0 12.0" ><path transform="translate(0.5, 1.0)" d="M 2.999705076217651 11.99970054626465 L 2.999705076217651 11.99790000915527 L 2.999705076217651 7.248600482940674 L 0.7497051954269409 9.500400543212891 L 5.169753876543837e-06 8.749800682067871 L 2.750395059585571 6.000300407409668 L 5.169753876543837e-06 3.249900341033936 L 0.7497051954269409 2.500200271606445 L 2.999695062637329 4.750200271606445 L 2.999705076217651 2.731323149873788e-07 L 7.000205039978027 3.500100374221802 L 4.249804973602295 5.99940013885498 L 7.000205039978027 8.499600410461426 L 3.001505136489868 11.99790000915527 L 2.999705076217651 11.99970054626465 Z M 4.000494956970215 7.000176906585693 L 4.000494956970215 7.000200271606445 L 3.999605178833008 9.749700546264648 L 5.499905109405518 8.459100723266602 L 4.000504970550537 7.000200271606445 L 4.000494956970215 7.000176906585693 Z M 3.999605178833008 2.369700193405151 L 3.999605178833008 5.000400066375732 L 5.499905109405518 3.600000381469727 L 3.999605178833008 2.369700193405151 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_j28alt =
    '<svg viewBox="0.0 0.0 16.5 10.0" ><path  d="M 14.24970054626465 9.999899864196777 C 13.83570003509521 9.999899864196777 13.5 9.664199829101563 13.5 9.250200271606445 L 13.5 0.7497000098228455 C 13.5 0.3357000052928925 13.83570003509521 0 14.24970054626465 0 L 15.75 0 C 16.16399955749512 0 16.49970054626465 0.3357000052928925 16.49970054626465 0.7497000098228455 L 16.49970054626465 9.250200271606445 C 16.49970054626465 9.664199829101563 16.16399955749512 9.999899864196777 15.75 9.999899864196777 L 14.24970054626465 9.999899864196777 Z M 9.749700546264648 9.999899864196777 C 9.335700035095215 9.999899864196777 9 9.664199829101563 9 9.250200271606445 L 9 2.750400066375732 C 9 2.335500001907349 9.335700035095215 1.999800086021423 9.749700546264648 1.999800086021423 L 11.25 1.999800086021423 C 11.66400051116943 1.999800086021423 11.99970054626465 2.335500001907349 11.99970054626465 2.750400066375732 L 11.99970054626465 9.250200271606445 C 11.99970054626465 9.664199829101563 11.66400051116943 9.999899864196777 11.25 9.999899864196777 L 9.749700546264648 9.999899864196777 Z M 5.24970006942749 9.999899864196777 C 4.835700035095215 9.999899864196777 4.5 9.664199829101563 4.5 9.250200271606445 L 4.5 4.750200271606445 C 4.5 4.33620023727417 4.835700035095215 3.999600172042847 5.24970006942749 3.999600172042847 L 6.75 3.999600172042847 C 7.164000034332275 3.999600172042847 7.49970006942749 4.33620023727417 7.49970006942749 4.750200271606445 L 7.49970006942749 9.250200271606445 C 7.49970006942749 9.664199829101563 7.164000034332275 9.999899864196777 6.75 9.999899864196777 L 5.24970006942749 9.999899864196777 Z M 0.7497000098228455 9.999899864196777 C 0.3357000052928925 9.999899864196777 0 9.664199829101563 0 9.250200271606445 L 0 6.249599933624268 C 0 5.83560037612915 0.3357000052928925 5.499900341033936 0.7497000098228455 5.499900341033936 L 2.25 5.499900341033936 C 2.664000034332275 5.499900341033936 2.99970006942749 5.83560037612915 2.99970006942749 6.249599933624268 L 2.99970006942749 9.250200271606445 C 2.99970006942749 9.664199829101563 2.664000034332275 9.999899864196777 2.25 9.999899864196777 L 0.7497000098228455 9.999899864196777 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_1d1v2c =
    '<svg viewBox="21.0 0.5 13.0 9.0" ><path transform="translate(20.99, 0.5)" d="M 4.885791301727295 7.376837253570557 C 5.347670555114746 7.060296058654785 5.906570434570313 6.875100135803223 6.508800029754639 6.875100135803223 C 7.111177444458008 6.875100135803223 7.670251369476318 7.060269355773926 8.132176399230957 7.37662410736084 L 6.508800029754639 9 L 4.885791301727295 7.376837253570557 Z M 6.504300117492676 4.619699954986572 C 5.281896591186523 4.619699954986572 4.158024787902832 5.050030708312988 3.276137113571167 5.767031192779541 L 2.39440393447876 4.885214328765869 C 3.505028963088989 3.946678400039673 4.939706802368164 3.38040018081665 6.504300117492676 3.38040018081665 C 8.071253776550293 3.38040018081665 9.507980346679688 3.948622226715088 10.61910247802734 4.889698028564453 L 9.737421989440918 5.771378040313721 C 8.854942321777344 5.051826953887939 7.729118824005127 4.619699954986572 6.504300117492676 4.619699954986572 Z M 0.003346187528222799 2.493929862976074 C 1.730263352394104 0.9438411593437195 4.011251926422119 0 6.508800029754639 0 C 9.006438255310059 0 11.28797912597656 0.9441398978233337 13.01493453979492 2.493865966796875 L 12.12985038757324 3.378950119018555 C 10.63047218322754 2.054701566696167 8.661868095397949 1.250100016593933 6.508800029754639 1.250100016593933 C 4.35614538192749 1.250100016593933 2.387638568878174 2.054800510406494 0.8883816003799438 3.379049301147461 L 0.003346187528222799 2.493929862976074 Z" fill="#ffffff" stroke="#000000" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_9znq0s =
    '<svg viewBox="21.0 0.5 13.0 9.0" ><path transform="translate(20.99, 0.5)" d="M 4.885791301727295 7.376837253570557 C 5.347670555114746 7.060296058654785 5.906570434570313 6.875100135803223 6.508800029754639 6.875100135803223 C 7.111177444458008 6.875100135803223 7.670251369476318 7.060269355773926 8.132176399230957 7.37662410736084 L 6.508800029754639 9 L 4.885791301727295 7.376837253570557 Z M 6.504300117492676 4.619699954986572 C 5.281896591186523 4.619699954986572 4.158024787902832 5.050030708312988 3.276137113571167 5.767031192779541 L 2.39440393447876 4.885214328765869 C 3.505028963088989 3.946678400039673 4.939706802368164 3.38040018081665 6.504300117492676 3.38040018081665 C 8.071253776550293 3.38040018081665 9.507980346679688 3.948622226715088 10.61910247802734 4.889698028564453 L 9.737421989440918 5.771378040313721 C 8.854942321777344 5.051826953887939 7.729118824005127 4.619699954986572 6.504300117492676 4.619699954986572 Z M 0.003346187528222799 2.493929862976074 C 1.730263352394104 0.9438411593437195 4.011251926422119 0 6.508800029754639 0 C 9.006438255310059 0 11.28797912597656 0.9441398978233337 13.01493453979492 2.493865966796875 L 12.12985038757324 3.378950119018555 C 10.63047218322754 2.054701566696167 8.661868095397949 1.250100016593933 6.508800029754639 1.250100016593933 C 4.35614538192749 1.250100016593933 2.387638568878174 2.054800510406494 0.8883816003799438 3.379049301147461 L 0.003346187528222799 2.493929862976074 Z" fill="#000000" stroke="#ffffff" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" /></svg>';
