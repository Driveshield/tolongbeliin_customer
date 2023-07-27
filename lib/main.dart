import 'package:flutter/material.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:tolongbeliin_costumer/Carapesan1.dart';
import 'package:tolongbeliin_costumer/Carapesan2.dart';
import 'package:tolongbeliin_costumer/Cekoutpesanan.dart';
import 'package:tolongbeliin_costumer/Gettingstarted1.dart';
import 'package:tolongbeliin_costumer/Gettingstarted2.dart';
import 'package:tolongbeliin_costumer/HOMESCREEN.dart';
import 'package:tolongbeliin_costumer/Homemenumakanan1.dart';
import 'package:tolongbeliin_costumer/HomemenumakananBakso1.dart';
import 'package:tolongbeliin_costumer/Homemenumakananescampus5.dart';
import 'package:tolongbeliin_costumer/Homemenumakanangorengan1.dart';
import 'package:tolongbeliin_costumer/Listpaymentgateway.dart';
import 'package:tolongbeliin_costumer/Loginenduser.dart';
import 'package:tolongbeliin_costumer/Masukkeranjang.dart';
import 'package:tolongbeliin_costumer/ORDER.dart';
import 'package:tolongbeliin_costumer/Paymentverifikasi.dart';
import 'package:tolongbeliin_costumer/Procestunggu.dart';
import 'package:tolongbeliin_costumer/Signinenduser.dart';
import 'package:tolongbeliin_costumer/Startscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Startscreen()
    );
  }
}


