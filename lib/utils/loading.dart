
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final spinkit = SpinKitPouringHourGlass(
  color: Colors.green,
  size: 50.0,
  //controller: AnimationController(vsync: this.spinkit, duration: const Duration(milliseconds: 1200)),
  );

final spinkitDoubleBounce = SpinKitDoubleBounce(
  color: Colors.green,
  size: 50.0,
  //controller: AnimationController(vsync: this.spinkit, duration: const Duration(milliseconds: 1200)),
  );