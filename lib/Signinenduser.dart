import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:tolongbeliin_costumer/Loginenduser.dart';
import 'package:tolongbeliin_costumer/OTP_Layout.dart';
import 'package:tolongbeliin_costumer/utils/Form.dart';
import 'package:tolongbeliin_costumer/utils/Styling.dart';
import 'package:tolongbeliin_costumer/utils/primary_button.dart';

import 'package:http/http.dart' as http;


class Signinenduser extends StatefulWidget {
  Signinenduser({super.key});

  // final String fullname;

  @override
  State<Signinenduser> createState() => _SigninenduserState();
}

class _SigninenduserState extends State<Signinenduser> {

  bool isbtndisabled = false;
  final TextEditingController emailphoneController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController kodereferalController = TextEditingController();
  
  
  String? idDevice;
  OneSignalID onesignal = OneSignalID();

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

      setState(() => onesignal.idonesignal = osUserID );

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

  Future <void> prosesSignup (emailphoneController,fullnameC,context)  async {
    String emailphone = emailphoneController;
    String fullname = fullnameC;
    String kodereferal = kodereferalController.text;
    String? deviceId = onesignal.idonesignal;
    bool loading = false;
    // setState(() {
    //   username.isEmpty ? validate = true  : validateNameStore = false;
    //   password.isEmpty ? validatePassword = true  : validatePassword = false;
    // });
    if(emailphone.isNotEmpty) {
      setState(() => loading = true);
      try {

        http.Response response = await signupUser(fullname,emailphone,kodereferal,deviceId!);

      print(response.statusCode);
      final data = json.decode(response.body);
      if(data['status'].toString() == 'false') {
        String errorMessage = data['message'];

        ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.info,
                                  title: "Error!",
                                  text: errorMessage));
        setState(() => loading = false);
      }else if(response.statusCode != 200) {

        String errorMessage = data['message'];

        ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.info,
                                  title: "Error!",
                                  text: errorMessage));

      }
      else {
        setState(() => loading = false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  OtpScreen(emailphone: emailphone, status: "signup",fullname: fullname,
          isemail: data['data'][0]['isemail'].toString())),
        );
      }
        
      } catch (e) {

        ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.info,
                                  title: "Error!",
                                  text: "Silahkan Cek Koneksi Internet Anda"));
        
      }
      

    }
  }

  Future<http.Response> signupUser(String fullname,String emailphone,String kodereferalController, String onesignalID) {
    print(emailphone);
    return http.post(
      Uri.parse('https://dev.tolongbeliin.com/api/customer/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fullname': fullname,
        'emailphone': emailphone,
        'referalcode': kodereferalController,
        'idonesignal': onesignalID,
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            
            Container(
              ),
            Container(),
            Pinned.fromPins(
              Pin(start: -19.0, end: -20.0),
              Pin(size: 144.0, start: 80.0),
              child: 
                  Container(
                    // width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/tolong beliin-3.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  
            ),
            Pinned.fromPins(
              Pin(start: -19.0, end: -20.0),
              Pin(size: 544.0, start: 220.0),
              child: 
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: const Text(
                              "Daftar Sekarang",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          const SizedBox(height: 30),
                          TextFormField(
                            //controller: emailphoneController,
                            onChanged: (value) {
                                  if(value.length > 7)
                                  {
                                    setState(() {
                                      isbtndisabled = true;
                                    });
                                  }else{
                                    setState(() {
                                      isbtndisabled = false;
                                    });
                                  }
                                  emailphoneController.text = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email/Nomor HP tidak boleh kosong';
                              }
                              return null;
                            },
                            decoration: TextFieldStyle.textFieldStyle(
                                hintTextStr: "Email / Nomor HP",
                                labelTextStr: "Email / Nomor HP"
                            ),
                            // style: TextStyle(backgroundColor: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            //controller: emailphoneController,
                            onChanged: (value) {
                                  if(value.length > 7)
                                  {
                                    setState(() {
                                      isbtndisabled = true;
                                    });
                                  }else{
                                    setState(() {
                                      isbtndisabled = false;
                                    });
                                  }
                                  fullnameController.text = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama Lengkap tidak boleh kosong';
                              }
                              return null;
                            },
                            decoration: TextFieldStyle.textFieldStyle(
                                hintTextStr: "Nama Lengkap",
                                labelTextStr: "Nama Lengkap"
                            ),
                            // style: TextStyle(backgroundColor: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: kodereferalController,
                            decoration: TextFieldStyle.textFieldStyle(
                                hintTextStr: "Code Referral",
                                labelTextStr: "Code Referral"
                            ),
                          ),
                          const SizedBox(height: 30),
                          PrimaryButton(
                            text: "Daftar",
                            width: screen.width,
                            height: 40,
                            fontSize: 24,
                            backgroundd: const Color(0xFF008037) ,
                            textcolor:  Colors.white,
                            onPressed: (){
                                prosesSignup(emailphoneController.text,fullnameController.text,context);
                            },
                            isPressed: isbtndisabled,
                          ),
                        ],
                      ),
                    ),
                  
            ),
            Pinned.fromPins(
              Pin(startFraction: 0.1813, endFraction: 0.1787),
              Pin(size: 473.0, middle: 0.7894),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Avenir-Medium',
                    fontSize: 14,
                    color: const Color(0xffa3a3a3),
                  ),
                  children: [
                    TextSpan(
                      text: 'Sudah punya akun Tolong Beliin ? ',
                    ),
                    TextSpan(
                      //mouseCursor: MaterialStateMouseCursor.clickable,
                      text: 'Masuk\n\n',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w900,
                      ),
                      recognizer: new TapGestureRecognizer()
                      ..onTap = () {  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  
                            //ConfirmationOrder()
                            //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                            Loginenduser(ispesan: false,)
                            ),
                          );
                      },
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
            Positioned(
              child: Pinned.fromPins(
                Pin(start: -1.5, end: -1.5),
                Pin(size: 147.9, end: 0.0),
                child: SvgPicture.string(
                  _svg_qvfldv,
                  allowDrawingOutsideViewBox: false,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String _svg_qvfldv =
    '<svg viewBox="-1.5 664.1 378.0 147.9" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 376.5, 812.0)" d="M 0 129.60693359375 C 0 129.60693359375 65 162.9098968505859 196.5 139.5634918212891 C 272 124.9719543457031 330.5 103.170539855957 378 107.1188278198242 C 378 68.49425506591797 378 0 378 0 L 0 0 L 0 129.60693359375 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
