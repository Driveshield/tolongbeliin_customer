import 'dart:async';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:tolongbeliin_costumer/Listpaymentgateway.dart';
import 'package:tolongbeliin_costumer/utils/API_Utils.dart';
import 'package:tolongbeliin_costumer/utils/Form.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:tolongbeliin_costumer/utils/primary_button.dart';

class MapsScreen extends StatefulWidget {
  //MapsScreen({super.key});
  MapsScreen({super.key, required this.storeForm});
  StoreForm storeForm;
  // String gambar;
  // String idjenis;

  @override
  State<MapsScreen> createState() => _MapsScreen();
}

class _MapsScreen extends State<MapsScreen> {
  double lat = -6.178306;
  double long = 106.631889;
  final TextEditingController alamatlengkapController = TextEditingController();
  final TextEditingController alamatketController = TextEditingController();

  UserAlamatForm useralamatForm = UserAlamatForm();

  ApiUtils api = ApiUtils();

  // late CameraPosition _currentPosition;

  @override
  void initState() {
    super.initState();

    _goToTheLake();

    // if(lat != null && long != null)
    // {
    //   _currentPosition = CameraPosition(
    //     target: LatLng(lat! , long!),
    //     zoom: 14.4746,
    //   );
    // }
  }

  @override
  void dispose() {
    //mapController!.dispose();
    super.dispose();
  }

