import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tolongbeliin_costumer/Gettingstarted.dart';

class Gettingstarted1 extends StatelessWidget {
  Gettingstarted1({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (context) => Gettingstarted()));
        },
        onHorizontalDragStart: (details) {
          Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (context) => Gettingstarted()));
        },
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.1),
              Pin(size: 363.1, start: 0.0),
              child: SvgPicture.string(
                _svg_mcvw3d,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Container(),
            Container(),
            Container(),
            Pinned.fromPins(
              Pin(start: 40.0, end: 39.0),
              Pin(size: 44.0, middle: 0.6497),
              child: Text(
                'Receive notices about apartments, quick feedback',
                style: TextStyle(
                  fontFamily: 'Avenir-Medium',
                  fontSize: 16,
                  color: const Color(0xffa3a3a3),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Pinned.fromPins(
              Pin(startFraction: 0.3267, endFraction: 0.3267),
              Pin(size: 27.0, middle: 0.5809),
              child: Text(
                'Notify quickly',
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
                          color: const Color(0xfff1f1f1),
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
                          color: const Color(0xff18573a),
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
            Pinned.fromPins(
              Pin(size: 37.0, start: 14.0),
              Pin(size: 52.0, middle: 0.3947),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(-0.04, -1.0),
                    child: SizedBox(
                      width: 12.0,
                      height: 28.0,
                      child: SvgPicture.string(
                        _svg_vzmgxz,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1.0, 0.22),
                    child: SizedBox(
                      width: 15.0,
                      height: 11.0,
                      child: SvgPicture.string(
                        _svg_vdzce,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 12.0, middle: 0.72),
                    Pin(size: 21.0, end: 1.0),
                    child: SvgPicture.string(
                      _svg_a4maz,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.056, 1.0),
                    child: SizedBox(
                      width: 1.0,
                      height: 44.0,
                      child: SvgPicture.string(
                        _svg_dul3zj,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1.0, 0.297),
                    child: SizedBox(
                      width: 16.0,
                      height: 15.0,
                      child: SvgPicture.string(
                        _svg_mm9c1,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 12.0, middle: 0.24),
                    Pin(size: 20.0, end: 3.0),
                    child: SvgPicture.string(
                      _svg_cq7ewq,
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
    );
  }
}

const String _svg_mcvw3d =
    '<svg viewBox="0.0 0.0 374.9 363.1" ><path  d="M 0 300.5 C 0 300.5 129.5 243.5 221.5 322.5 C 245 341.5 296 382.5 374.5 352.5 C 375.5 270 374.5 0 374.5 0 L 0 0 L 0 300.5 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_vzmgxz =
    '<svg viewBox="12.0 0.0 12.0 28.0" ><path transform="translate(12.0, 0.0)" d="M 5.86445426940918 0.03047611564397812 C 8.262001037597656 1.009118437767029 10.07049083709717 3.199239730834961 11.01841354370117 5.664642333984375 C 11.96751689910889 8.130044937133789 12.12924194335938 10.85011196136475 11.91793632507324 13.49135494232178 C 11.5106725692749 18.60163879394531 8.848698616027832 23.83319091796875 5.93882417678833 28 C 1.651334285736084 24.39102935791016 0.4921066164970398 17.89221382141113 0.1072713509202003 14.55731105804443 C -0.5042153596878052 9.286952972412109 1.509677171707153 -0.6195266842842102 5.86445426940918 0.03047611564397812" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_vdzce =
    '<svg viewBox="22.0 25.0 15.0 11.0" ><path transform="translate(22.0, 25.0)" d="M 0.2463989108800888 10.6520299911499 C -0.5225871801376343 7.868934154510498 0.56721031665802 4.756260871887207 2.696340560913086 2.771710157394409 C 4.82426929473877 0.7859780788421631 7.856958389282227 -0.1177012622356415 10.78751659393311 0.01223956141620874 C 12.14285469055176 0.07248485088348389 13.61594295501709 0.4150561094284058 14.42458057403564 1.485296010971069 C 15.18034934997559 2.487021684646606 15.14430332183838 3.91755199432373 14.59159469604492 5.038587093353271 C 14.03888607025146 6.160802841186523 13.05001735687256 7.018412590026855 11.99746799468994 7.713005065917969 C 8.386837959289551 10.09682846069336 4.448186874389648 11.75298404693604 0.2463989108800888 10.6520299911499" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_a4maz =
    '<svg viewBox="18.0 30.0 12.0 21.0" ><path transform="translate(18.0, 30.0)" d="M 0.00622844323515892 20.99995422363281 C -0.01709832809865475 20.9952449798584 0.02622281759977341 20.63265228271484 0.1173083037137985 19.98163414001465 C 0.2183909714221954 19.2623348236084 0.3527975976467133 18.33466148376465 0.511641800403595 17.21980857849121 C 0.8782053589820862 14.91122341156006 1.339186787605286 11.60668563842773 2.927628755569458 8.361011505126953 C 4.493854999542236 5.123577117919922 6.747665405273438 2.703153848648071 8.67045783996582 1.47528350353241 C 9.6246337890625 0.8478099703788757 10.46439743041992 0.465204119682312 11.05867481231689 0.2603628635406494 C 11.35192584991455 0.1438152343034744 11.59296894073486 0.09554803371429443 11.75070190429688 0.04845808073878288 C 11.91065692901611 0.008431625552475452 11.99618816375732 -0.008049855940043926 11.99952125549316 0.003722631139680743 C 12.02951240539551 0.08377554267644882 10.64767932891846 0.3945692181587219 8.801531791687012 1.689542770385742 C 6.947608947753906 2.949198961257935 4.770443439483643 5.343722820281982 3.229765892028809 8.525826454162598 C 1.672426342964172 11.70439720153809 1.174788594245911 14.96537685394287 0.7482419013977051 17.26336669921875 C 0.5438549518585205 18.42177963256836 0.3783459663391113 19.36004638671875 0.2472717463970184 20.00517845153809 C 0.1173083037137985 20.65148735046387 0.02955521456897259 21.00466156005859 0.00622844323515892 20.99995422363281" fill="#1a2e35" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_dul3zj =
    '<svg viewBox="17.0 8.0 1.0 44.0" ><path transform="translate(17.0, 8.0)" d="M 0.008045315742492676 6.773263066861546e-06 C 0.01748515293002129 -0.00117611768655479 0.03293215855956078 0.1525997072458267 0.05610266700387001 0.4435908794403076 C 0.0766986757516861 0.7736174464225769 0.1050181835889816 1.198275208473206 0.1393448710441589 1.722295999526978 C 0.2071400582790375 2.833030462265015 0.2912404239177704 4.440579414367676 0.3830642998218536 6.429018974304199 C 0.5658538937568665 10.40589809417725 0.7640904188156128 15.90397548675537 0.8825175166130066 21.98285102844238 C 0.9992281794548035 28.06291007995605 1.016391515731812 33.56808471679688 0.9880720376968384 37.55324554443359 C 0.9734832048416138 39.54523468017578 0.9528871774673462 41.15751266479492 0.9271422028541565 42.27061462402344 C 0.9134114980697632 42.79700088500977 0.901397168636322 43.22165679931641 0.8928154706954956 43.5528678894043 C 0.8825175166130066 43.84504318237305 0.8722195029258728 44 0.8627796769142151 44 C 0.8541979789733887 43.99881744384766 0.8464744687080383 43.84504318237305 0.8404673337936401 43.55168533325195 C 0.8361764550209045 43.22047424316406 0.8310274481773376 42.79581832885742 0.8250203132629395 42.26943206787109 C 0.8190131187438965 41.11019897460938 0.8112896084785461 39.50974655151367 0.8018497824668884 37.55206298828125 C 0.7821119427680969 33.57044982910156 0.737487256526947 28.06882476806641 0.6199184060096741 21.9923152923584 C 0.500633180141449 15.91816997528076 0.3332906067371368 10.42245864868164 0.1977002173662186 6.44321346282959 C 0.1316213607788086 4.487895011901855 0.0766986757516861 2.888626337051392 0.03722299262881279 1.730576157569885 C 0.02349232137203217 1.20537257194519 0.01147798355668783 0.7795318961143494 0.002896313555538654 0.4483224153518677 C -0.002252688398584723 0.1549654752016068 -0.0005363543750718236 0.001189664122648537 0.008045315742492676 6.773263066861546e-06" fill="#1a2e35" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_mm9c1 =
    '<svg viewBox="0.0 24.0 16.0 15.0" ><path transform="translate(0.0, 24.0)" d="M 16 14.56884479522705 C 14.86437034606934 8.498692512512207 10.65794086456299 3.112737417221069 5.104793548583984 0.6172170042991638 C 3.690857648849487 -0.0165659673511982 1.857104420661926 -0.404277890920639 0.7427012920379639 0.6880374550819397 C -0.3717018067836761 1.781553149223328 -0.05683870613574982 3.669698238372803 0.5493022203445435 5.119717121124268 C 3.071744918823242 11.15265846252441 9.478677749633789 15.26624584197998 15.91391372680664 14.98656558990479" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_cq7ewq =
    '<svg viewBox="6.0 29.0 12.0 20.0" ><path transform="translate(6.0, 29.0)" d="M 0.0006490413215942681 0.002809957601130009 C 0.01089373230934143 -0.02141731046140194 0.3170961737632751 0.1118326634168625 0.8668946027755737 0.3710644245147705 C 1.14122462272644 0.498257577419281 1.478161215782166 0.6569461822509766 1.846970081329346 0.8858938813209534 C 2.215778827667236 1.11484158039093 2.65971565246582 1.336521029472351 3.100237369537354 1.666011929512024 C 3.548727035522461 1.982177734375 4.049578666687012 2.316514015197754 4.539047241210938 2.746547937393188 C 5.051281929016113 3.143875122070312 5.553271770477295 3.62842059135437 6.078027248382568 4.143249988555908 C 7.100220203399658 5.197136402130127 8.137210845947266 6.463010787963867 9.03419017791748 7.936028957366943 C 9.918648719787598 9.417526245117188 10.57203197479248 10.94747829437256 11.03873443603516 12.38052082061768 C 11.25159645080566 13.1049165725708 11.45535182952881 13.79297065734863 11.57373523712158 14.45800971984863 C 11.72854423522949 15.113356590271 11.79684162139893 15.73720932006836 11.8696928024292 16.30533790588379 C 11.95961856842041 16.87104606628418 11.94937419891357 17.39193153381348 11.9801082611084 17.8449821472168 C 12.01425647735596 18.29924201965332 11.99718189239502 18.69172477722168 11.98238468170166 19.01031303405762 C 11.95734214782715 19.6499137878418 11.93116092681885 20.00120735168457 11.9083948135376 19.99999618530273 C 11.82985210418701 19.9987850189209 11.92546939849854 18.58270263671875 11.62495899200439 16.34046745300293 C 11.53844738006592 15.7820291519165 11.4564905166626 15.16907978057861 11.29143714904785 14.52584552764893 C 11.1650857925415 13.87534332275391 10.952223777771 13.20182514190674 10.73594665527344 12.49196624755859 C 10.25899982452393 11.08799648284912 9.607892990112305 9.591962814331055 8.741646766662598 8.137115478515625 C 7.859465599060059 6.690747261047363 6.849794387817383 5.440620422363281 5.854920864105225 4.389156818389893 C 5.34382438659668 3.876749992370605 4.857770919799805 3.390993356704712 4.360334396362305 2.987609386444092 C 3.884525299072266 2.552729845046997 3.398471593856812 2.211125373840332 2.964779615402222 1.885268688201904 C 1.197001338005066 0.6242393851280212 -0.03236163035035133 0.07670312374830246 0.0006490413215942681 0.002809957601130009" fill="#1a2e35" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
