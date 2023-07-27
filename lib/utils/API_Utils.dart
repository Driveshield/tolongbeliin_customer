import 'dart:convert';
// import 'dart:html';
import 'dart:io';
// import 'dart:js';
// import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:homescreen/Confirmation_order.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:path_provider/path_provider.dart';


class ApiUtils {

  Future<List<dynamic>> getDetailAlamatMaps(LatLng position) async {
    // Map<String, dynamic> body = {};
    // body['fullname'] = fullname;
    Response response = await Dio().get(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng='+position.latitude.toString()+','+position.longitude.toString()+'&key=AIzaSyCsfX0_N2oDsDoxkN7FXDixoeJIwV9AgGI',
      // data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );
    //List<dynamic> product = response.data['data'];
    //print(response.data['results']);
    return response.data['results'];
  }

}