import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Procestunggu extends StatelessWidget {
  Procestunggu({
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
            Pin(start: 0.0, end: -70.0),
            Pin(size: 273.0, end: -48.0),
            child: Transform.rotate(
              angle: 3.1416,
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
          ),
          Align(
            alignment: Alignment(0.008, -0.413),
            child: SizedBox(
              width: 248.0,
              height: 56.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 29.0, start: 0.0),
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
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.009, 1.0),
                    child: SizedBox(
                      width: 139.0,
                      height: 19.0,
                      child: Text(
                        'WAITING PROCESS',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 16,
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
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: -19.0, end: -20.0),
            Pin(size: 230.0, end: 265.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/tolong beliin-3.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 74.0, middle: 0.5017),
            Pin(size: 74.0, start: 113.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x1a000000),
                    offset: Offset(5, 6),
                    blurRadius: 22,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.663),
            child: SizedBox(
              width: 23.0,
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.2, vertical: 0.0),
                    child: SizedBox.expand(
                        child: SvgPicture.string(
                      _svg_n3huc,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    )),
                  ),
                  Pinned.fromPins(
                    Pin(size: 5.4, end: 3.0),
                    Pin(size: 8.1, middle: 0.7066),
                    child: SvgPicture.string(
                      _svg_y30gzd,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 11.0, start: 2.2),
                    Pin(start: 0.0, end: 0.0),
                    child: SvgPicture.string(
                      _svg_m2ov,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 4.6, end: 4.6),
                    Pin(size: 4.2, middle: 0.3708),
                    child: SvgPicture.string(
                      _svg_hvuut3,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 3.8, end: 3.8),
                    Pin(size: 8.8, end: 2.6),
                    child: SvgPicture.string(
                      _svg_mkji9d,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 0.19),
                    child: Container(
                      width: 1.0,
                      height: 13.0,
                      color: const Color(0xffffad42),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 3.1, middle: 0.193),
                    Pin(size: 7.4, end: 2.6),
                    child: SvgPicture.string(
                      _svg_m03lqm,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 1.0,
                      height: 5.0,
                      child: SvgPicture.string(
                        _svg_jaeqf8,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.441, -0.259),
                    child: SizedBox(
                      width: 6.0,
                      height: 4.0,
                      child: SvgPicture.string(
                        _svg_ivxx0f,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 3.5, start: 0.0),
                    child: SvgPicture.string(
                      _svg_k9byo6,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 3.5, end: 0.0),
                    child: SvgPicture.string(
                      _svg_tlorlp,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 3.0, middle: 0.3908),
                    Pin(size: 3.0, start: 4.4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 3.0, middle: 0.3908),
                    Pin(size: 3.0, end: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffcd9250),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 6.0,
                      height: 3.0,
                      child: SvgPicture.string(
                        _svg_qzg2l0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 6.0,
                      height: 3.0,
                      child: SvgPicture.string(
                        _svg_aaldnb,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_n3huc =
    '<svg viewBox="2.2 0.0 18.3 40.0" ><path transform="translate(2.2, 0.0)" d="M 18.25933265686035 9.866666793823242 L 18.25933265686035 0 L 2.36847585645308e-15 0 L 2.36847585645308e-15 9.866666793823242 C 2.36847585645308e-15 13.51133346557617 2.106833219528198 16.65866661071777 5.158999919891357 18.14100074768066 C 5.848499774932861 18.47583389282227 6.296333312988281 19.16850090026855 6.296333312988281 19.94033241271973 L 6.296333312988281 20.05983352661133 C 6.296333312988281 20.83166694641113 5.848499774932861 21.52416610717773 5.158999919891357 21.85916709899902 C 2.106833219528198 23.34149932861328 0 26.48866653442383 0 30.13349914550781 L 0 40 L 18.25933265686035 40 L 18.25933265686035 30.13333320617676 C 18.25933265686035 26.48866653442383 16.15250015258789 23.34133338928223 13.10033321380615 21.85899925231934 C 12.41083335876465 21.52416610717773 11.96300029754639 20.83149909973145 11.96300029754639 20.05966758728027 L 11.96300029754639 19.94016647338867 C 11.96300029754639 19.16833305358887 12.41083335876465 18.47583389282227 13.10033321380615 18.14083290100098 C 16.15250015258789 16.65866661071777 18.25933265686035 13.51150035858154 18.25933265686035 9.866666793823242 Z" fill="#e3e3e3" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_y30gzd =
    '<svg viewBox="14.2 22.6 5.4 8.1" ><path transform="translate(14.22, 22.56)" d="M 4.908351898193359 8.074945449829102 C 4.632184982299805 8.074945449829102 4.408351898193359 7.851112365722656 4.408351898193359 7.57494592666626 C 4.408351898193359 4.767612457275391 2.78851842880249 2.167279005050659 0.2816851139068604 0.9497790336608887 C 0.03335178270936012 0.8291123509407043 -0.07031488418579102 0.5299456715583801 0.05035178363323212 0.281612366437912 C 0.1711851209402084 0.03327903151512146 0.4701851308345795 -0.07022096961736679 0.7185184359550476 0.05027903243899345 C 3.567518472671509 1.433779001235962 5.408351898193359 4.387279033660889 5.408351898193359 7.574779033660889 C 5.408351898193359 7.851112365722656 5.184518337249756 8.074945449829102 4.908351898193359 8.074945449829102 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_m2ov =
    '<svg viewBox="2.2 0.0 11.0 40.0" ><path transform="translate(2.2, 0.0)" d="M 9.825666427612305 21.85899925231934 C 10.51516628265381 21.52400016784668 10.96300029754639 20.83149909973145 10.96300029754639 20.05966758728027 L 10.96300029754639 19.94016647338867 C 10.96300029754639 19.16833305358887 10.51516628265381 18.47583389282227 9.825666427612305 18.14083290100098 C 6.773499965667725 16.65850067138672 4.666666507720947 13.51133346557617 4.666666507720947 9.866499900817871 L 4.666666507720947 0 L 0 0 L 0 9.866666793823242 C 0 13.51133346557617 2.106833219528198 16.65866661071777 5.158999919891357 18.14100074768066 C 5.848499774932861 18.47599983215332 6.296333312988281 19.16850090026855 6.296333312988281 19.94033241271973 L 6.296333312988281 20.05983352661133 C 6.296333312988281 20.83166694641113 5.848499774932861 21.52416610717773 5.158999919891357 21.85916709899902 C 2.106833219528198 23.34149932861328 0 26.48866653442383 0 30.13349914550781 L 0 40 L 4.666666507720947 40 L 4.666666507720947 30.13333320617676 C 4.666666507720947 26.48866653442383 6.773499965667725 23.34133338928223 9.825666427612305 21.85899925231934 Z" fill="#e3e3e3" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_hvuut3 =
    '<svg viewBox="4.6 13.3 13.5 4.2" ><path transform="translate(4.58, 13.28)" d="M 0 2.36847585645308e-15 C 1.241666674613953 2.476666688919067 3.788166761398315 4.17983341217041 6.723166465759277 4.17983341217041 L 6.773666858673096 4.17983341217041 C 9.708666801452637 4.17983341217041 12.25516700744629 2.476666688919067 13.49683380126953 0 L 0 0 L 0 2.36847585645308e-15 Z" fill="#ffad42" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_mkji9d =
    '<svg viewBox="3.8 28.6 15.1 8.8" ><path transform="translate(3.78, 28.57)" d="M 15.11116695404053 8.836000442504883 L 15.11116695404053 7.593666553497314 C 15.11116695404053 3.406500101089478 11.73316669464111 0 7.580833435058594 0 L 7.530333518981934 0 C 3.378166675567627 0 0 3.406500101089478 0 7.593666553497314 L 0 8.836000442504883 L 15.11116695404053 8.836000442504883 Z" fill="#ffad42" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_m03lqm =
    '<svg viewBox="3.8 30.0 3.1 7.4" ><path transform="translate(3.78, 30.03)" d="M 3.092499971389771 0.09933333098888397 C 3.092499971389771 0.06616666913032532 3.094000101089478 0.03333333507180214 3.094333410263062 0 C 1.220333337783813 1.382666707038879 0 3.615333318710327 0 6.13100004196167 L 0 7.37333345413208 L 3.092666625976562 7.37333345413208 L 3.092666625976562 0.09933333098888397 L 3.092499971389771 0.09933333098888397 Z" fill="#cd9250" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_jaeqf8 =
    '<svg viewBox="10.7 17.3 1.3 5.4" ><path transform="translate(10.67, 17.32)" d="M 0 5.351333141326904 C 0.4191666543483734 5.047500133514404 0.8651666641235352 4.778999805450439 1.333333373069763 4.549499988555908 L 1.333333373069763 0.8018333315849304 C 0.8651666641235352 0.5723333358764648 0.4191666543483734 0.3039999902248383 0 0 L 0 5.351333141326904 Z" fill="#cd9250" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ivxx0f =
    '<svg viewBox="4.6 13.3 6.3 4.2" ><path transform="translate(4.58, 13.28)" d="M 6.253833293914795 4.164166450500488 C 4.776500225067139 3.14466667175293 3.612833261489868 1.697833299636841 2.9375 0 L 0 0 C 1.174999952316284 2.343666553497314 3.518500089645386 3.993666648864746 6.253833293914795 4.164166450500488 Z" fill="#cd9250" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_k9byo6 =
    '<svg viewBox="0.0 0.0 22.7 3.5" ><path transform="translate(0.0, 0.03)" d="M 21.71833419799805 3.492000102996826 L 0.9483333230018616 3.492000102996826 C 0.4244999885559082 3.492000102996826 0 3.067333221435547 0 2.54366660118103 L 0 0.9483333230018616 C 0 0.4244999885559082 0.4246666729450226 0 0.9483333230018616 0 L 21.71833419799805 0 C 22.24216651916504 0 22.66666603088379 0.4246666729450226 22.66666603088379 0.9483333230018616 L 22.66666603088379 2.54366660118103 C 22.66666603088379 3.067333221435547 22.24200057983398 3.492000102996826 21.71833419799805 3.492000102996826 Z" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_tlorlp =
    '<svg viewBox="0.0 36.5 22.7 3.5" ><path transform="translate(0.0, 36.48)" d="M 0.9483333230018616 0 L 21.71833419799805 0 C 22.24216651916504 0 22.66666603088379 0.4246666729450226 22.66666603088379 0.9483333230018616 L 22.66666603088379 2.54366660118103 C 22.66666603088379 3.067500114440918 22.24200057983398 3.492000102996826 21.71833419799805 3.492000102996826 L 0.9483333230018616 3.492000102996826 C 0.4244999885559082 3.492000102996826 0 3.067333221435547 0 2.54366660118103 L 0 0.9483333230018616 C 0 0.4246666729450226 0.4246666729450226 0 0.9483333230018616 0 Z" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_qzg2l0 =
    '<svg viewBox="0.0 0.0 5.6 3.5" ><path transform="translate(0.0, 0.03)" d="M 4.666666507720947 2.54366660118103 L 4.666666507720947 0.9484999775886536 C 4.666666507720947 0.4244999885559082 5.091333389282227 0 5.614999771118164 0 L 0.9483333230018616 0 C 0.4244999885559082 0 0 0.4246666729450226 0 0.9484999775886536 L 0 2.54366660118103 C 0 3.067500114440918 0.4246666729450226 3.492000102996826 0.9483333230018616 3.492000102996826 L 5.614999771118164 3.492000102996826 C 5.091333389282227 3.492000102996826 4.666666507720947 3.067333221435547 4.666666507720947 2.54366660118103 Z" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_aaldnb =
    '<svg viewBox="0.0 36.5 5.6 3.5" ><path transform="translate(0.0, 36.48)" d="M 4.666666507720947 2.543499946594238 L 4.666666507720947 0.9483333230018616 C 4.666666507720947 0.4244999885559082 5.091333389282227 0 5.614999771118164 0 L 0.9483333230018616 0 C 0.4244999885559082 0 0 0.4246666729450226 0 0.9483333230018616 L 0 2.543499946594238 C 0 3.067500114440918 0.4246666729450226 3.491833448410034 0.9483333230018616 3.491833448410034 L 5.614999771118164 3.491833448410034 C 5.091333389282227 3.492000102996826 4.666666507720947 3.067500114440918 4.666666507720947 2.543499946594238 Z" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
