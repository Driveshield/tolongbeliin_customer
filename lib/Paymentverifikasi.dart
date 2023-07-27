import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Paymentverifikasi extends StatelessWidget {
  Paymentverifikasi({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
              child: SvgPicture.string(
            _svg_cuscau,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.cover,
          )),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff7f7fa),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(200.0),
                  bottomLeft: Radius.circular(0.0),
                ),
              ),
              // margin: EdgeInsets.fromLTRB(-40.0, -150.0, -30.0, 0.0),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment(-0.032, 0.436),
              child: Container(
                width: 187.0,
                height: 39.0,
                decoration: BoxDecoration(
                  color: const Color(0xff00871a),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 7),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment(-0.039, -0.34),
              child: Container(
                width: 194.0,
                height: 39.0,
                decoration: BoxDecoration(
                  color: const Color(0xff008816),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 7),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment(-0.053, 0.43),
              child: SizedBox(
                width: 113.0,
                height: 29.0,
                child: Text(
                  'SUCCESS',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 25,
                    color: const Color(0xcc000000),
                    shadows: [
                      Shadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 5),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  softWrap: false,
                ),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment(-0.084, -0.336),
              child: SizedBox(
                width: 113.0,
                height: 29.0,
                child: Text(
                  'PAYMENT',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 25,
                    color: const Color(0xcc000000),
                    shadows: [
                      Shadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 5),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  softWrap: false,
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 162.0,
              height: 193.0,
              child: SvgPicture.string(
                _svg_fs9mb,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_cuscau =
    '<svg viewBox="0.0 0.0 375.0 812.0" ><path  d="M 30 0 L 345 0 C 361.5685424804688 0 375 13.43145751953125 375 30 L 375 782 C 375 798.5685424804688 361.5685424804688 812 345 812 L 30 812 C 13.43145751953125 812 0 798.5685424804688 0 782 L 0 30 C 0 13.43145751953125 13.43145751953125 0 30 0 Z" fill="#008717" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fs9mb =
    '<svg viewBox="106.5 309.4 162.1 193.2" ><path transform="translate(101.97, 307.91)" d="M 85.5335693359375 1.499999523162842 L 4.5 36.62344741821289 L 4.5 89.30861663818359 C 4.5 138.0423889160156 39.07432556152344 183.6150665283203 85.5335693359375 194.6789398193359 C 131.9928283691406 183.6150665283203 166.5671539306641 138.0423889160156 166.5671539306641 89.30861663818359 L 166.5671539306641 36.62344741821289 L 85.5335693359375 1.499999523162842 Z M 67.52610778808594 141.9937744140625 L 31.51119041442871 106.8703384399414 L 44.20644378662109 94.48932647705078 L 67.52610778808594 117.1439361572266 L 126.8606948852539 59.27806091308594 L 139.5559539794922 71.74689483642578 L 67.52610778808594 141.9937744140625 Z" fill="#008816" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
