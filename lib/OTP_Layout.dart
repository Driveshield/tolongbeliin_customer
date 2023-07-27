import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:homescreen/Dashboard_screen.dart';
// import 'package:homescreen/utils/Form.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:tolongbeliin_costumer/Carapesan1.dart';
import 'package:tolongbeliin_costumer/top/header.dart';
import 'package:tolongbeliin_costumer/utils/Form.dart';
import 'Forget_password_baru.dart';
// import 'component/top/header.dart';
import 'utils/primary_button.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:http/http.dart' as http;

import 'HOMESCREEN.dart';


class OtpScreen extends StatefulWidget {
  OtpScreen({required this.emailphone, required this.status, required this.fullname
  , required this.isemail, this.ispesan,this.storeForm, this.produkForm});
  String emailphone;
  String status;
  String fullname;
  String isemail;
  bool? ispesan;
  StoreForm? storeForm = StoreForm();
  ProductForm? produkForm = ProductForm();
 // String iddevicetiga;
  //String kodeotp;
  @override
  OneTimePasswordLayout createState() => OneTimePasswordLayout();
}

class OneTimePasswordLayout extends State<OtpScreen> {
  late List<TextStyle?> otpTextStyles;
  late List<TextEditingController?> otpController;
  bool validateOtp = false;
  OneSignalID idonesignal = OneSignalID();
  bool waktuotp = false;

  String? idDevice;
  void getDeviceIDUsingPlugin() async {
    var device = await PlatformDeviceId.getDeviceId;
    idDevice = device.toString();
  }

  submitForm (nameStoreController,OtpController,context)  async {

    setState(() {
      waktuotp = false;
    });
    String username = widget.emailphone;
    String? deviceId = idDevice;
    String status = widget.status;

    http.Response response;
    print("tess $deviceId");
    String kodeotp = otpController.map((controller) => controller?.text ?? "").join();
    print(kodeotp);
    if(username.isNotEmpty && kodeotp.isNotEmpty) {
      if(status == 'password') {
         response = await otpPassword(username,deviceId ,kodeotp);
      }
      else {
        response = await otpLogin(username,deviceId ,kodeotp);
      }
      //print(response.body);
      final data = json.decode(response.body);
      if(data['status'].toString() == 'false') {
        String errorMessage = data['message'];
        ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.info,
                                  title: "Error!",
                                  text: errorMessage));
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
        if(status == 'password') {
          Navigator.push(
          context,
         MaterialPageRoute(builder: (context) =>  ForgetPasswordScreenBaru(username: username,status: "setpassword", iddevice :idonesignal.idonesignal, kodeotp : kodeotp)),
        );
        } else {
          String errorMessage = data['message'];
          print(errorMessage);
          if(widget.ispesan == true)
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Carapesan1(ispesan: true,storeForm: widget.storeForm!, produkForm: widget.produkForm!,)),
            );

          }else{
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  HOMESCREEN(fullname: widget.fullname,ispesan: true,)),
            );
          }
        }
      }

    }
  }

  Future<http.Response> otpLogin(String fullname, String? idDevice,String kodeotp) async {
    
    OneSignalID notif = OneSignalID();
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

      OneSignal.shared.setAppId("5483fdb0-1fe9-4a7e-a37a-23cb83e44308");

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      setState((){ notif.idonesignal = osUserID; });

      //print(osUserID);
      // We will update this once he logged in and goes to dashboard.
      ////updateUserProfile(osUserID);
      // Store it into shared prefs, So that later we can use it.
      //Preferences.setOnesignalUserId(osUserID);

      // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
      OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
          //print("Accepted permission: $accepted");
      });
    //OneSignalID notif = OneSignalID();
    print(notif.idonesignal);
    return http.post(
      Uri.parse('https://dev.tolongbeliin.com/api/customer/cekkodeLogin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String?>{
        'emailphone': fullname,
        'iddevice' : idDevice,
        'kodeotp': kodeotp,
        'idonesignal': notif.idonesignal
      }),
    );
  }

  Future<http.Response> otpPassword(String fullname, String? idDevice,String kodeotp) {
    return http.post(
      Uri.parse('https://dev.tolongbeliin.com/api/customer/lupaPasswordKode'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String?>{
        'fullname': fullname,
        'iddevice' : idDevice,
        'kodeotp': kodeotp,
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    getDeviceIDUsingPlugin();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const HeaderTitle(
              headerTitle: "OTP Verificator"
          ),
          body: Container(
            height: double.infinity,
            decoration:const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage(
                      'assets/Bottom Vector Ads.png',
                    )
                )
            ),
            child: SingleChildScrollView(
              child:  Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    'assets/tolong beliin-3.png',
                    height: 150,
                    width: 200,
                  ),
                  SizedBox(height: 25),
                  (widget.isemail == '1') ? 
                  Center(
                    child: Text(
                      "Kami kirim kode ke email ${widget.emailphone} \n Silahkan cek email anda ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ) : Text(
                    "Kami kirim kode ke No Whatsapp ${widget.emailphone}, Silahkan cek Whatsapp anda ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Masukkan Kode OTP",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  OtpTextField(
                    margin: EdgeInsets.fromLTRB(7, 15, 7, 25),
                    numberOfFields: 6,
                    borderWidth: 1,
                    enabledBorderColor:Colors.grey,
                    showFieldAsBox: true,
                    onCodeChanged: (String value) {
                    },
                    handleControllers: (controllers) {
                      otpController = controllers;
                    },
                    onSubmit: (String verificationCode) {
                      setState(() {
                        var clearText = false;
                      });
                      submitForm("tess", otpController, context);
                      //navigate to different screen code goes here
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       title: Text("Verification Code"),
                      //       content: Text('Code entered is $verificationCode'),
                      //     );
                      //   },
                      // );
                    }, // end onSubmit
                  ),
                  // const SizedBox(height: 15),
                  // PrimaryButton(
                  //     text: "Send",
                  //     width: 200,
                  //     height: 50,
                  //     backgroundd: const Color(0xFF008037) ,
                  //     textcolor:  Colors.white,
                  //     onPressed: () {submitForm("tess", otpController, context);}
                  // ),
                  const SizedBox(height: 5),
                  const Text(
                    "Batas waktu memasukkan kode OTP",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF008037),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CupertinoPageScaffold(
                    child: TimerCountdown(
                      format: CountDownTimerFormat.minutesSeconds,
                      endTime: DateTime.now().add(
                        Duration(
                          minutes: 3,
                          seconds: 0,
                        ),
                      ),
                      onEnd: () {
                        print("Timer finished");
                        setState(() {
                          waktuotp = true;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  (waktuotp == true) ?  PrimaryButton(
                      text: "Kirim ulang kode",
                      width: 170,
                      height: 35,
                      backgroundd: const Color(0xFF008037) ,
                      textcolor:  Colors.white,
                      onPressed: () {
                        //submitForm("tess", otpController, context);
                        if(widget.status == 'signup')
                        {

                          //prosesSignup();

                        }else if(widget.status == 'login')
                        {

                        }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>  OtpScreen(emailphone: widget.emailphone,
                            fullname: widget.fullname,isemail: widget.isemail, status: widget.status,)),
                          );
                        },
                      isPressed: true,
                  ) : SizedBox(width: 10,),
                ],
              ),
            ),




          ),


        )
    );

  }
}