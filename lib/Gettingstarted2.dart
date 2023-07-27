import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tolongbeliin_costumer/Gettingstarted1.dart';

class Gettingstarted2 extends StatelessWidget {
  Gettingstarted2({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (context) => Gettingstarted1()));
        },
        onHorizontalDragStart: (details) {
          Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (context) => Gettingstarted1()));
        },
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: -1.0, end: -2.0),
              Pin(size: 430.7, start: 0.0),
              child: SvgPicture.string(
                _svg_bkky8,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Container(),
            Container(),
            Pinned.fromPins(
              Pin(start: 40.0, end: 39.0),
              Pin(size: 44.0, middle: 0.6497),
              child: Text(
                'Stay informed with the fastest and most effective way, wherever you are',
                style: TextStyle(
                  fontFamily: 'Avenir-Medium',
                  fontSize: 16,
                  color: const Color(0xffa3a3a3),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Pinned.fromPins(
              Pin(startFraction: 0.332, endFraction: 0.332),
              Pin(size: 27.0, middle: 0.5809),
              child: Text(
                'Quick update',
                style: TextStyle(
                  fontFamily: 'Avenir-Heavy',
                  fontSize: 20,
                  color: const Color(0xff2d3934),
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
            Align(
              alignment: Alignment(0.003, 0.45),
              child: SizedBox(
                width: 40.0,
                height: 8.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(size: 8.0, start: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff18573a),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, middle: 0.5),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff1f1f1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, end: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff1f1f1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}

const String _svg_bkky8 =
    '<svg viewBox="-1.0 0.0 378.0 430.7" ><path transform="translate(-1.0, 0.0)" d="M 0 377.5 C 0 377.5 65 474.5 196.5 406.5 C 272 364 330.5 300.5 378 312 C 378 199.5 378 0 378 0 L 0 0 L 0 377.5 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
