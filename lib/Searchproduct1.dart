import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Searchproduct1 extends StatelessWidget {
  Searchproduct1({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(),
          Container(),
          Container(),
          Container(),
          Pinned.fromPins(
            Pin(size: 1.0, start: 68.0),
            Pin(size: 20.0, start: 124.0),
            child: SvgPicture.string(
              _svg_o4urc9,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 213.0, start: 24.0),
            Pin(size: 27.0, middle: 0.2293),
            child: Text(
              'Products',
              style: TextStyle(
                fontFamily: 'Avenir-Heavy',
                fontSize: 18,
                color: const Color(0xff234135),
              ),
            ),
          ),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Pinned.fromPins(
            Pin(start: 0.5, end: -3.5),
            Pin(size: 147.9, end: 1.0),
            child: SvgPicture.string(
              _svg_mx2osr,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 319.2, start: -91.6),
            Pin(size: 319.2, end: -91.6),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x1f008037),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                  margin: EdgeInsets.all(13.0),
                ),
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_qd486d,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_o4urc9 =
    '<svg viewBox="68.0 124.0 1.0 20.0" ><path transform="translate(67.5, 124.0)" d="M 0.5 -7.04124258898986e-15 L 0.5 20" fill="none" stroke="#18573a" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
const String _svg_qd486d =
    '<svg viewBox="-425.0 -499.0 319.2 319.2" ><path transform="translate(-425.0, -499.0)" d="M 159.62109375 0 C 247.7773590087891 0 319.2421875 71.46480560302734 319.2421875 159.62109375 C 319.2421875 247.7773590087891 247.7773590087891 319.2421875 159.62109375 319.2421875 C 71.46480560302734 319.2421875 0 247.7773590087891 0 159.62109375 C 0 71.46480560302734 71.46480560302734 0 159.62109375 0 Z" fill="none" fill-opacity="0.12" stroke="#008037" stroke-width="3" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mx2osr =
    '<svg viewBox="0.5 663.1 378.0 147.9" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 378.5, 811.0)" d="M 0 129.60693359375 C 0 129.60693359375 65 162.9098968505859 196.5 139.5634918212891 C 272 124.9719543457031 330.5 103.170539855957 378 107.1188278198242 C 378 68.49425506591797 378 0 378 0 L 0 0 L 0 129.60693359375 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
