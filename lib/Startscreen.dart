import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lottie/lottie.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:tolongbeliin_costumer/Gettingstarted2.dart';
import 'package:tolongbeliin_costumer/HOMESCREEN.dart';
import 'package:tolongbeliin_costumer/Signinenduser.dart';
import 'package:tolongbeliin_costumer/utils/Form.dart';
import 'package:http/http.dart' as http;

class Startscreen extends StatefulWidget {
  Startscreen({super.key});

  // final String fullname;

  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen> {
//class Startscreen extends StatelessWidget {
  // Startscreen({
  //   Key? key,
  // }) : super(key: key);
  String? idDevice;
  OneSignalID onesignal = OneSignalID();
  bool? isgetid = false;

  void initState() {
    //c768598b-2ee5-442d-8ec5-619e8033498c
    cekonesignal();

    super.initState();
  }

  Future <void> cekonesignal () async {
      OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

      OneSignal.shared.setAppId("c768598b-2ee5-442d-8ec5-619e8033498c");

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      setState(() => onesignal.idonesignal = osUserID);
      setState(() =>
         isgetid = true 
      );

      //prosesLogin(context);

      print(osUserID);
      // We will update this once he logged in and goes to dashboard.
      ////updateUserProfile(osUserID);
      // Store it into shared prefs, So that later we can use it.
      //Preferences.setOnesignalUserId(osUserID);

      // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
      OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
          print("Accepted permission: $accepted");
      });
  }

  Future <void> prosesLogin (context)  async {
    String? deviceId = onesignal.idonesignal;
    bool loading = false;
    // setState(() {
    //   username.isEmpty ? validate = true  : validateNameStore = false;
    //   password.isEmpty ? validatePassword = true  : validatePassword = false;
    // });
    if(deviceId != "" || deviceId != null) {
      setState(() => loading = true);
      try {

        http.Response response = await cekUser(deviceId!);
      print(response.statusCode);
      final data = json.decode(response.body);
      if(data['status'].toString() == 'false') {
        String errorMessage = data['message'];

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gettingstarted2()),
        );
        setState(() => loading = false);
      }else if(response.statusCode != 200) {

        String errorMessage = data['message'];

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gettingstarted2()),
        );

      }
      else {
        setState(() => loading = false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HOMESCREEN(fullname: data['data'][0]['fullname'],ispesan: true,)),
        );
      }
        
      } catch (e) {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gettingstarted2()),
        );
        
      }
      

    }
  }

  Future<http.Response> cekUser(String onesignalID) {
    return http.post(
      Uri.parse('https://dev.tolongbeliin.com/api/customer/cekLoginIDDevice'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idonesignal': onesignalID,
      }),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    // setTimeout(callback){

    // }
    //prosesLogin(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: -3.0, end: 0.0),
            Pin(size: 281.7, end: 0.0),
            child: SvgPicture.string(
              _svg_f5viyk,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Container(),
          (isgetid == true) ?
          CupertinoPageScaffold(
                    child: TimerCountdown(
                      format: CountDownTimerFormat.minutesSeconds,
                      timeTextStyle: TextStyle(color: Colors.transparent),
                      descriptionTextStyle: TextStyle(color: Colors.transparent),
                      enableDescriptions: false,
                      colonsTextStyle: TextStyle(color: Colors.transparent),
                      endTime: DateTime.now().add(
                        Duration(
                          seconds: 2,
                        ),
                      ),
                      onEnd: () {
                        print("Timer finished");
                        setState(() {
                          prosesLogin(context);
                        });
                      },
                    ),
                  ) : SizedBox(width: 10,),
          Pinned.fromPins(
              Pin(start: -19.0, end: -20.0),
              Pin(size: 264.0, start: 200.0),
              child: 
                  Container(
                    // width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/tolong beliin-3.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    // child: Lottie.asset('assets/98194-loading(2).json'),
                  ),
                  
            ),
          // Pinned.fromPins(
          //   Pin(start: -19.0, end: -20.0),
          //   Pin(size: 414.0, middle: 0.3643),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/tolong beliin-3.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

const String _svg_f5viyk =
    '<svg viewBox="-3.0 530.3 378.0 281.7" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 375.0, 812.0)" d="M 0 246.9242401123047 C 0 246.9242401123047 65 310.372314453125 196.5 265.8932495117188 C 272 238.0938110351562 330.5 196.5582275390625 378 204.0804138183594 C 378 130.4937286376953 378 0 378 0 L 0 0 L 0 246.9242401123047 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
