// // import 'dart:math';
// //
// // import 'package:art_sweetalert/art_sweetalert.dart';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// //
// // import 'package:onesignal_flutter/onesignal_flutter.dart';
// //
// //
// // // import '../lib_backup/Food_screen.dart';
// // // import '../lib_backup/component/top/header.dart';
// // // import '../lib_backup/component/top/header_merchant.dart';
// // // import '../lib_backup/component/utils/primary_button.dart';
// //
// // class HomeMerchantScreen extends StatefulWidget {
// //   //FoodMerchantScreen({super.key});
// //   HomeMerchantScreen({super.key, required this.fullname});
// //   final String fullname;
// //
// //   @override
// //   State<HomeMerchantScreen> createState() => _HomeMerchantScreen();
// // }
// //
// // class _HomeMerchantScreen extends State<HomeMerchantScreen> {
// //
// // // class State<HomeMerchantScreen> extends StatelessWidget {
// //   //const HomeMerchantScreen({Key? key}) : super(key: key);
// //
// //
// //
// //
// //   DateTime? currentBackPressTime = null;
// //
// //   int? backint = 1;
// //
// //   bool? isnotiff = false;
// //
// //   // OneSignalID onesignal = OneSignalID();
// //
// //   // late final FirebaseMessaging _messaging;
// //
// //   // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   // // If you're going to use other Firebase services in the background, such as Firestore,
// //   // // make sure you call `initializeApp` before using other Firebase services.
// //   // //await Firebase.initializeApp();
// //
// //   // print("Handling a background message: ${message.messageId}");
// //   // }
// //
// //   void initState() {
// //
// //
// //     getNotification();
// //     super.initState();
// //   }
// //
// //   Future <void> getNotification() async {
// //
// //     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
// //
// //       OneSignal.shared.setAppId("5483fdb0-1fe9-4a7e-a37a-23cb83e44308");
// //       OneSignal.shared
// //           .setNotificationOpenedHandler((OSNotificationOpenedResult event) {
// //             //print("Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
// //             // Navigator.push(context as BuildContext,
// //             //              MaterialPageRoute(builder: (context) => ConfirmationOrder(fullname: result.notification.additionalData?['nama_toko'])));
// //             //istrue = true;
// //              var dataa = event.notification.additionalData!;
// //             //  Map<String, dynamic> ddd = [
// //             //   {'nama_toko' : 'aaaaa', 'data_produk' : [{'nama_produk' : 'bbbbb', 'harga_produk' : '20000'}]}
// //             //   ] as Map<String, dynamic>;
// //
// //
// //
// //             // Navigator.push(context as BuildContext,
// //             // MaterialPageRoute(builder: (context) => OrderMerchantScreen(fullname: widget.fullname,data: dataa)));
// //
// //
// //       });
// //
// //       // OneSignal.shared.setOnWillDisplayInAppMessageHandler((message) {
// //       //   print("OneSignal: On will display In-App message: ${message.messageId}");
// //       //   Navigator.push(context as BuildContext,
// //       //                    MaterialPageRoute(builder: (context) => ConfirmationOrder(fullname: widget.fullname)));
// //
// //       // });
// //
// //       OneSignal.shared
// //           .setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
// //             //print('FOREGROUND HANDLER CALLED WITH: ${event}');
// //
// //
// //             var dataa = event.notification.additionalData!;
// //
// //
// //
// //             // Navigator.push(context as BuildContext,
// //             // MaterialPageRoute(builder: (context) => OrderMerchantScreen(fullname: widget.fullname,data: dataa)));
// //             //
// //             //print("aaaa ${event.notification.additionalData!["nama_toko"]} ");
// //
// //             event.complete(event.notification);
// //
// //
// //
// //             // Navigator.pushNamed(context, routeName)
// //             // /// Display Notification, send null to not display
// //             // event.complete(null);
// //
// //             // this.setState(() {
// //             // _debugLabelString =
// //             //     "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
// //             // });
// //             //istrue = true;
// //       });
// //
// //       // OneSignal.shared
// //       //     .setInAppMessageClickedHandler((OSInAppMessageAction action) {
// //
// //       //       //print("In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}");
// //       //       Navigator.push(context as BuildContext,
// //       //                    MaterialPageRoute(builder: (context) => ConfirmationOrder(fullname: "ES SINAR GARUT RAYA")));
// //       //     // this.setState(() {
// //       //     // _debugLabelString =
// //       //     //     "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}";
// //       //     // });
// //       //     //istrue = true;
// //       // });
// //
// //   }
// //
// //
// //
// //   // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   // // If you're going to use other Firebase services in the background, such as Firestore,
// //   // // make sure you call `initializeApp` before using other Firebase services.
// //   // await Firebase.initializeApp();
// //
// //   // print("Handling a background message: ${message.messageId}");
// //   // }
// //
// //   // void registerNotification() async {
// //   //   await Firebase.initializeApp();
// //
// //   //   // 2. Instantiate Firebase Messaging
// //   //   _messaging = FirebaseMessaging.instance;
// //
// //   //   // 3. On iOS, this helps to take the user permissions
// //   //   NotificationSettings settings = await _messaging.requestPermission(
// //   //     alert: true,
// //   //     badge: true,
// //   //     provisional: false,
// //   //     sound: true,
// //   //   );
// //
// //   //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
// //   //     print('User granted permission');
// //
// //   //     // For handling the received notifications
// //   //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //   //       // Parse the message received
// //   //       // PushNotification notification = PushNotification(
// //   //       //   title: message.notification?.title,
// //   //       //   body: message.notification?.body,
// //   //       // );
// //
// //   //       // setState(() {
// //   //       //   _notificationInfo = notification;
// //   //       //   _totalNotifications++;
// //   //       // });
// //   //       print(message.notification?.title);
// //   //     });
// //   //   } else {
// //   //     print('User declined or has not accepted permission');
// //   //   }
// //   // }
// //
// //   // Future<void> onWillPop(context) {
// //   //   DateTime now = DateTime.now();
// //   //   if (currentBackPressTime == null ||
// //   //       now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
// //   //     currentBackPressTime = now;
// //   //     final snackBar = SnackBar(
// //   //           content: const Text('Yay! A SnackBar!'),
// //   //           action: SnackBarAction(
// //   //             label: 'Undo',
// //   //             onPressed: () {
// //   //               // Some code to undo the change.
// //   //             },
// //   //           ),
// //   //         );
// //
// //   //         // Find the ScaffoldMessenger in the widget tree
// //   //         // and use it to show a SnackBar.
// //   //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
// //   //     //return Future.value(false);
// //   //   }
// //   //   return Future.value(true);
// //   // }
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     //String fullname = "";
// //     Size screen = MediaQuery.of(context).size;
// //     //print(isnotiff);
// //     return MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         home: Scaffold(
// //             // appBar: HeaderMerchant(fullname: widget.fullname),
// //             body: Container(
// //               margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
// //               height: double.maxFinite,
// //               decoration: const BoxDecoration(
// //                   image: DecorationImage(
// //                       alignment: Alignment.bottomRight,
// //                       image: AssetImage(
// //                         'assets/Merchant/bottom_1.png',
// //                       ),
// //                       fit: BoxFit.scaleDown,
// //                       scale: 2.5)),
// //               child: Container(
// //                 padding: EdgeInsets.only(left: 30, right: 30),
// //                 child: Center(
// //                      child:
// //                      SingleChildScrollView(
// //                       child: Column(
// //                                       children: [
// //                       Image.asset(
// //                         'assets/homescreen/tolong beliin-3.png',
// //                         height: screen.height / 5,
// //                       ),
// //                       SizedBox(height: 15),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           // PrimaryButton(
// //                           //     text: "PILIH JENIS USAHA",
// //                           //     width: 100,
// //                           //     height: 30,
// //                           //     fontSize: 11.5,
// //                           //     fontWeight: FontWeight.bold,
// //                           //     backgroundd: const Color(0xFF008037) ,
// //                           //     textcolor:  Colors.white,
// //                           //     onPressed: () {}
// //                           //     ),
// //                           // PrimaryButton(
// //                           //     text: "ACCOUNT MERCHANT",
// //                           //     width: 100,
// //                           //     height: 30,
// //                           //     fontSize: 11.5,
// //                           //     backgroundd: const Color(0xFF008037) ,
// //                           //     textcolor:  Colors.white,
// //                           //     fontWeight: FontWeight.bold,
// //                           //     onPressed: () {
// //                           //        Navigator.push(context,
// //                           //           MaterialPageRoute(builder: (context) => DashboardScreen(fullname: widget.fullname)));
// //                           //     }
// //                           //     )
// //                         ],
// //                       ),
// //                       SizedBox(height: 30),
// //                       //( onesignal.isnotif != false ) ? navigatenotif(context) : cekonesignal(),
// //                       SingleChildScrollView(
// //                         child: Column(
// //                           children: [
// //
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                         children: [
// //                           Container(
// //                               decoration: BoxDecoration(color: Colors.white,
// //                               // boxShadow: [BoxShadow(color: const Color(0xFF008037)),BoxShadow(color: const Color(0xFF008037)),BoxShadow(color: const Color(0xFF008037)),BoxShadow(color: const Color(0xFF008037))],
// //                               // shape: BoxShape.rectangle,
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.black,
// //                                   blurRadius: 2,
// //                                   offset: Offset(4, 4), // Shadow position
// //                                 ),
// //                               ],
// //                               //border: Border.all(width: 1,color: const Color(0xFF008037),style: BorderStyle.solid)
// //                               ),
// //                               // foregroundDecoration:  MagnifierDecoration(opacity: 1,shadows: [BoxShadow(color: const Color(0xFF008037))]),//UnderlineTabIndicator(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: const Color(0xFF008037),), ),
// //                               height: 70,
// //                               width: 150,
// //                               child: Row(
// //                                 children: [
// //                                   // IconButton(
// //                                   //   // onPressed: (){Navigator.push(context,
// //                                   //   //   MaterialPageRoute(builder: (context) => FoodMerchantScreen(fullname: widget.fullname)));},
// //                                   //   iconSize: 50,
// //                                   //   color: Colors.white,
// //                                   //   icon: Image.asset(
// //                                   //     "assets/Merchant/Food.png",
// //                                   //     color: Colors.black,
// //                                   //   ),
// //                                   // ),
// //                                   Text("Makanan & \n Minuman",style: TextStyle(color: Colors.black),)
// //                                 ],
// //                               )
// //                           ),
// //                           SizedBox(width: 10,),
// //                           Container(
// //                               decoration: BoxDecoration(color: Colors.white,
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.black,
// //                                   blurRadius: 2,
// //                                   offset: Offset(4, 4), // Shadow position
// //                                 ),
// //                               ],
// //                               // border: Border.all(width: 2,color: const Color(0xFF008037),style: BorderStyle.solid)
// //
// //                               ),
// //                               height: 70,
// //                               width: 140,
// //                               child: Row(
// //                                 children: [
// //                                   IconButton(
// //                                     onPressed: (){Navigator.push(context,
// //                                     MaterialPageRoute(builder: (context) => BuahSayurMerchantScreen(fullname: widget.fullname)));},
// //                                     iconSize: 50,
// //                                     icon: Image.asset(
// //                                       "assets/Merchant/vegetable.png",
// //                                     ),
// //                                   ),
// //                                   Text("Buah & \n Sayur")
// //                                 ],
// //                               )
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(height: 25),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                         children: [
// //                           Container(
// //                               decoration: BoxDecoration(color: Colors.white,
// //                                boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.black,
// //                                   blurRadius: 2,
// //                                   offset: Offset(4, 4), // Shadow position
// //                                 ),
// //                               ],
// //                                //border: Border.all(width: 1,color: const Color(0xFF008037),style: BorderStyle.solid)
// //                               ),
// //                               height: 70,
// //                               width: 150,
// //                               child: Row(
// //                                 children: [
// //                                   IconButton(
// //                                     onPressed: (){Navigator.push(context,
// //                                     MaterialPageRoute(builder: (context) => ElektronikMerchantScreen(fullname: widget.fullname)));},
// //                                     iconSize: 50,
// //                                     icon: Image.asset(
// //                                       "assets/Merchant/Electrical.png",
// //                                     ),
// //                                   ),
// //                                   Text("Electronic \n & Cellular")
// //                                 ],
// //                               )
// //                           ),
// //                           SizedBox(width: 10,),
// //                           Container(
// //                               decoration: BoxDecoration(color: Colors.white,
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.black,
// //                                   blurRadius: 2,
// //                                   offset: Offset(4, 4), // Shadow position
// //                                 ),
// //                               ],
// //                               //border: Border.all(width: 1,color: const Color(0xFF008037),style: BorderStyle.solid)
// //                               ),
// //                               height: 70,
// //                               width: 140,
// //                               child: Row(
// //                                 children: [
// //                                   IconButton(
// //                                     onPressed: (){Navigator.push(context,
// //                                     MaterialPageRoute(builder: (context) => OtomotifMerchantScreen(fullname: widget.fullname)));},
// //                                     iconSize: 50,
// //                                     icon: Image.asset(
// //                                       "assets/Merchant/car-service.png",
// //                                       color: Colors.black,
// //                                     ),
// //                                   ),
// //                                   Text("Otomotif",style: TextStyle(color: Colors.black),)
// //                                 ],
// //                               )
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(height: 25),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                         children: [
// //                           Container(
// //                               decoration: BoxDecoration(color: Colors.white,
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.black,
// //                                   blurRadius: 2,
// //                                   offset: Offset(4, 4), // Shadow position
// //                                 ),
// //                               ],
// //                               // border: Border.all(width: 2,color: const Color(0xFF008037),style: BorderStyle.solid)
// //                               ),
// //                               height: 70,
// //                               width: 150,
// //                               child: Row(
// //                                 children: [
// //                                   IconButton(
// //                                     onPressed: (){
// //                                       Navigator.push(context,
// //                                     MaterialPageRoute(builder: (context) => MatrialMerchantScreen(fullname: widget.fullname)));
// //                                     },
// //                                     iconSize: 50,
// //                                     icon: Image.asset(
// //                                       "assets/Merchant/store.png",
// //                                     ),
// //                                   ),
// //                                   Text("Material")
// //                                 ],
// //                               )
// //                           ),
// //                           SizedBox(width: 10,),
// //                           Container(
// //                               decoration: BoxDecoration(color: Colors.white,
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.black,
// //                                   blurRadius: 2,
// //                                   offset: Offset(4, 4), // Shadow position
// //                                 ),
// //                               ],
// //                               //border: Border.all(width: 1,color: const Color(0xFF008037),style: BorderStyle.solid)
// //                               ),
// //                               height: 70,
// //                               width: 140,
// //                               child: Row(
// //                                 children: [
// //                                   IconButton(
// //                                     onPressed: (){Navigator.push(context,
// //                                     MaterialPageRoute(builder: (context) => FashionMerchantScreen(fullname: widget.fullname)));},
// //                                     iconSize: 50,
// //                                     icon: Image.asset(
// //                                       "assets/Merchant/Fashion.png",
// //                                     ),
// //                                   ),
// //                                   Text("Fashion & \n Hobby")
// //                                 ],
// //                               )),
// //                         ],
// //                       ),
// //                       SizedBox(height: 25),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Container(
// //                               margin: EdgeInsets.only(left: 10),
// //                               decoration: BoxDecoration(color: Colors.white,
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.black,
// //                                   blurRadius: 2,
// //                                   offset: Offset(4, 4), // Shadow position
// //                                 ),
// //                               ],
// //                               // border: Border.all(width: 2,color: const Color(0xFF008037),style: BorderStyle.solid)
// //                               ),
// //                               height: 70,
// //                               width: 150,
// //                               child: Row(
// //                                 children: [
// //                                   IconButton(
// //                                     onPressed: (){
// //                                     //   Navigator.push(context,
// //                                     // MaterialPageRoute(builder: (context) => PharmacyMerchantScreen(fullname: widget.fullname)));
// //                                     },
// //                                     iconSize: 50,
// //                                     icon: Image.asset(
// //                                       "assets/Merchant/pharmacy.png",
// //                                     ),
// //                                   ),
// //                                   Text("Pharmacy")
// //                                 ],
// //                               )
// //                           ),
// //
// //                         ],
// //                       )
// //                           ],
// //                         ),
// //                       )
// //
// //
// //                       ],
// //                       ),
// //                     )
// //                   ),
// //               ),
// //             )));
// //   }
// // }
// //
// // // navigatenotif(context) {
// //
// // //   Navigator.push(context,
// // //                          MaterialPageRoute(builder: (context) => ConfirmationOrder()));
// // // }
// //
// // // cekonesignal () {
// // //     OneSignalUtils notifications = OneSignalUtils();
// // //     OneSignalID onesignal = OneSignalID();
// // //     notifications.getNotification().then((value) {
// // //       //listmakanan = value.toList();
// // //         onesignal.isnotif = value;
// // //     });
// // // }
//
//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:adobe_xd/pinned.dart';
// // ignore: depend_on_referenced_packages
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tolongbeliin_costumer/Carapesan1.dart';
// import 'package:tolongbeliin_costumer/Homemenumakanan1.dart';
// import 'package:tolongbeliin_costumer/HomemenumakananBakso1.dart';
// import 'package:tolongbeliin_costumer/Homemenumakananescampus5.dart';
// import 'package:tolongbeliin_costumer/Homemenumakanangorengan1.dart';
// import 'package:tolongbeliin_costumer/ListViewPagination.dart';
// import 'package:tolongbeliin_costumer/Loginenduser.dart';
//
// class HOMESCREEN extends StatefulWidget {
//   HOMESCREEN({super.key, this.fullname, this.ispesan});
//
//   final String? fullname;
//   final bool? ispesan;
//
//   @override
//   State<HOMESCREEN> createState() => _HOMESCREENState();
// }
//
// class _HOMESCREENState extends State<HOMESCREEN> {
//   // HOMESCREENSCREEN({
//   //   Key? key,
//   // }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return
//       // MaterialApp(
//       //   debugShowCheckedModeBanner: false,
//       //   home:
//       Scaffold(
//         backgroundColor: const Color(0xffffffff),
//         body:
//         SafeArea(
//           child: Stack(
//             children: <Widget>[
//
//               //ini background
//
//               Pinned.fromPins(
//                 Pin(start: 0.0, end: 0.0),
//                 Pin(size: 450.0, start: 0.0),
//                 child: SvgPicture.string(
//                   _svg_t9sxc,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//
//               //background kotak putih
//
//               Pinned.fromPins(
//                 Pin(start: 0.0, end: 0.0),
//                 Pin(size: 585.0, end: -35.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xfff2f4f7),
//                     borderRadius: BorderRadius.circular(40.0),
//                   ),
//                 ),
//               ),
//
//
//               // gambar iklan bawah
//
//               // -------
//               Pinned.fromPins(
//                 Pin(size: 319.2, end: -120.2),
//                 Pin(size: 319.2, start: -94.2),
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       decoration: BoxDecoration(
//                         color: const Color(0x1fffffff),
//                         borderRadius:
//                         BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
//                       ),
//                       margin: EdgeInsets.all(13.0),
//                     ),
//                     SizedBox.expand(
//                         child: SvgPicture.string(
//                           _svg_gyhtxz,
//                           allowDrawingOutsideViewBox: true,
//                           fit: BoxFit.fill,
//                         )),
//                   ],
//                 ),
//               ),
//               // gambar icon atas kanan
//               Pinned.fromPins(
//                 Pin(size: 76.0, end: 20.0),
//                 Pin(size: 76.0, start: 25.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>
//                       //ConfirmationOrder()
//                       //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
//                       Loginenduser()
//                       ),
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: const AssetImage('assets/avatar-gamer.png'),
//                         fit: BoxFit.fill,
//                       ),
//                       borderRadius: BorderRadius.circular(80.0),
//                       border:
//                       Border.all(width: 5.0, color: const Color(0xffffffff)),
//                     ),
//                   ),
//                 ),
//               ),
//               // -------
//               Pinned.fromPins(
//                 Pin(start: 14.0, end: 13.0),
//                 Pin(size: 70.0, end: 17.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xffffffff),
//                     borderRadius: BorderRadius.circular(14.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0x17a254f2),
//                         offset: Offset(0, 10),
//                         blurRadius: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               //kotak e wallet
//               Pinned.fromPins(
//                 Pin(start: 14.0, end: 13.0),
//                 Pin(size: 70.0, middle: 0.1961),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xffffffff),
//                     borderRadius: BorderRadius.circular(14.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0x17a254f2),
//                         offset: Offset(0, 10),
//                         blurRadius: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               //search box
//               Pinned.fromPins(
//                 Pin(size: 200.0, start: 11.0),
//                 Pin(size: 23.0, start: 24.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xffffffff),
//                     borderRadius: BorderRadius.circular(14.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0x17a254f2),
//                         offset: Offset(0, 10),
//                         blurRadius: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//
//               Pinned.fromPins(
//                 Pin(size: 152.0, start: 14.0),
//                 Pin(size: 57.0, start: 60.0),
//                 child: Stack(
//                   children: <Widget>[
//                     Pinned.fromPins(
//                       Pin(startFraction: 0.0, endFraction: 0.0),
//                       Pin(size: 57.0, middle: 0.5),
//                       child: Text(
//                         maxLines: 10,
//                         overflow: TextOverflow.ellipsis,
//                         'Selamat Datang\n ${(widget.fullname == null) ? "" : widget.fullname}',
//                         style: TextStyle(
//                           fontFamily: 'Montserrat-Bold',
//                           fontSize: 20,
//                           color: const Color(0xffffffff),
//                           height: 1.3636363636363635,
//                         ),
//                         textHeightBehavior:
//                         TextHeightBehavior(applyHeightToFirstAscent: false),
//                         softWrap: false,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               //tulisan search box
//               Pinned.fromPins(
//                 Pin(size: 166.0, start: 26.0),
//                 Pin(size: 16.0, start: 28.0),
//                 child: Text(
//                   'Cari di Tolong beliin',
//                   style: TextStyle(
//                     fontFamily: 'SF Pro Text',
//                     fontSize: 14,
//                     color: const Color(0xffb8b8b8),
//                     letterSpacing: 0.003920000016689301,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               // Gambar Search Atas
//               Pinned.fromPins(
//                 Pin(size: 16.4, start: 21.9),
//                 Pin(size: 16.7, start: 28.0),
//                 child: SvgPicture.string(
//                   _svg_j4vw1,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               // -------------------
//
//
//               // Gambar Kaos & Pakaian
//               Pinned.fromPins(
//                 Pin(size: 40.8, start: 26.2),
//                 Pin(size: 33.0, middle: 0.3515),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>
//                       // ListViewPagination()),
//                       Homemenumakanan1(jenis: 'fashion',gambar: _svg_v65bu,idjenis: '2',ispesan: widget.ispesan,)),
//                     );
//                   },
//                   child: SvgPicture.string(
//                     _svg_v65bu,
//                     allowDrawingOutsideViewBox: true,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               // ---------------------
//               // Gambar Handphone 1
//               Positioned(
//                 child: Align(
//                   alignment: Alignment(-0.475, -0.288),
//                   child: SizedBox(
//                     width: 21.0,
//                     height: 30.0,
//                     child: Stack(
//                       children: <Widget>[
//                         SizedBox.expand(
//                             child: SvgPicture.string(
//                               _svg_itckf,
//                               allowDrawingOutsideViewBox: true,
//                               fit: BoxFit.fill,
//                             )),
//                         Pinned.fromPins(
//                           Pin(size: 1.0, middle: 0.525),
//                           Pin(size: 1.0, end: 5.0),
//                           child: SvgPicture.string(
//                             _svg_c80o6b,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               // ----------------
//               // Gambar Obat 2
//               Align(
//                 alignment: Alignment(0.123, -0.290),
//                 child: SizedBox(
//                   width: 35.0,
//                   height: 30.0,
//                   child: SvgPicture.string(
//                     _svg_hq015e,
//                     allowDrawingOutsideViewBox: true,
//                   ),
//                 ),
//               ),
//               // ----------
//               // Gambar Topup Tagihan
//               Align(
//                 alignment: Alignment(0.502, -0.288),
//                 child: SizedBox(
//                   width: 40.0,
//                   height: 28.0,
//                   child: SvgPicture.string(
//                     _svg_io3241,
//                     allowDrawingOutsideViewBox: true,
//                   ),
//                 ),
//               ),
//               // -----------------------
//               // Gambar Elektronik
//               Pinned.fromPins(
//                 Pin(size: 30.1, end: 22.3),
//                 Pin(size: 34.3, middle: 0.355),
//                 child: SvgPicture.string(
//                   _svg_st9xtj,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               // --------
//               Pinned.fromPins(
//                 Pin(size: 52.0, start: 21.0),
//                 Pin(size: 39.0, middle: 0.3995),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  Homemenumakanan1(jenis: 'fashion',gambar: _svg_v65bu,idjenis: '2',ispesan: widget.ispesan)),
//                     );
//                   },
//                   child: Text(
//                     'Kaos & \npakaian',
//                     style: TextStyle(
//                       fontFamily: 'Avenir',
//                       fontSize: 11,
//                       color: const Color(0xff000000),
//                       letterSpacing: 0.003080000013113022,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(size: 85.0, start: 14.0),
//                 Pin(size: 39.0, middle: 0.7387),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  Homemenumakanan1(jenis: 'makanan',gambar: _svg_q5rslb,idjenis: '1',ispesan: widget.ispesan)),
//                     );
//                   },
//                   child: Text(
//                     'Makanan & resto',
//                     style: TextStyle(
//                       fontFamily: 'Avenir',
//                       fontSize: 11,
//                       color: const Color(0xff000000),
//                       letterSpacing: 0.003080000013113022,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(size: 66.0, start: 30.0),
//                 Pin(size: 16.0, middle: 0.2487),
//                 child: Text(
//                   'Rp. 300.000',
//                   style: TextStyle(
//                     fontFamily: 'Avenir',
//                     fontSize: 11,
//                     color: const Color(0xff000000),
//                     letterSpacing: 0.003080000013113022,
//                     fontWeight: FontWeight.w300,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(size: 88.0, start: 17.0),
//                 Pin(size: 16.0, middle: 0.1929),
//                 child: Text(
//                   'Dompet digital',
//                   style: TextStyle(
//                     fontFamily: 'Avenir',
//                     fontSize: 11,
//                     color: const Color(0xff000000),
//                     letterSpacing: 0.003080000013113022,
//                     fontWeight: FontWeight.w300,
//                     shadows: [
//                       Shadow(
//                         color: const Color(0x29000000),
//                         offset: Offset(0, 3),
//                         blurRadius: 6,
//                       )
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Positioned(
//                 child: Align(
//                   alignment: Alignment(-0.036, -0.505),
//                   child: SizedBox(
//                     width: 66.0,
//                     height: 16.0,
//                     child: Text(
//                       'Rp. 30.000',
//                       style: TextStyle(
//                         fontFamily: 'Avenir',
//                         fontSize: 11,
//                         color: const Color(0xff000000),
//                         letterSpacing: 0.003080000013113022,
//                         fontWeight: FontWeight.w300,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(size: 66.0, end: 42.0),
//                 Pin(size: 16.0, middle: 0.2487),
//                 child: Text(
//                   'Rp. 20.000',
//                   style: TextStyle(
//                     fontFamily: 'Avenir',
//                     fontSize: 11,
//                     color: const Color(0xff000000),
//                     letterSpacing: 0.003080000013113022,
//                     fontWeight: FontWeight.w300,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Positioned(
//                 child: Align(
//                   alignment: Alignment(-0.411, -0.201),
//                   child: SizedBox(
//                     width: 59.0,
//                     height: 39.0,
//                     child: Text(
//                       'Handphone\n &Tablet ',
//                       style: TextStyle(
//                         fontFamily: 'Avenir',
//                         fontSize: 11,
//                         color: const Color(0xff000000),
//                         letterSpacing: 0.003080000013113022,
//                         fontWeight: FontWeight.w300,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment(0.101, -0.200),
//                 child: SizedBox(
//                   width: 68.0,
//                   height: 39.0,
//                   child: Text(
//                     'Obat-obatan',
//                     style: TextStyle(
//                       fontFamily: 'Avenir',
//                       fontSize: 11,
//                       color: const Color(0xff000000),
//                       letterSpacing: 0.003080000013113022,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment(0.557, -0.200),
//                 child: SizedBox(
//                   width: 68.0,
//                   height: 39.0,
//                   child: Text(
//                     'Tagihan &\nPulsa ',
//                     style: TextStyle(
//                       fontFamily: 'Avenir',
//                       fontSize: 11,
//                       color: const Color(0xff000000),
//                       letterSpacing: 0.003080000013113022,
//                       fontWeight: FontWeight.w300,
//                       shadows: [
//                         Shadow(
//                           color: const Color(0x29000000),
//                           offset: Offset(0, 3),
//                           blurRadius: 6,
//                         )
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(size: 68.0, end: 3.0),
//                 Pin(size: 39.0, middle: 0.4020),
//                 child: Text(
//                   'Electronic',
//                   style: TextStyle(
//                     fontFamily: 'Avenir',
//                     fontSize: 11,
//                     color: const Color(0xff000000),
//                     letterSpacing: 0.003080000013113022,
//                     fontWeight: FontWeight.w300,
//                     shadows: [
//                       Shadow(
//                         color: const Color(0x29000000),
//                         offset: Offset(0, 3),
//                         blurRadius: 6,
//                       )
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               // Gambar Handphone 2
//               Positioned(
//                 child: Align(
//                   alignment: Alignment(-0.319, -0.297),
//                   child: SizedBox(
//                     width: 32.0,
//                     height: 36.0,
//                     child: SvgPicture.string(
//                       _svg_h4a4to,
//                       allowDrawingOutsideViewBox: true,
//                     ),
//                   ),
//                 ),
//               ),
//               // --------
//               // Gambar Obat 1
//               Positioned(
//                 child: Align(
//                   alignment: Alignment(-0.052, -0.268),
//                   child: SizedBox(
//                     width: 23.0,
//                     height: 17.0,
//                     child: SvgPicture.string(
//                       _svg_xnbxbi,
//                       allowDrawingOutsideViewBox: true,
//                     ),
//                   ),
//                 ),
//               ),
//               // ----------
//               Pinned.fromPins(
//                 Pin(size: 70.0, start: 26.0),
//                 Pin(size: 20.0, middle: 0.2177),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: const AssetImage('assets/dana.jpg'),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 child: Align(
//                   alignment: Alignment(-0.043, -0.565),
//                   child: Container(
//                     width: 67.0,
//                     height: 20.0,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: const AssetImage('assets/gopay.png'),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(size: 58.0, end: 50.0),
//                 Pin(size: 24.0, middle: 0.215),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: const AssetImage('assets/ovo.png'),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//               // gambar iklan yg ditengah
//               Pinned.fromPins(
//                 Pin(start: 25.0, end: 18.0),
//                 Pin(size: 143.0, middle: 0.5331),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: const AssetImage('assets/iklan1.png'),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//               // --------
//               // Gambar Transaksi
//               Pinned.fromPins(
//                 Pin(size: 45.0, end: 27.7),
//                 Pin(size: 31.5, end: 38.3),
//                 child: SvgPicture.string(
//                   _svg_a2j0mf,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               // --------
//               // Gambar Makanan
//               Pinned.fromPins(
//                 Pin(size: 46.8, start: 32.0),
//                 Pin(size: 43.5, middle: 0.6812),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  Homemenumakanan1(jenis: 'makanan',gambar: _svg_q5rslb,idjenis: '1',ispesan: widget.ispesan)),
//                     );
//                   },
//                   child: SvgPicture.string(
//                     _svg_q5rslb,
//                     allowDrawingOutsideViewBox: true,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               // -----------
//               Positioned(
//                 child: Align(
//                   alignment: Alignment(-0.398, 0.370),
//                   child: Container(
//                     width: 70.0,
//                     height: 40.0,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: const AssetImage('assets/officialstore.png'),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               Positioned(
//                 child: Align(
//                   alignment: Alignment(-0.366, 0.431),
//                   child: SizedBox(
//                     width: 72.0,
//                     height: 14.0,
//                     child: SingleChildScrollView(
//                       primary: false,
//                       child: Text(
//                         'Official store',
//                         style: TextStyle(
//                           fontFamily: 'Avenir',
//                           fontSize: 11,
//                           color: const Color(0xff000000),
//                           letterSpacing: 0.003080000013113022,
//                           fontWeight: FontWeight.w300,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment(0.149, 0.46),
//                 child: SizedBox(
//                   width: 72.0,
//                   height: 30.0,
//                   child: Text(
//                     'Cash on delivery',
//                     style: TextStyle(
//                       fontFamily: 'Avenir',
//                       fontSize: 11,
//                       color: const Color(0xff000000),
//                       letterSpacing: 0.003080000013113022,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(size: 72.0, end: 39.0),
//                 Pin(size: 30.0, middle: 0.7353),
//                 child: Text(
//                   'Ticketing & travel',
//                   style: TextStyle(
//                     fontFamily: 'Avenir',
//                     fontSize: 11,
//                     color: const Color(0xff000000),
//                     letterSpacing: 0.003080000013113022,
//                     fontWeight: FontWeight.w300,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Align(
//                 alignment: Alignment(0.145, 0.377),
//                 child: Container(
//                   width: 38.0,
//                   height: 38.0,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: const AssetImage('assets/cod.png'),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(size: 51.0, end: 50.0),
//                 Pin(size: 51.0, middle: 0.6886),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: const AssetImage('assets/travel.png'),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(start: 32.0, end: 27.0),
//                 Pin(size: 51.0, end: 23.0),
//                 child: Stack(
//                   children: <Widget>[
//                     Pinned.fromPins(
//                       Pin(size: 31.0, start: 0.0),
//                       Pin(size: 13.0, end: 2.0),
//                       child: Text(
//                         'Home',
//                         style: TextStyle(
//                           fontFamily: '.AppleSystemUIFont',
//                           fontSize: 11,
//                           color: const Color(0xff020202),
//                         ),
//                         softWrap: false,
//                       ),
//                     ),
//                     Pinned.fromPins(
//                       Pin(size: 32.0, middle: 0.2359),
//                       Pin(size: 29.0, start: 5.0),
//                       child: SvgPicture.string(
//                         _svg_upqmv,
//                         allowDrawingOutsideViewBox: true,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     Pinned.fromPins(
//                       Pin(size: 32.0, middle: 0.2359),
//                       Pin(size: 13.0, end: 2.0),
//                       child: Text(
//                         'Feeds',
//                         style: TextStyle(
//                           fontFamily: '.AppleSystemUIFont',
//                           fontSize: 11,
//                           color: const Color(0xff020202),
//                         ),
//                         softWrap: false,
//                       ),
//                     ),
//                     Positioned(
//                       child: Align(
//                         alignment: Alignment(-0.049, 1.0),
//                         child: SizedBox(
//                           width: 28.0,
//                           height: 13.0,
//                           child: Text(
//                             'Maps',
//                             style: TextStyle(
//                               fontFamily: '.AppleSystemUIFont',
//                               fontSize: 11,
//                               color: const Color(0xff020202),
//                             ),
//                             softWrap: false,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment(0.402, 1.0),
//                       child: SizedBox(
//                         width: 45.0,
//                         height: 13.0,
//                         child: Text(
//                           'Whistlist',
//                           style: TextStyle(
//                             fontFamily: '.AppleSystemUIFont',
//                             fontSize: 11,
//                             color: const Color(0xff020202),
//                           ),
//                           softWrap: false,
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: SizedBox(
//                         width: 49.0,
//                         height: 13.0,
//                         child: Text(
//                           'Transaksi',
//                           style: TextStyle(
//                             fontFamily: '.AppleSystemUIFont',
//                             fontSize: 11,
//                             color: const Color(0xff020202),
//                           ),
//                           softWrap: false,
//                         ),
//                       ),
//                     ),
//                     Pinned.fromPins(
//                       Pin(size: 29.3, start: 0.7),
//                       Pin(size: 29.3, start: 5.0),
//                       child: Stack(
//                         children: <Widget>[
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(3.4, 3.9, 3.4, 0.0),
//                             child: SizedBox.expand(
//                                 child: SvgPicture.string(
//                                   _svg_ngukqz,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 )),
//                           ),
//                           Pinned.fromPins(
//                             Pin(start: 0.0, end: 0.0),
//                             Pin(size: 12.8, start: 0.0),
//                             child: SvgPicture.string(
//                               _svg_w42n6q,
//                               allowDrawingOutsideViewBox: true,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment(0.377, -1.0),
//                       child: SizedBox(
//                         width: 27.0,
//                         height: 36.0,
//                         child: SvgPicture.string(
//                           _svg_ank2nn,
//                           allowDrawingOutsideViewBox: true,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Pinned.fromPins(
//                 Pin(size: 40.5, middle: 0.488),
//                 Pin(size: 36.0, end: 38.0),
//                 child: SvgPicture.string(
//                   _svg_v9re6,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       );
//     // );
//   }
// }
//
// const String _svg_t9sxc =
//     '<svg viewBox="0.0 0.0 375.0 450.0" ><path  d="M 0 0 L 375 0 L 375 450 L 0 450 L 0 0 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_gyhtxz =
//     '<svg viewBox="-425.0 -499.0 319.2 319.2" ><path transform="translate(-425.0, 499.0)" d="M 159.62109375 0 C 247.7773590087891 0 319.2421875 71.46480560302734 319.2421875 159.62109375 C 319.2421875 247.7773590087891 247.7773590087891 319.2421875 159.62109375 319.2421875 C 71.46480560302734 319.2421875 0 247.7773590087891 0 159.62109375 C 0 71.46480560302734 71.46480560302734 0 159.62109375 0 Z" fill="none" fill-opacity="0.12" stroke="#ffffff" stroke-width="3" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_kfkp7 =
//     '<svg viewBox="0.5 0.5 22.0 11.0" ><path transform="translate(0.0, 0.33)" d="M 2.5 0.16668701171875 L 19.5 0.16668701171875 L 19.5 0.16668701171875 C 20.97275924682617 0.16668701171875 22.5 0.6939270496368408 22.5 2.16668701171875 L 22.5 8.16668701171875 L 22.5 8.16668701171875 C 22.5 9.639450073242188 20.97275924682617 11.16668701171875 19.5 11.16668701171875 L 2.5 11.16668701171875 L 2.5 11.16668701171875 C 1.027240037918091 11.16668701171875 0.5 9.639450073242188 0.5 8.16668701171875 L 0.5 2.16668701171875 L 0.5 2.16668701171875 C 0.5 0.6939270496368408 1.027240037918091 0.16668701171875 2.5 0.16668701171875 Z" fill="none" stroke="#ffffff" stroke-width="2" stroke-opacity="0.35" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_kuexp =
//     '<svg viewBox="0.0 0.0 22.0 12.0" ><path transform="translate(-336.0, 27.0)" d="M 339 -27 L 355 -27 L 355 -27 C 356.4727783203125 -27 358 -25.47275924682617 358 -24 L 358 -18 L 358 -18 C 358 -16.52724075317383 356.4727783203125 -15 355 -15 L 339 -15 L 339 -15 C 337.5272216796875 -15 336 -16.52724075317383 336 -18 L 336 -24 L 336 -24 C 336 -25.47275924682617 337.5272216796875 -27 339 -27 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_o7tv5 =
//     '<svg viewBox="-5.0 -5.0 11.0 14.0" ><path transform="translate(-359.0, 23.0)" d="M 354 -28 L 365 -28 L 365 -14 L 354 -14 L 354 -28 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_uwgagz =
//     '<svg viewBox="0.0 0.0 1.0 4.0" ><path transform="translate(-359.0, 23.0)" d="M 359 -23 L 359 -19 C 359.8046875 -19.33877944946289 360 -20.12686920166016 360 -21 C 360 -21.87313079833984 359.8046875 -22.66122055053711 359 -23" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_fjh56c =
//     '<svg viewBox="-5.0 -5.0 28.0 18.0" ><path transform="translate(-338.0, 25.0)" d="M 333 -30 L 361 -30 L 361 -12 L 333 -12 L 333 -30 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_yog5 =
//     '<svg viewBox="0.0 0.0 18.0 8.0" ><path transform="translate(-338.0, 25.0)" d="M 339 -25 L 355 -25 L 355 -25 C 355.736328125 -25 356 -23.73637962341309 356 -23 L 356 -19 L 356 -19 C 356 -18.26362037658691 355.736328125 -17 355 -17 L 339 -17 L 339 -17 C 338.263671875 -17 338 -18.26362037658691 338 -19 L 338 -23 L 338 -23 C 338 -23.73637962341309 338.263671875 -25 339 -25 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_wbd5zj =
//     '<svg viewBox="402.0 80.0 398.0 44.0" ><path transform="translate(402.0, 124.0)" d="M 0 -44 L 398.0000305175781 -44 L 398.0000305175781 0 L 0 0 L 0 -44 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_t4p74v =
//     '<svg viewBox="-5.0 -5.0 25.0 21.0" ><path transform="translate(-315.97, 27.03)" d="M 310.9999694824219 -32 L 335.9999694824219 -32 L 335.9999694824219 -11 L 310.9999694824219 -11 L 310.9999694824219 -32 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_q0e54n =
//     '<svg viewBox="0.0 0.0 15.1 11.1" ><path transform="translate(-315.97, 27.03)" d="M 322.9999694824219 -24 C 325.2158813476562 -23.99989891052246 327.3940734863281 -23.52680015563965 328.9999694824219 -22 C 329.1209716796875 -21.88212013244629 329.880859375 -21.88027954101562 329.9999694824219 -22 L 330.9999694824219 -23 C 331.0602722167969 -23.06072044372559 331.00048828125 -22.91441917419434 330.9999694824219 -23 C 330.9994812011719 -23.08558082580566 331.0609741210938 -23.93998146057129 330.9999694824219 -24 C 326.7848815917969 -28.03954124450684 320.2150573730469 -28.03954124450684 315.9999694824219 -24 C 315.9388732910156 -23.94003105163574 316.0005798339844 -23.08557891845703 315.9999694824219 -23 C 315.9994812011719 -22.91441917419434 315.939697265625 -23.06076049804688 315.9999694824219 -23 L 316.9999694824219 -22 C 317.1190795898438 -21.88010025024414 316.8790588378906 -21.8819408416748 316.9999694824219 -22 C 318.6060485839844 -23.52689933776855 320.7838745117188 -24.00000953674316 322.9999694824219 -24 L 322.9999694824219 -24 Z M 322.9999694824219 -21 C 324.2174682617188 -21.00008010864258 326.0975646972656 -19.81721115112305 326.9999694824219 -19 C 327.1220703125 -18.88401985168457 326.8809509277344 -18.88086891174316 326.9999694824219 -19 L 327.9999694824219 -20 C 328.0607604980469 -20.06118965148926 328.0008544921875 -20.91372871398926 327.9999694824219 -21 C 327.9990844726562 -21.08625984191895 328.0619812011719 -20.94005012512207 327.9999694824219 -21 C 325.2517700195312 -23.5563793182373 320.7481689453125 -23.5563793182373 317.9999694824219 -21 C 317.93798828125 -20.94005012512207 318.0007629394531 -21.08629035949707 317.9999694824219 -21 C 317.9991760253906 -20.91370964050293 317.9390869140625 -20.06110954284668 317.9999694824219 -20 L 319.9999694824219 -19 C 320.1189880371094 -18.88086891174316 319.8778686523438 -18.88401985168457 319.9999694824219 -19 C 320.9017639160156 -19.81666946411133 321.7832641601562 -20.9995002746582 322.9999694824219 -21 L 322.9999694824219 -21 Z M 325.9999694824219 -18 C 326.0617980957031 -18.06060981750488 326.0017700195312 -17.91350173950195 325.9999694824219 -18 C 325.9982604980469 -18.08651161193848 326.0641479492188 -17.94197082519531 325.9999694824219 -18 C 324.724365234375 -19.07888031005859 322.2754821777344 -19.07888031005859 320.9999694824219 -18 C 320.9356689453125 -17.9420108795166 321.0017700195312 -18.08650016784668 320.9999694824219 -18 C 320.998046875 -17.91349029541016 320.9382629394531 -18.06064987182617 320.9999694824219 -18 L 322.9999694824219 -16 C 323.0584716796875 -15.94075965881348 322.9166870117188 -16 322.9999694824219 -16 C 323.0832824707031 -16 323.9413757324219 -15.94075965881348 323.9999694824219 -16 L 325.9999694824219 -18 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_egpe5v =
//     '<svg viewBox="-5.0 -5.0 27.0 20.0" ><path transform="translate(-294.0, 26.0)" d="M 289 -31 L 316 -31 L 316 -11 L 289 -11 L 289 -31 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_k7ts =
//     '<svg viewBox="0.0 0.0 17.0 10.0" ><path transform="translate(-294.0, 26.0)" d="M 295 -20 L 296 -20 C 296.5523071289062 -20 297 -19.55228042602539 297 -19 L 297 -17 C 297 -16.44771003723145 296.5523071289062 -16 296 -16 L 295 -16 C 294.4477233886719 -16 294 -16.44771003723145 294 -17 L 294 -19 C 294 -19.55228042602539 294.4477233886719 -20 295 -20 L 295 -20 Z M 299 -22 L 300 -22 C 300.5522766113281 -22 301 -21.55228042602539 301 -21 L 301 -17 C 301 -16.44771003723145 300.5522766113281 -16 300 -16 L 299 -16 C 298.4476928710938 -16 298 -16.44771003723145 298 -17 L 298 -21 C 298 -21.55228042602539 298.4476928710938 -22 299 -22 Z M 304 -24 L 305 -24 C 305.5523071289062 -24 306 -23.55228042602539 306 -23 L 306 -17 C 306 -16.44771003723145 305.5523071289062 -16 305 -16 L 304 -16 C 303.4476928710938 -16 303 -16.44771003723145 303 -17 L 303 -23 C 303 -23.55228042602539 303.4476928710938 -24 304 -24 Z M 309 -26 L 310 -26 C 310.5523071289062 -26 311 -25.55228996276855 311 -25 L 311 -17 C 311 -16.44771003723145 310.5523071289062 -16 310 -16 L 309 -16 C 308.4477233886719 -16 308 -16.44771003723145 308 -17 L 308 -25 C 308 -25.55228996276855 308.4477233886719 -26 309 -26 L 309 -26 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_n5wzl =
//     '<svg viewBox="0.0 0.0 54.0 16.0" ><path transform="translate(-21.0, 35.0)" d="M 21 -19 L 75 -19 L 75 -35 L 21 -35 L 21 -19 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_j4vw1 =
//     '<svg viewBox="21.9 57.0 16.4 16.7" ><path transform="translate(21.91, 57.09)" d="M 7.115981101989746 -0.02436382882297039 C 3.192025661468506 -0.02436382882297039 0 3.215521812438965 0 7.198310852050781 C 0 11.1810998916626 3.192025899887085 14.42098617553711 7.115981101989746 14.42098617553711 C 8.315532684326172 14.42098617553711 9.494751930236816 14.13207912445068 10.49098873138428 13.57490158081055 C 10.57078838348389 13.67237281799316 10.65926551818848 13.76217460632324 10.75529670715332 13.84317111968994 L 12.78843402862549 15.90679264068604 C 13.29996776580811 16.49101257324219 14.08831596374512 16.73944091796875 14.83588790893555 16.55200004577637 C 15.58346176147461 16.36455917358398 16.16715621948242 15.77211284637451 16.35183143615723 15.01333141326904 C 16.53650283813477 14.25454807281494 16.2917423248291 13.45438098907471 15.71615314483643 12.93517780303955 L 13.68301486968994 10.87155628204346 C 13.58397674560547 10.77099704742432 13.47496318817139 10.68109607696533 13.35771369934082 10.60328674316406 C 13.90666103363037 9.592111587524414 14.25229358673096 8.415846824645996 14.25229358673096 7.177674293518066 C 14.25229358673096 3.19488525390625 11.06026744842529 -0.04500007629394531 7.136312484741211 -0.04500007629394531 Z M 7.115981101989746 2.039257526397705 C 9.942043304443359 2.039257526397705 12.19882488250732 4.329876899719238 12.19882488250732 7.198310852050781 C 12.19882488250732 8.560300827026367 11.71087169647217 9.819109916687012 10.85695457458496 10.74773979187012 C 10.8366231918335 10.76837635040283 10.81629180908203 10.78901195526123 10.79596042633057 10.80964851379395 C 10.69992923736572 10.89064311981201 10.61145210266113 10.98044681549072 10.53165245056152 11.07791805267334 C 9.637072563171387 11.9033670425415 8.417189598083496 12.37800025939941 7.095650672912598 12.37800025939941 C 4.269589424133301 12.37800025939941 2.01280689239502 10.08738040924072 2.01280689239502 7.218945980072021 C 2.01280689239502 4.350512027740479 4.269589424133301 2.059892892837524 7.095650672912598 2.059892892837524 Z" fill="#b8b8b8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_itckf =
//     '<svg viewBox="7.5 3.0 21.0 30.0" ><path  d="M 10.5 3 L 25.5 3 C 27.1568546295166 3 28.5 4.343145847320557 28.5 6 L 28.5 30 C 28.5 31.6568546295166 27.1568546295166 33 25.5 33 L 10.5 33 C 8.843146324157715 33 7.500000476837158 31.6568546295166 7.5 30 L 7.5 6 C 7.5 4.343145370483398 8.843146324157715 2.999999523162842 10.50000095367432 3 Z" fill="none" stroke="#000000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
// const String _svg_c80o6b =
//     '<svg viewBox="18.0 27.0 1.0 1.0" ><path  d="M 18 27 L 18 27" fill="none" stroke="#000000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
// const String _svg_v65bu =
//     '<svg viewBox="26.2 297.2 40.8 33.0" ><path transform="translate(24.4, 290.71)" d="M 42.56175994873047 12.06901264190674 C 42.63444900512695 12.35089302062988 42.54267501831055 12.66193389892578 42.38911437988281 12.90493392944336 L 37.49146270751953 20.70039176940918 C 37.30973052978516 21.00171279907227 36.92809677124023 21.16695213317871 36.60915756225586 21.16695213317871 C 36.51829147338867 21.16695213317871 36.26387023925781 21.14751243591309 36.16482543945312 21.11835289001465 L 32.23942947387695 20.0880298614502 L 32.23942947387695 38.55607223510742 C 32.23942947387695 39.11983489990234 31.86688423156738 39.528076171875 31.33077812194824 39.528076171875 L 12.24901294708252 39.528076171875 C 11.71290588378906 39.528076171875 11.34035682678223 39.11983489990234 11.34035682678223 38.55607223510742 L 11.34035682678223 20.0880298614502 L 7.814773559570312 21.12807083129883 C 7.405879020690918 21.26415061950684 7.051502704620361 21.08919334411621 6.824339389801025 20.71010971069336 L 1.963032960891724 12.93409156799316 C 1.808561563491821 12.68137073516846 1.763128757476807 12.39949035644531 1.835821151733398 12.11760902404785 C 1.899427175521851 11.82600879669189 2.090244770050049 11.63160800933838 2.335581541061401 11.49552726745605 L 12.24901294708252 6.479999542236328 L 16.79229164123535 6.479999542236328 C 17.32839775085449 6.479999542236328 17.70094680786133 6.878520011901855 17.70094680786133 7.452001571655273 C 17.70094680786133 9.454326629638672 20.32696151733398 10.87344932556152 22.19879150390625 10.87344932556152 C 24.07062149047852 10.87344932556152 26.78750038146973 9.464046478271484 26.78750038146973 7.452001571655273 C 26.78750038146973 6.888239860534668 27.16004943847656 6.479998588562012 27.6961555480957 6.479998588562012 L 32.23942947387695 6.479998588562012 L 42.05290985107422 11.39833068847656 C 42.30733108520508 11.53440952301025 42.48906326293945 11.77741050720215 42.56175231933594 12.06901264190674 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_hq015e =
//     '<svg viewBox="190.9 300.1 35.0 29.6" ><path transform="translate(190.92, 297.86)" d="M 31.73589706420898 8.164892196655273 L 26.26419067382812 8.164892196655273 L 26.26419067382812 5.207446098327637 C 26.26419067382812 3.574689388275146 24.79366874694824 2.25 22.98116683959961 2.25 L 12.03775405883789 2.25 C 10.22525119781494 2.25 8.754730224609375 3.574689388275146 8.754730224609375 5.207446098327637 L 8.754730224609375 8.164892196655273 L 3.283023834228516 8.164892196655273 C 1.470521092414856 8.164892196655273 0 9.489582061767578 0 11.12233829498291 L 0 28.86701774597168 C 0 30.4997730255127 1.470521092414856 31.824462890625 3.283023834228516 31.824462890625 L 31.73589706420898 31.824462890625 C 33.54840087890625 31.824462890625 35.0189208984375 30.4997730255127 35.0189208984375 28.86701774597168 L 35.0189208984375 11.12233829498291 C 35.0189208984375 9.489582061767578 33.54840087890625 8.164892196655273 31.73589706420898 8.164892196655273 Z M 13.13209533691406 6.193261623382568 L 21.88682556152344 6.193261623382568 L 21.88682556152344 8.164892196655273 L 13.13209533691406 8.164892196655273 L 13.13209533691406 6.193261623382568 Z M 24.07550811767578 21.47340202331543 C 24.07550811767578 21.7445011138916 23.82928276062012 21.96630859375 23.5283374786377 21.96630859375 L 19.69814300537109 21.96630859375 L 19.69814300537109 25.41666221618652 C 19.69814300537109 25.68776321411133 19.45191764831543 25.90957069396973 19.15097236633301 25.90957069396973 L 15.86794853210449 25.90957069396973 C 15.56700420379639 25.90957069396973 15.32077789306641 25.68776321411133 15.32077789306641 25.41666221618652 L 15.32077789306641 21.96630859375 L 11.4905834197998 21.96630859375 C 11.18964004516602 21.96630859375 10.94341278076172 21.7445011138916 10.94341278076172 21.47340202331543 L 10.94341278076172 18.51595497131348 C 10.94341278076172 18.2448558807373 11.18964004516602 18.02304649353027 11.4905834197998 18.02304649353027 L 15.32077789306641 18.02304649353027 L 15.32077789306641 14.57269287109375 C 15.32077789306641 14.30159282684326 15.56700420379639 14.07978439331055 15.86794853210449 14.07978439331055 L 19.15097236633301 14.07978439331055 C 19.45191764831543 14.07978439331055 19.69814300537109 14.30159282684326 19.69814300537109 14.57269287109375 L 19.69814300537109 18.02304649353027 L 23.5283374786377 18.02304649353027 C 23.82928276062012 18.02304649353027 24.07550811767578 18.2448558807373 24.07550811767578 18.51595497131348 L 24.07550811767578 21.47340202331543 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_io3241 =
//     '<svg viewBox="251.9 302.2 39.6 28.1" ><path transform="translate(251.92, 299.93)" d="M 0 28.30191421508789 C 0 29.40849304199219 0.8875633478164673 30.305908203125 1.981997728347778 30.305908203125 L 37.65795516967773 30.305908203125 C 38.75238800048828 30.305908203125 39.63995361328125 29.40849304199219 39.63995361328125 28.30191421508789 L 39.63995361328125 8.261981010437012 L 0 8.261981010437012 L 0 28.30191421508789 Z M 27.74796867370605 15.27595806121826 C 27.74796867370605 14.7223539352417 28.19143867492676 14.27396106719971 28.73896598815918 14.27396106719971 L 34.68495941162109 14.27396106719971 C 35.23248672485352 14.27396106719971 35.67595672607422 14.7223539352417 35.67595672607422 15.27595806121826 L 35.67595672607422 17.27994918823242 C 35.67595672607422 17.83355331420898 35.23248672485352 18.28194618225098 34.68495941162109 18.28194618225098 L 28.73896598815918 18.28194618225098 C 28.19143867492676 18.28194618225098 27.74796867370605 17.83355331420898 27.74796867370605 17.27994918823242 L 27.74796867370605 15.27595806121826 Z M 27.74796867370605 22.79093170166016 C 27.74796867370605 22.51412963867188 27.96970367431641 22.2899341583252 28.24346733093262 22.2899341583252 L 35.18045806884766 22.2899341583252 C 35.45421981811523 22.2899341583252 35.67595672607422 22.51412963867188 35.67595672607422 22.79093170166016 L 35.67595672607422 23.79292869567871 C 35.67595672607422 24.06973075866699 35.45421981811523 24.29392623901367 35.18045806884766 24.29392623901367 L 28.24346733093262 24.29392623901367 C 27.96970367431641 24.29392623901367 27.74796867370605 24.06973075866699 27.74796867370605 23.79292869567871 L 27.74796867370605 22.79093170166016 Z M 3.963995456695557 16.77895164489746 C 3.963995456695557 16.50214958190918 4.185731410980225 16.2779541015625 4.459494590759277 16.2779541015625 L 23.28847312927246 16.2779541015625 C 23.56223678588867 16.2779541015625 23.78397178649902 16.50214958190918 23.78397178649902 16.77895164489746 L 23.78397178649902 17.78094863891602 C 23.78397178649902 18.0577507019043 23.56223678588867 18.28194618225098 23.28847312927246 18.28194618225098 L 4.459494590759277 18.28194618225098 C 4.185731410980225 18.28194618225098 3.963995456695557 18.0577507019043 3.963995456695557 17.78094863891602 L 3.963995456695557 16.77895164489746 Z M 3.963995456695557 22.79093170166016 C 3.963995456695557 22.51412963867188 4.185731410980225 22.2899341583252 4.459494590759277 22.2899341583252 L 15.36048221588135 22.2899341583252 C 15.63424587249756 22.2899341583252 15.85598182678223 22.51412963867188 15.85598182678223 22.79093170166016 L 15.85598182678223 23.79292869567871 C 15.85598182678223 24.06973075866699 15.63424587249756 24.29392623901367 15.36048221588135 24.29392623901367 L 4.459494590759277 24.29392623901367 C 4.185731410980225 24.29392623901367 3.963995456695557 24.06973075866699 3.963995456695557 23.79292869567871 L 3.963995456695557 22.79093170166016 Z M 38.64895629882812 2.25 L 0.9909988641738892 2.25 C 0.4434719979763031 2.25 0 2.69839334487915 0 3.251996517181396 L 0 6.257986545562744 L 39.63995361328125 6.257986545562744 L 39.63995361328125 3.251996517181396 C 39.63995361328125 2.69839334487915 39.19648361206055 2.25 38.64895629882812 2.25 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_st9xtj =
//     '<svg viewBox="322.6 294.8 30.1 34.3" ><path transform="translate(319.83, 293.78)" d="M 17.79696083068848 35.27999877929688 C 9.488161087036133 35.27999877929688 2.728080749511719 28.51991844177246 2.728080749511719 20.21039962768555 C 2.728080749511719 14.89247894287109 5.446800708770752 10.07063961029053 10.00152015686035 7.313039779663086 C 10.97674369812012 6.72233772277832 12.24617767333984 7.034055233001709 12.83687973022461 8.009279251098633 C 13.42758083343506 8.984503746032715 13.11586380004883 10.25393772125244 12.14063930511475 10.84463882446289 C 8.832240104675293 12.84768009185791 6.857280254364014 16.34976005554199 6.857280254364014 20.21039962768555 C 6.857280254364014 26.24327850341797 11.76480007171631 31.15079879760742 17.79767990112305 31.15079879760742 C 23.83055877685547 31.15079879760742 28.73736000061035 26.24327850341797 28.73736000061035 20.21039962768555 C 28.73736000061035 16.28639984130859 26.61767959594727 12.63959980010986 23.20272064208984 10.69559955596924 C 22.21188545227051 10.1317253112793 21.86610794067383 8.871288299560547 22.43025207519531 7.880606174468994 C 22.9943962097168 6.889923572540283 24.25483322143555 6.544146537780762 25.24551391601562 7.108290672302246 C 29.95143890380859 9.793527603149414 32.85929107666016 14.79298686981201 32.86656188964844 20.21112060546875 C 32.86584091186523 28.51992034912109 26.10720062255859 35.27999877929688 17.79696083068848 35.27999877929688 Z M 17.63999938964844 20.00448036193848 C 16.50024032592773 20.00448036193848 15.11999893188477 19.07999992370605 15.11999893188477 17.94024085998535 L 15.11999893188477 3.077280044555664 C 15.11999893188477 1.937520027160645 16.5002384185791 1.013040065765381 17.63999938964844 1.013040065765381 C 18.77976036071777 1.013040065765381 20.15999984741211 1.937520027160645 20.15999984741211 3.077280044555664 L 20.15999984741211 17.94023895263672 C 20.15999984741211 19.07999801635742 18.77976036071777 20.00447845458984 17.63999938964844 20.00447845458984 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_h4a4to =
//     '<svg viewBox="117.0 293.1 31.5 36.0" ><path transform="translate(117.0, 293.06)" d="M 28.125 0 L 3.375 0 C 1.51171875 0 0 1.51171875 0 3.375 L 0 32.625 C 0 34.48828125 1.51171875 36 3.375 36 L 28.125 36 C 29.98828125 36 31.5 34.48828125 31.5 32.625 L 31.5 3.375 C 31.5 1.51171875 29.98828125 0 28.125 0 Z M 15.75 33.75 C 14.50546836853027 33.75 13.5 32.74452972412109 13.5 31.5 C 13.5 30.25547027587891 14.50546836853027 29.25 15.75 29.25 C 16.99453163146973 29.25 18 30.25546836853027 18 31.5 C 18 32.74452972412109 16.99453163146973 33.75 15.75 33.75 Z M 28.125 26.15625 C 28.125 26.62031173706055 27.74531173706055 27 27.28125 27 L 4.21875 27 C 3.754687547683716 27 3.375 26.62031173706055 3.375 26.15625 L 3.375 4.21875 C 3.375 3.754687547683716 3.754687547683716 3.375 4.21875 3.375 L 27.28125 3.375 C 27.74531173706055 3.375 28.125 3.754687547683716 28.125 4.21875 L 28.125 26.15625 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_xnbxbi =
//     '<svg viewBox="167.0 310.9 22.5 17.1" ><path transform="translate(167.0, 310.94)" d="M 5.635006427764893 6.398358345031738 C 2.77875804901123 6.398358345031738 0.4402267634868622 8.3480224609375 0.003513049101457 10.8875846862793 C -0.02466202713549137 11.04755687713623 0.1197352409362793 11.19753074645996 0.2958294749259949 11.19753074645996 L 10.97770595550537 11.19753074645996 C 11.15380001068115 11.19753074645996 11.29819679260254 11.04755687713623 11.27002239227295 10.8875846862793 C 10.82978630065918 8.3480224609375 8.491254806518555 6.398358345031738 5.635006427764893 6.398358345031738 Z M 10.97418308258057 12.26401329040527 L 0.2958294749259949 12.26401329040527 C 0.1197352334856987 12.26401329040527 -0.02466204017400742 12.413987159729 0.003513055155053735 12.57395935058594 C 0.4402267634868622 15.11352157592773 2.77875804901123 17.06318473815918 5.635006427764893 17.06318473815918 C 8.491254806518555 17.06318473815918 10.82978630065918 15.11352157592773 11.26650047302246 12.57395935058594 C 11.29467582702637 12.413987159729 11.15027904510498 12.26401329040527 10.97418403625488 12.26401329040527 Z M 20.89885330200195 1.55252742767334 C 18.90898895263672 -0.3304811418056488 15.82029724121094 -0.4937862157821655 13.61207580566406 1.019286036491394 C 13.47119998931885 1.115936160087585 13.46063423156738 1.315901637077332 13.58390045166016 1.429215312004089 L 21.02564239501953 8.474666595458984 C 21.14890670776367 8.591313362121582 21.36021995544434 8.581315040588379 21.45883369445801 8.448004722595215 C 23.0612907409668 6.358365058898926 22.88871955871582 3.435535907745361 20.89885330200195 1.552527546882629 Z M 12.78443241119385 2.189084053039551 C 12.66116619110107 2.072437524795532 12.44985389709473 2.082435846328735 12.35124111175537 2.215746164321899 C 10.75230503082275 4.305386066436768 10.92487812042236 7.228215217590332 12.91122055053711 9.111224174499512 C 14.90108585357666 10.99423313140869 17.98977851867676 11.15753841400146 20.197998046875 9.641133308410645 C 20.33887481689453 9.544483184814453 20.34943962097168 9.344517707824707 20.22617530822754 9.231204032897949 L 12.78443241119385 2.189084053039551 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_a2j0mf =
//     '<svg viewBox="302.3 742.3 45.0 31.5" ><path transform="translate(302.3, 740.0)" d="M 42.75 2.25 L 2.25 2.25 C 1.007578134536743 2.25 0 3.257578134536743 0 4.5 L 0 31.5 C 0 32.7424201965332 1.007578134536743 33.75 2.25 33.75 L 42.75 33.75 C 43.9924201965332 33.75 45 32.7424201965332 45 31.5 L 45 4.5 C 45 3.257578134536743 43.9924201965332 2.25 42.75 2.25 Z M 12.375 23.05406188964844 L 12.375 24.1875 C 12.375 24.49828147888184 12.12328147888184 24.75 11.8125 24.75 L 10.6875 24.75 C 10.37671852111816 24.75 10.125 24.49828147888184 10.125 24.1875 L 10.125 23.0421085357666 C 9.331171989440918 23.00132751464844 8.559141159057617 22.72429656982422 7.919297218322754 22.24406242370605 C 7.645078659057617 22.03804588317871 7.631015777587891 21.62742233276367 7.879219055175781 21.39046859741211 L 8.705390930175781 20.60226631164551 C 8.90015697479248 20.41664123535156 9.189844131469727 20.408203125 9.417656898498535 20.55093765258789 C 9.689765930175781 20.72109413146973 9.998437881469727 20.8125 10.31906318664551 20.8125 L 12.29554748535156 20.8125 C 12.75257873535156 20.8125 13.12523460388184 20.39624977111816 13.12523460388184 19.88507843017578 C 13.12523460388184 19.46671867370605 12.87140655517578 19.09828186035156 12.50859355926514 18.98999977111816 L 9.344531059265137 18.04078102111816 C 8.037422180175781 17.6484375 7.124062538146973 16.39406204223633 7.124062538146973 14.98992156982422 C 7.124062538146973 13.26585960388184 8.463515281677246 11.865234375 10.12429714202881 11.82093715667725 L 10.12429714202881 10.6875 C 10.12429714202881 10.37671852111816 10.37601566314697 10.125 10.68679714202881 10.125 L 11.81179714202881 10.125 C 12.12257862091064 10.125 12.37429714202881 10.37671852111816 12.37429714202881 10.6875 L 12.37429714202881 11.83289051055908 C 13.16812515258789 11.87367153167725 13.94015693664551 12.14999961853027 14.57999992370605 12.63093757629395 C 14.85421848297119 12.83695316314697 14.86828136444092 13.24757862091064 14.62007808685303 13.48453140258789 L 13.79390621185303 14.27273464202881 C 13.59914016723633 14.45835971832275 13.30945301055908 14.466796875 13.08164024353027 14.32406234741211 C 12.80953121185303 14.15320301055908 12.50085926055908 14.0625 12.1802339553833 14.0625 L 10.20374965667725 14.0625 C 9.746718406677246 14.0625 9.374062538146973 14.47875022888184 9.374062538146973 14.98992156982422 C 9.374062538146973 15.40828132629395 9.627890586853027 15.77671813964844 9.990703582763672 15.88499927520752 L 13.15476608276367 16.8342170715332 C 14.46187591552734 17.22656059265137 15.37523460388184 18.48093605041504 15.37523460388184 19.88507652282715 C 15.37523460388184 21.60984230041504 14.03578186035156 23.00976371765137 12.375 23.05406188964844 Z M 29.25 21.9375 C 29.25 22.24828147888184 28.99828147888184 22.5 28.6875 22.5 L 20.8125 22.5 C 20.50171852111816 22.5 20.25 22.24828147888184 20.25 21.9375 L 20.25 20.8125 C 20.25 20.50171852111816 20.50171852111816 20.25 20.8125 20.25 L 28.6875 20.25 C 28.99828147888184 20.25 29.25 20.50171852111816 29.25 20.8125 L 29.25 21.9375 Z M 40.5 21.9375 C 40.5 22.24828147888184 40.2482795715332 22.5 39.9375 22.5 L 34.3125 22.5 C 34.0017204284668 22.5 33.75 22.24828147888184 33.75 21.9375 L 33.75 20.8125 C 33.75 20.50171852111816 34.0017204284668 20.25 34.3125 20.25 L 39.9375 20.25 C 40.2482795715332 20.25 40.5 20.50171852111816 40.5 20.8125 L 40.5 21.9375 Z M 40.5 15.1875 C 40.5 15.49828147888184 40.2482795715332 15.75 39.9375 15.75 L 20.8125 15.75 C 20.50171852111816 15.75 20.25 15.49828147888184 20.25 15.1875 L 20.25 14.0625 C 20.25 13.75171852111816 20.50171852111816 13.5 20.8125 13.5 L 39.9375 13.5 C 40.2482795715332 13.5 40.5 13.75171852111816 40.5 14.0625 L 40.5 15.1875 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_q5rslb =
//     '<svg viewBox="32.0 523.5 46.8 43.5" ><path transform="translate(31.28, 520.68)" d="M 47.41758728027344 14.43542194366455 L 43.58088684082031 46.32470703125 L 30.62190246582031 46.32470703125 L 26.8007984161377 14.27621269226074 L 42.62146759033203 14.27621269226074 L 45.74835586547852 2.824559926986694 L 47.52093887329102 3.391095876693726 L 44.52080535888672 14.41164302825928 L 47.4175910949707 14.43542098999023 Z M 24.9687385559082 32.88501739501953 C 24.9687385559082 32.88501739501953 25.45332145690918 28.74973297119141 18.73348426818848 28.74973297119141 L 8.031671524047852 28.74973297119141 C 1.321586847305298 28.74973297119141 1.79642117023468 32.8850212097168 1.79642117023468 32.8850212097168 L 24.9687385559082 32.8850212097168 Z M 1.796421647071838 42.18942642211914 C 1.796421647071838 42.18942642211914 1.321586847305298 46.32470703125 8.031671524047852 46.32470703125 L 18.73446273803711 46.32470703125 C 25.45429801940918 46.32470703125 24.96971321105957 42.18942260742188 24.96971321105957 42.18942260742188 L 1.796421647071838 42.18942260742188 Z M 23.9634895324707 40.12177658081055 C 25.06331443786621 40.12177658081055 25.95155715942383 38.97010040283203 25.95155715942383 37.53825378417969 C 25.95155715942383 36.09814453125 25.06331443786621 34.95266342163086 23.9634895324707 34.95266342163086 L 2.709039926528931 34.95266342163086 C 1.614092946052551 34.95267105102539 0.7200000286102295 36.09814453125 0.7200000286102295 37.53825378417969 C 0.7200000286102295 38.97010040283203 1.614092946052551 40.12177658081055 2.709039926528931 40.12177658081055 L 23.96349143981934 40.12177658081055 Z" fill="#047e3c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_upqmv =
//     '<svg viewBox="107.0 724.0 32.0 29.0" ><path transform="translate(104.49, 721.37)" d="M 2.513916015625 18.6275634765625 L 16.513916015625 18.6275634765625 L 16.513916015625 2.6275634765625 L 2.513916015625 2.6275634765625 L 2.513916015625 18.6275634765625 Z M 2.513916015625 31.6275634765625 L 16.513916015625 31.6275634765625 L 16.513916015625 21.6275634765625 L 2.513916015625 21.6275634765625 L 2.513916015625 31.6275634765625 Z M 20.513916015625 31.6275634765625 L 34.513916015625 31.6275634765625 L 34.513916015625 15.6275634765625 L 20.513916015625 15.6275634765625 L 20.513916015625 31.6275634765625 Z M 20.513916015625 2.6275634765625 L 20.513916015625 12.6275634765625 L 34.513916015625 12.6275634765625 L 34.513916015625 2.6275634765625 L 20.513916015625 2.6275634765625 Z" fill="#020202" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_ngukqz =
//     '<svg viewBox="6.8 7.3 22.5 25.4" ><path  d="M 18.17578125 7.319531440734863 C 18.0703125 7.235156536102295 17.9296875 7.235156536102295 17.82421875 7.319531440734863 L 6.85546875 16.09453201293945 C 6.792187690734863 16.15078163146973 6.75 16.22812652587891 6.75 16.3125 L 6.75 32.484375 C 6.75 32.56171798706055 6.813281059265137 32.625 6.890625 32.625 L 14.484375 32.625 C 14.56171894073486 32.625 14.625 32.56171798706055 14.625 32.484375 L 14.625 22.640625 C 14.625 22.56328201293945 14.68828105926514 22.5 14.765625 22.5 L 21.234375 22.5 C 21.31171798706055 22.5 21.375 22.56328201293945 21.375 22.640625 L 21.375 32.484375 C 21.375 32.56171798706055 21.43828201293945 32.625 21.515625 32.625 L 29.109375 32.625 C 29.18671798706055 32.625 29.25 32.56171798706055 29.25 32.484375 L 29.25 16.3125 C 29.25 16.22812461853027 29.20781326293945 16.14374923706055 29.14453125 16.09453201293945 L 18.17578125 7.319531440734863 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_w42n6q =
//     '<svg viewBox="3.4 3.4 29.3 12.8" ><path  d="M 32.25234222412109 14.35781288146973 L 18.96327972412109 3.71250057220459 C 18.69609451293945 3.494531154632568 18.3515625 3.375 18 3.375 C 17.6484375 3.375 17.30390548706055 3.494531154632568 17.03671836853027 3.712500095367432 L 11.25 8.416406631469727 L 11.25 5.44921875 C 11.25 5.371874809265137 11.18671894073486 5.30859375 11.109375 5.30859375 L 6.890625 5.30859375 C 6.813281059265137 5.30859375 6.75 5.371874809265137 6.75 5.44921875 L 6.75 11.93203163146973 L 3.747656345367432 14.40000057220459 C 3.529687643051147 14.57578182220459 3.389062643051147 14.83593845367432 3.375 15.11718845367432 C 3.360937595367432 15.39843845367432 3.466406345367432 15.67265701293945 3.663281202316284 15.86953258514404 C 3.846093654632568 16.05234527587891 4.092187404632568 16.15781402587891 4.359375 16.15781402587891 C 4.584374904632568 16.15781402587891 4.802343845367432 16.08047103881836 4.978125095367432 15.93984508514404 L 17.90859413146973 5.533595085144043 C 17.94375038146973 5.505470275878906 17.97187614440918 5.505470275878906 18 5.505470275878906 C 18.02812385559082 5.505470275878906 18.05624961853027 5.51250171661377 18.09140586853027 5.533595085144043 L 31.02187347412109 15.89765739440918 C 31.19765472412109 16.03828239440918 31.41562271118164 16.11562538146973 31.64062309265137 16.11562538146973 C 31.90077972412109 16.11562538146973 32.14687347412109 16.01718711853027 32.33671569824219 15.82734394073486 C 32.54062271118164 15.63046932220459 32.64609146118164 15.35624980926514 32.63202667236328 15.07499980926514 C 32.61093902587891 14.79374980926514 32.47734451293945 14.53359413146973 32.25234222412109 14.35781288146973 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_ank2nn =
//     '<svg viewBox="239.0 719.0 27.0 36.0" ><path transform="translate(239.0, 719.0)" d="M 23.625 4.5 L 18 4.5 C 18 2.017968654632568 15.98203086853027 0 13.5 0 C 11.01796913146973 0 9 2.017968654632568 9 4.5 L 3.375 4.5 C 1.51171875 4.5 0 6.01171875 0 7.875 L 0 32.625 C 0 34.48828125 1.51171875 36 3.375 36 L 23.625 36 C 25.48828125 36 27 34.48828125 27 32.625 L 27 7.875 C 27 6.01171875 25.48828125 4.5 23.625 4.5 Z M 6.75 29.8125 C 5.814843654632568 29.8125 5.0625 29.06015586853027 5.0625 28.125 C 5.0625 27.18984413146973 5.814843654632568 26.4375 6.75 26.4375 C 7.685156345367432 26.4375 8.4375 27.18984413146973 8.4375 28.125 C 8.4375 29.06015586853027 7.685156345367432 29.8125 6.75 29.8125 Z M 6.75 23.0625 C 5.814843654632568 23.0625 5.0625 22.31015586853027 5.0625 21.375 C 5.0625 20.43984413146973 5.814843654632568 19.6875 6.75 19.6875 C 7.685156345367432 19.6875 8.4375 20.43984413146973 8.4375 21.375 C 8.4375 22.31015586853027 7.685156345367432 23.0625 6.75 23.0625 Z M 6.75 16.3125 C 5.814843654632568 16.3125 5.0625 15.56015586853027 5.0625 14.625 C 5.0625 13.68984413146973 5.814843654632568 12.9375 6.75 12.9375 C 7.685156345367432 12.9375 8.4375 13.68984413146973 8.4375 14.625 C 8.4375 15.56015586853027 7.685156345367432 16.3125 6.75 16.3125 Z M 13.5 2.8125 C 14.43515586853027 2.8125 15.1875 3.564843654632568 15.1875 4.5 C 15.1875 5.435156345367432 14.43515586853027 6.1875 13.5 6.1875 C 12.56484413146973 6.1875 11.8125 5.435156345367432 11.8125 4.5 C 11.8125 3.564843654632568 12.56484413146973 2.8125 13.5 2.8125 Z M 22.5 28.6875 C 22.5 28.99687576293945 22.24687576293945 29.25 21.9375 29.25 L 11.8125 29.25 C 11.50312519073486 29.25 11.25 28.99687576293945 11.25 28.6875 L 11.25 27.5625 C 11.25 27.25312423706055 11.50312519073486 27 11.8125 27 L 21.9375 27 C 22.24687576293945 27 22.5 27.25312423706055 22.5 27.5625 L 22.5 28.6875 Z M 22.5 21.9375 C 22.5 22.24687576293945 22.24687576293945 22.5 21.9375 22.5 L 11.8125 22.5 C 11.50312519073486 22.5 11.25 22.24687576293945 11.25 21.9375 L 11.25 20.8125 C 11.25 20.50312423706055 11.50312519073486 20.25 11.8125 20.25 L 21.9375 20.25 C 22.24687576293945 20.25 22.5 20.50312423706055 22.5 20.8125 L 22.5 21.9375 Z M 22.5 15.1875 C 22.5 15.49687480926514 22.24687576293945 15.75 21.9375 15.75 L 11.8125 15.75 C 11.50312519073486 15.75 11.25 15.49687480926514 11.25 15.1875 L 11.25 14.0625 C 11.25 13.75312519073486 11.50312519073486 13.5 11.8125 13.5 L 21.9375 13.5 C 22.24687576293945 13.5 22.5 13.75312519073486 22.5 14.0625 L 22.5 15.1875 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_v9re6 =
//     '<svg viewBox="163.3 738.0 40.5 36.0" ><path transform="translate(163.25, 738.0)" d="M 20.25 0 C 15.35695266723633 0 11.390625 3.966328144073486 11.390625 8.859375 C 11.390625 12.81515598297119 17.18085861206055 20.02499961853027 19.39921951293945 22.64203262329102 C 19.8485164642334 23.17218971252441 20.65218734741211 23.17218971252441 21.10078239440918 22.64203262329102 C 23.31914138793945 20.02499961853027 29.109375 12.81515598297119 29.109375 8.859375 C 29.109375 3.966328144073486 25.14304733276367 0 20.25 0 Z M 20.25 11.8125 C 18.61874961853027 11.8125 17.296875 10.49062538146973 17.296875 8.859375 C 17.296875 7.228124618530273 18.61874961853027 5.90625 20.25 5.90625 C 21.88125038146973 5.90625 23.203125 7.228125095367432 23.203125 8.859375 C 23.203125 10.49062538146973 21.88125038146973 11.8125 20.25 11.8125 Z M 1.414687514305115 15.18398475646973 C 0.5604392290115356 15.52565956115723 0.0002052783966064453 16.3529224395752 0 17.27296829223633 L 0 34.87359237670898 C 0 35.66952896118164 0.8036718964576721 36.21374893188477 1.542656302452087 35.91843795776367 L 11.25 31.5 L 11.25 15.11156272888184 C 10.62843704223633 13.98796844482422 10.12007808685303 12.89390659332275 9.755859375 11.84765625 L 1.414687514305115 15.18398475646973 Z M 20.25 25.28929710388184 C 19.26070404052734 25.28929710388184 18.32484436035156 24.85476493835449 17.68288993835449 24.09679794311523 C 16.30054664611816 22.46554756164551 14.83031177520752 20.60789108276367 13.5 18.70242309570312 L 13.5 31.49929809570312 L 27 35.99929809570312 L 27 18.703125 C 25.66968727111816 20.60789108276367 24.20015716552734 22.46624946594238 22.81711006164551 24.09749984741211 C 22.17515754699707 24.85476493835449 21.23929786682129 25.28929710388184 20.25 25.28929710388184 Z M 38.95734405517578 11.33156299591064 L 29.25 15.75 L 29.25 36 L 39.08531188964844 32.06601715087891 C 39.93968963623047 31.7244987487793 40.49999237060547 30.89713668823242 40.5 29.97703170776367 L 40.5 12.3764066696167 C 40.5 11.58046913146973 39.69632720947266 11.03625011444092 38.95734405517578 11.33156299591064 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
//