  Future<Position> _getcurrentlocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location service are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied, we cannot request your location");
    }

    return Geolocator.getCurrentPosition();
  }

  Future<void> _getdetailalamat(LatLng position) async {
    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });

    api
                              .getDetailAlamatMaps(LatLng(position.latitude, position.longitude))
                              .then((List value) {

                                if(value.length > 0)
                                {
                                  setState(() {

                                    alamatlengkapController.text = value[0]['formatted_address'];

                                  });
                                }

                              });

    

    
  }

  Future<void> _goToTheLake() async {
    _getcurrentlocation().then((value) async {
      setState(() {
        lat = value.latitude;
        long = value.longitude;
      });

      // mapController!.animateCamera(

      // CameraUpdate.newCameraPosition(
      // CameraPosition(
      // bearing: 192.8334901395799,
      // target: LatLng(value.latitude, value.longitude),
      // tilt: 59.440717697143555,
      // zoom: 19.151926040649414)
      // ));

      mapController!.animateCamera(
          CameraUpdate.newLatLng(LatLng(value.latitude, value.longitude)));

      mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 19.151926040649414)));

      mapController!.animateCamera(CameraUpdate.newLatLngBounds(
          LatLngBounds(
              southwest: LatLng(value.latitude, value.longitude),
              northeast: LatLng(value.latitude, value.longitude)),
          0));
    });
  }

  GoogleMapController? mapController;

  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
            width: screen.width/1.2,
            child: SearchMapPlaceWidget(
              apiKey: 'AIzaSyCsfX0_N2oDsDoxkN7FXDixoeJIwV9AgGI',
              hasClearButton: true,
              bgColor: Colors.white,
              textColor: Colors.black,
              onSelected: (place) async {
                Geolocation? geolocation = await place.geolocation;
          
                mapController!.animateCamera(
                    CameraUpdate.newLatLng(geolocation!.coordinates));
          
                mapController!.animateCamera(
                    CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
              },
              placeType: PlaceType.address,
              placeholder: "Search Alamat",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: screen.height / 1.9,
              child: GoogleMap(
                mapType: MapType.normal,
                trafficEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                    bearing: 192.8334901395799,
                    target: LatLng(lat, long),
                    tilt: 59.440717697143555,
                    zoom: 19.151926040649414),
                //_kGooglePlex,
                onMapCreated: (GoogleMapController googleMapController) {
                  setState(() {
                    mapController = googleMapController;
                  });
                },
                onCameraMove: (position) {
                  // setState(() {
                  //   lat = position.target.latitude;
                  //   long = position.target.longitude;
                  // });
                  // setState(() {
                  //   lat = position.target.latitude;
                  //   long = position.target.longitude;
                  // });

                  // api
                  //     .getDetailAlamatMaps(
                  //         LatLng(position.target.latitude, position.target.longitude))
                  //     .then((List value) {
                  //   print(value);
                  // });
                  _getdetailalamat(LatLng(position.target.latitude, position.target.longitude));
                },
                onTap: (argument) {
                  // setState(() {
                  //   lat = argument.latitude;
                  //   long = argument.longitude;
                  // });
                  _getdetailalamat(
                      LatLng(argument.latitude, argument.longitude));
                },
                markers: {
                  Marker(
                    markerId: const MarkerId("marker1"),
                    position: LatLng(lat, long),
                    draggable: true,
                    onDragEnd: (value) {
                      // value is the new position
                      _getdetailalamat(
                      LatLng(value.latitude, value.longitude));
                      // setState(() {
                      //   lat = value.latitude;
                      //   long = value.longitude;
                      // });
                    },
                    // To do: custom marker icon
                  ),

                  // Marker(
                  //   markerId: const MarkerId("marker2"),
                  //   position: const LatLng(37.415768808487435, -122.08440050482749),
                  // ),
                },
                // onTap: (argument) {
                //   argument.latitude;
                // },
                // markers: ma,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TextFormField(
              // decoration: const InputDecoration(
              //   border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              // ),
              textAlignVertical: TextAlignVertical.bottom,
              textAlign: TextAlign.justify,
              autocorrect: true,
              minLines: 4,
              maxLines: 4,
              readOnly: true,
              style: TextStyle(backgroundColor: const Color(0xffffffff),overflow: TextOverflow.clip),
              controller: alamatlengkapController,
              onChanged: (value) {
                alamatlengkapController.text = value;
              },
              validator: (value) {
                return null;
              },
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffffffff),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                  hintText: 'Alamat Lengkap',
                  // hintText:'',
                  labelStyle: const TextStyle(color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextFormField(
              // decoration: const InputDecoration(
              //   border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              // ),
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.justify,
              autocorrect: true,
              minLines: 2,
              maxLines: 2,
              style: TextStyle(backgroundColor: const Color(0xffffffff),overflow: TextOverflow.clip),
              // controller: alamatlengkapController,
              onChanged: (value) {
                alamatketController.text = value;
                useralamatForm.alamatket = value;
              },
              validator: (value) {
                return null;
              },
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffffffff),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  hintText: 'Detail Alamat',
                  labelText: 'Detail Alamat',
                  // hintText:'',
                  labelStyle: const TextStyle(color: Colors.black)),
            ),
          )
        
        ]),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.transparent,
        onPressed: _goToTheLake,
        child: Image.asset('assets/map.png'),
        // label: const Text(''),
        // icon: const Icon(Icons.maps),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      bottomSheet: PrimaryButton(
                            text: "Pilih Lokasi",
                            width: screen.width,
                            height: 50,
                            fontSize: 24,
                            backgroundd: const Color(0xFF008037) ,
                            textcolor:  Colors.white,
                            onPressed: (){
                              api
                              .getDetailAlamatMaps(LatLng(lat, long))
                              .then((List value) {

                                if(value.length > 0)
                                {
                                  //useralamatForm
                                  setState(() {

                                    alamatlengkapController.text = value[0]['formatted_address'];
                                    useralamatForm.position = LatLng(lat, long);
                                    useralamatForm.alamatlengkap = value[0]['formatted_address'];

                                    for(var i=0; i < value[0]['address_components'].length; i++)
                                    {
                                      if(value[0]['address_components'][i]['types'][0] == "administrative_area_level_4")
                                      {
                                        useralamatForm.kelurahan = value[0]['address_components'][i]['long_name'];
                                      }else if(value[0]['address_components'][i]['types'][0] == "administrative_area_level_3")
                                      {
                                        useralamatForm.kecamatan = value[0]['address_components'][i]['long_name'];
                                      }else if(value[0]['address_components'][i]['types'][0] == "administrative_area_level_2")
                                      {
                                        useralamatForm.kota = value[0]['address_components'][i]['long_name'];
                                      }else if(value[0]['address_components'][i]['types'][0] == "administrative_area_level_1")
                                      {
                                        useralamatForm.provinsi = value[0]['address_components'][i]['long_name'];
                                      }else if(value[0]['address_components'][i]['types'][0] == "postal_code")
                                      {
                                        useralamatForm.kodepos = value[0]['address_components'][i]['long_name'];
                                      }
                                    }

                                    
                                    
                                    
                                    
                                    
                                    

                                  });
                                }
                          });
                                Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  
                                                              //ConfirmationOrder()
                                                              //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                                                              Listpaymentgateway(storeForm: widget.storeForm,useralamatForm: useralamatForm,)
                                                              //Cekoutpesanan()
                                                              ),
                                                            );
                            },
                            isPressed: true,
                          )
    );
  }
}
