import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ORDER extends StatelessWidget {
  ORDER({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xfff7f7fa),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          Pinned.fromPins(
            Pin(start: -42.0, end: -28.0),
            Pin(size: 309.0, start: -150.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff008037),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(260.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 106.0, start: 35.0),
            Pin(size: 19.0, start: 104.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff6dc720),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 7),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
                    ),
                    Pinned.fromPins(
                      Pin(size: 58.0, start: 10.0),
                      Pin(size: 10.0, middle: 0.5556),
                      child: Text(
                        'Super partner',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 9,
                          color: const Color(0xcc000000),
                        ),
                        softWrap: false,
                      ),
                    ),
                    Align(
                      alignment: Alignment(1.0, 0.111),
                      child: SizedBox(
                        width: 26.0,
                        height: 10.0,
                        child: Text(
                          'Snack',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 9,
                            color: const Color(0xcc000000),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 248.0, start: 38.0),
            Pin(size: 29.0, start: 73.0),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: Text(
                  'Es Campur bang Sam',
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
                )),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 11.0, end: 26.0),
            Pin(size: 134.0, middle: 0.2021),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
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
                Pinned.fromPins(
                  Pin(start: 15.0, end: 12.0),
                  Pin(size: 49.0, middle: 0.7294),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
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
                Pinned.fromPins(
                  Pin(size: 68.0, middle: 0.1889),
                  Pin(size: 29.0, start: 16.0),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 25,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.487, -0.357),
                  child: SizedBox(
                    width: 139.0,
                    height: 19.0,
                    child: Text(
                      'No.18 blossom ville',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 111.0, start: 50.0),
                  Pin(size: 19.0, middle: 0.6783),
                  child: Text(
                    'Blok w08 no 51',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc949494),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 29.0, end: 26.0),
                  Pin(size: 19.0, middle: 0.6783),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 11.0, end: 26.0),
            Pin(size: 134.0, middle: 0.2021),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
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
                Pinned.fromPins(
                  Pin(start: 15.0, end: 12.0),
                  Pin(size: 49.0, middle: 0.7294),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
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
                Pinned.fromPins(
                  Pin(size: 68.0, middle: 0.1889),
                  Pin(size: 29.0, start: 16.0),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 25,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.487, -0.357),
                  child: SizedBox(
                    width: 139.0,
                    height: 19.0,
                    child: Text(
                      'No.18 blossom ville',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 111.0, start: 50.0),
                  Pin(size: 19.0, middle: 0.6783),
                  child: Text(
                    'Blok w08 no 51',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc949494),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 29.0, end: 26.0),
                  Pin(size: 19.0, middle: 0.6783),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 11.0, end: 26.0),
            Pin(size: 134.0, middle: 0.4159),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
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
                Pinned.fromPins(
                  Pin(start: 7.0, end: 20.0),
                  Pin(size: 49.0, middle: 0.5059),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff008037)),
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
                Pinned.fromPins(
                  Pin(size: 119.0, start: 15.0),
                  Pin(size: 19.0, start: 9.0),
                  child: Text(
                    'Delivery options',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 69.0, start: 42.0),
                  Pin(size: 19.0, middle: 0.513),
                  child: Text(
                    'Standard',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc949494),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 59.0, end: 27.0),
                  Pin(size: 19.0, middle: 0.513),
                  child: Text(
                    '20 mins',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 12.0, end: 25.0),
            Pin(size: 280.0, end: 102.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
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
                Pinned.fromPins(
                  Pin(size: 117.0, start: 15.0),
                  Pin(size: 19.0, start: 9.0),
                  child: Text(
                    'Order Summary',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 30.0, start: 26.0),
            Pin(size: 30.0, middle: 0.1957),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ovo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 12.0, end: 26.0),
            Pin(size: 75.0, end: 10.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
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
                  ],
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 23.0, start: 52.3),
            Pin(size: 12.0, start: 40.8),
            child: Text(
              'Back',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 10,
                color: const Color(0xcc00190a),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 29.3, start: 12.0),
            Pin(size: 29.3, start: 29.8),
            child: SvgPicture.string(
              _svg_o2n5,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 127.0, middle: 0.5),
            Pin(size: 43.0, end: 22.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff008900),
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
                Pinned.fromPins(
                  Pin(start: 14.0, end: 13.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Place order',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 19,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 53.0, start: 30.0),
            Pin(size: 53.0, middle: 0.61),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ovo.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 53.0, start: 30.0),
            Pin(size: 53.0, middle: 0.6996),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ovo.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.498, 0.215),
            child: SizedBox(
              width: 88.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(1.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 7),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.056, 0.0),
                    child: SizedBox(
                      width: 52.0,
                      height: 12.0,
                      child: Text(
                        'Es campur ',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 10,
                          color: const Color(0xcc000000),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 10.0, start: 3.0),
                    Pin(size: 12.0, middle: 0.5),
                    child: Text(
                      '1x',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 10,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.498, 0.389),
            child: SizedBox(
              width: 88.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(1.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 7),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(1.0, -0.1),
                    child: SizedBox(
                      width: 69.0,
                      height: 10.0,
                      child: Text(
                        'Es buah nangka ',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 9,
                          color: const Color(0xcc000000),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 10.0, start: 3.0),
                    Pin(size: 12.0, middle: 0.5),
                    child: Text(
                      '1x',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 10,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, end: 52.0),
            Pin(size: 17.0, middle: 0.6088),
            child: Text(
              'Rp. 12.000',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: const Color(0xcc000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, end: 52.0),
            Pin(size: 17.0, middle: 0.6994),
            child: Text(
              'Rp. 14.000',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: const Color(0xcc000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 71.0, end: 50.0),
            Pin(size: 17.0, middle: 0.7597),
            child: Text(
              'Rp. 26.000',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: const Color(0xcc000000),
              ),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0.628, 0.562),
            child: SizedBox(
              width: 63.0,
              height: 17.0,
              child: Text(
                'Rp. 3.000',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14,
                  color: const Color(0xcc000000),
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 70.0, end: 47.0),
            Pin(size: 17.0, end: 132.0),
            child: Text(
              'Rp. 29.000',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: const Color(0xcc000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 55.0, start: 38.0),
            Pin(size: 17.0, middle: 0.7597),
            child: Text(
              'Subtotal',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: const Color(0xcc000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 55.0, start: 38.0),
            Pin(size: 17.0, end: 132.0),
            child: Text(
              'Subtotal',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: const Color(0xcc000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 76.0, start: 38.0),
            Pin(size: 17.0, middle: 0.7862),
            child: Text(
              'Delivery fee',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: const Color(0xcc008900),
              ),
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_o2n5 =
    '<svg viewBox="12.0 29.8 29.3 29.3" ><path transform="translate(8.63, 26.38)" d="M 18 3.375 C 9.921093940734863 3.375 3.375 9.921093940734863 3.375 18 C 3.375 26.07890701293945 9.921093940734863 32.625 18 32.625 C 26.07890701293945 32.625 32.625 26.07890701293945 32.625 18 C 32.625 9.921092987060547 26.07890701293945 3.375 18 3.375 Z M 21.05156326293945 23.70234298706055 C 21.57890701293945 24.22968673706055 21.57890701293945 25.09453010559082 21.05156326293945 25.62187385559082 C 20.78437614440918 25.88906097412109 20.43984413146973 26.01562309265137 20.09531402587891 26.01562309265137 C 19.75078201293945 26.01562309265137 19.39921951293945 25.88202857971191 19.13203239440918 25.61484146118164 L 12.52265739440918 18.98437309265137 C 12.03750133514404 18.44999885559082 12.05156326293945 17.62734222412109 12.56484508514404 17.11406135559082 L 19.27265739440918 10.38515472412109 C 19.80000114440918 9.857810974121094 20.65781402587891 9.85077953338623 21.19218826293945 10.38515472412109 C 21.71953201293945 10.91249847412109 21.7265625 11.77031135559082 21.19218826293945 12.30468559265137 L 15.43359375 18 L 21.05156326293945 23.70234298706055 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
