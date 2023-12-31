import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tolongbeliin_costumer/HOMESCREEN.dart';
import 'package:tolongbeliin_costumer/Loginenduser.dart';
import 'package:tolongbeliin_costumer/Searchproduct1.dart';

class Gettingstarted extends StatelessWidget {
  Gettingstarted({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (context) => HOMESCREEN(ispesan: false,)));
        },
        onHorizontalDragStart: (details) {
          Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (context) => HOMESCREEN(ispesan: false,)));
        },
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 0.0, end: -1.0),
              Pin(size: 440.4, start: 0.0),
              child: SvgPicture.string(
                _svg_cn52wf,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Container(),
            Container(),
            Pinned.fromPins(
              Pin(start: 40.0, end: 39.0),
              Pin(size: 66.0, middle: 0.6689),
              child: Text(
                'Tap your card for fill the e-money',
                style: TextStyle(
                  fontFamily: 'Avenir-Heavy',
                  fontSize: 16,
                  color: const Color(0xffa3a3a3),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Pinned.fromPins(
              Pin(startFraction: 0.268, endFraction: 0.268),
              Pin(size: 27.0, middle: 0.5809),
              child: Text(
                'Tap your NFC card',
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
                          color: const Color(0xff18573a),
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
            Align(
              alignment: Alignment(-0.484, -0.031),
              child: SizedBox(
                width: 26.0,
                height: 36.0,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 8.0,
                        height: 19.0,
                        child: SvgPicture.string(
                          _svg_wso97x,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(1.0, 0.214),
                      child: SizedBox(
                        width: 11.0,
                        height: 8.0,
                        child: SvgPicture.string(
                          _svg_wq93,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.444, 1.0),
                      child: SizedBox(
                        width: 8.0,
                        height: 15.0,
                        child: SvgPicture.string(
                          _svg_hgxlit,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 1.0,
                        height: 30.0,
                        child: SvgPicture.string(
                          _svg_ellhh6,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-1.0, 0.308),
                      child: SizedBox(
                        width: 11.0,
                        height: 10.0,
                        child: SvgPicture.string(
                          _svg_fcitf3,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, middle: 0.2222),
                      Pin(size: 14.0, end: 2.0),
                      child: SvgPicture.string(
                        _svg_j91ejy,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

const String _svg_cn52wf =
    '<svg viewBox="0.0 0.0 376.0 440.4" ><path  d="M 0 325.5 C 0 325.5 51.5 299 146 366.5 C 178 389 224.5 420 256.5 430 C 290.5 439 347.5 451.5 376 421.5 C 375.5 374.5 376 0 376 0 L 0 0 L 0 325.5 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_wso97x =
    '<svg viewBox="9.0 0.0 8.0 19.0" ><path transform="translate(9.0, 0.0)" d="M 3.9096360206604 0.02068022079765797 C 5.50800085067749 0.6847589015960693 6.713660717010498 2.170912742614746 7.345609188079834 3.843864440917969 C 7.978344440460205 5.516816139221191 8.086161613464355 7.362576484680176 7.945291042327881 9.154848098754883 C 7.673781394958496 12.62254047393799 5.899132251739502 16.17252159118652 3.959216117858887 19 C 1.100889563560486 16.55105590820312 0.3280710875988007 12.14114475250244 0.07151423394680023 9.878175735473633 C -0.3361435830593109 6.301860809326172 1.006451487541199 -0.4203931093215942 3.9096360206604 0.02068022079765797" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_wq93 =
    '<svg viewBox="15.0 17.0 11.0 8.0" ><path transform="translate(15.0, 17.0)" d="M 0.1806925386190414 7.746931076049805 C -0.3832306265830994 5.722861289978027 0.4159542322158813 3.459098815917969 1.977316498756409 2.015789270401001 C 3.537797451019287 0.5716204643249512 5.76176929473877 -0.08560092002153397 7.910845279693604 0.008901499211788177 C 8.904760360717773 0.05271625518798828 9.985025405883789 0.3018589913845062 10.57802581787109 1.080215215682983 C 11.13225650787354 1.808743000030518 11.10582256317139 2.849128723144531 10.70050239562988 3.664426803588867 C 10.2951831817627 4.480584144592285 9.570013046264648 5.104300022125244 8.79814338684082 5.609458446502686 C 6.150347709655762 7.343148231506348 3.262003898620605 8.547624588012695 0.1806925386190414 7.746931076049805" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_hgxlit =
    '<svg viewBox="13.0 21.0 8.0 15.0" ><path transform="translate(13.0, 21.0)" d="M 0.004152295645326376 14.99996662139893 C -0.01139888539910316 14.99660301208496 0.01748187839984894 14.73760890960693 0.07820553332567215 14.27259540557861 C 0.145593985915184 13.75881004333496 0.2351984083652496 13.09618759155273 0.3410945534706116 12.2998628616333 C 0.5854702591896057 10.65087413787842 0.892791211605072 8.29049015045166 1.951752543449402 5.972150802612305 C 2.995903253555298 3.659698009490967 4.498443603515625 1.930824279785156 5.780304908752441 1.053773999214172 C 6.416422367095947 0.6055785417556763 6.976264953613281 0.3322886526584625 7.37244987487793 0.1859734654426575 C 7.567950248718262 0.10272516310215 7.728645801544189 0.06824859231710434 7.83380126953125 0.03461291640996933 C 7.940438270568848 0.006022590212523937 7.997458934783936 -0.005749897100031376 7.999680519104004 0.00265902210958302 C 8.019675254821777 0.05983967334032059 7.098452568054199 0.28183513879776 5.867687702178955 1.20681631565094 C 4.631739139556885 2.106570720672607 3.180295705795288 3.81694483757019 2.153177261352539 6.0898756980896 C 1.114950895309448 8.360283851623535 0.7831923961639404 10.68955516815186 0.4988279342651367 12.33097553253174 C 0.3625699877738953 13.15841388702393 0.2522306442260742 13.82860469818115 0.1648478209972382 14.28941345214844 C 0.07820553332567215 14.75106239318848 0.01970347575843334 15.00333023071289 0.004152295645326376 14.99996662139893" fill="#1a2e35" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ellhh6 =
    '<svg viewBox="12.0 6.0 1.0 30.0" ><path transform="translate(12.0, 6.0)" d="M 0.008045315742492676 4.618133971234784e-06 C 0.01748515293002129 -0.0008018984226509929 0.03293215855956078 0.1040452495217323 0.05610266700387001 0.3024483025074005 C 0.0766986757516861 0.5274664163589478 0.1050181835889816 0.8170058727264404 0.1393448710441589 1.174292683601379 C 0.2071400582790375 1.931611657142639 0.2912404239177704 3.027667760848999 0.3830642998218536 4.383421897888184 C 0.5658538937568665 7.094930648803711 0.7640904188156128 10.84361934661865 0.8825175166130066 14.98830795288086 C 0.9992281794548035 19.13380241394043 1.016391515731812 22.88733100891113 0.9880720376968384 25.60448455810547 C 0.9734832048416138 26.9626579284668 0.9528871774673462 28.06194114685059 0.9271422028541565 28.82087326049805 C 0.9134114980697632 29.17977333068848 0.901397168636322 29.46931266784668 0.8928154706954956 29.69513702392578 C 0.8825175166130066 29.89434623718262 0.8722195029258728 30 0.8627796769142151 30 C 0.8541979789733887 29.99919319152832 0.8464744687080383 29.89434623718262 0.8404673337936401 29.6943302154541 C 0.8361764550209045 29.468505859375 0.8310274481773376 29.1789665222168 0.8250203132629395 28.82006645202637 C 0.8190131187438965 28.0296802520752 0.8112896084785461 26.93846321105957 0.8018497824668884 25.60367774963379 C 0.7821119427680969 22.88894462585449 0.737487256526947 19.1378345489502 0.6199184060096741 14.99475955963135 C 0.500633180141449 10.85329723358154 0.3332906067371368 7.106221675872803 0.1977002173662186 4.393100261688232 C 0.1316213607788086 3.059928417205811 0.0766986757516861 1.969517946243286 0.03722299262881279 1.179938316345215 C 0.02349232137203217 0.8218449354171753 0.01147798355668783 0.5314990282058716 0.002896313555538654 0.3056743741035461 C -0.002252688398584723 0.1056582853198051 -0.0005363543750718236 0.0008111346396617591 0.008045315742492676 4.618133971234784e-06" fill="#1a2e35" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_fcitf3 =
    '<svg viewBox="0.0 17.0 11.0 10.0" ><path transform="translate(0.0, 17.0)" d="M 11 9.712563514709473 C 10.21925449371338 5.665794849395752 7.327334403991699 2.075158357620239 3.509545564651489 0.4114780128002167 C 2.537464618682861 -0.01104397792369127 1.276759266853333 -0.2695186138153076 0.510607123374939 0.4586916267871857 C -0.2555449903011322 1.187702059745789 -0.03907661139965057 2.446465492248535 0.3776452839374542 3.413144588470459 C 2.111824512481689 7.435105800628662 6.51659107208252 10.17749786376953 10.94081592559814 9.991044044494629" fill="#18573a" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_j91ejy =
    '<svg viewBox="4.0 20.0 8.0 14.0" ><path transform="translate(4.0, 20.0)" d="M 0.0004326942143961787 0.001966970274224877 C 0.00726248836144805 -0.01499211695045233 0.2113974392414093 0.07828286290168762 0.5779297351837158 0.2597450911998749 C 0.7608164548873901 0.3487803041934967 0.9854407906532288 0.4598623216152191 1.231313347816467 0.6201257109642029 C 1.477185964584351 0.7803890705108643 1.773143649101257 0.9355647563934326 2.066824913024902 1.166208386421204 C 2.365818023681641 1.387524366378784 2.699719190597534 1.621559858322144 3.026031494140625 1.92258358001709 C 3.367521286010742 2.20071268081665 3.702181100845337 2.539894342422485 4.052018165588379 2.900274991989136 C 4.733479976654053 3.63799524307251 5.424807071685791 4.524107456207275 6.022793292999268 5.555220127105713 C 6.61243200302124 6.592268466949463 7.04802131652832 7.663234710693359 7.359156608581543 8.666364669799805 C 7.501064300537109 9.173441886901855 7.636901378631592 9.65507984161377 7.715823173522949 10.12060642242432 C 7.819029331207275 10.57934951782227 7.864561080932617 11.01604652404785 7.91312837600708 11.41373729705811 C 7.973079204559326 11.80973148345947 7.966248989105225 12.17435169219971 7.986738681793213 12.49148654937744 C 8.009504318237305 12.80947017669678 7.998121738433838 13.08420753479004 7.988256454467773 13.30721950531006 C 7.971561431884766 13.75493907928467 7.954107284545898 14.00084590911865 7.938930034637451 13.99999809265137 C 7.886568069458008 13.99915027618408 7.950313091278076 13.00789165496826 7.749972343444824 11.43832778930664 C 7.692298412322998 11.04742050170898 7.637660026550293 10.6183557510376 7.527624607086182 10.16809177398682 C 7.443390369415283 9.712740898132324 7.301482677459717 9.241277694702148 7.15729808807373 8.744376182556152 C 6.839333057403564 7.761597633361816 6.405261993408203 6.714373588562012 5.827764987945557 5.695980548858643 C 5.239643573760986 4.683523178100586 4.566529273986816 3.808434247970581 3.90328049659729 3.072409868240356 C 3.562549829483032 2.713725090026855 3.238513946533203 2.373695373535156 2.90688943862915 2.091326475143433 C 2.589683532714844 1.786910891532898 2.265647649765015 1.54778778553009 1.976519823074341 1.319688081741333 C 0.7980008721351624 0.4369675517082214 -0.02157442085444927 0.05369218811392784 0.0004326942143961787 0.001966970274224877" fill="#1a2e35" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
