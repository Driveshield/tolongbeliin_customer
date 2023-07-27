import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:tolongbeliin_costumer/Carapesan1.dart';
import 'package:tolongbeliin_costumer/Listpaymentgateway.dart';
import 'package:tolongbeliin_costumer/Masukkeranjang.dart';
import 'package:tolongbeliin_costumer/Paymentverifikasi.dart';
import 'package:tolongbeliin_costumer/utils/Form.dart';
import 'package:http/http.dart' as http;

class Cekoutpesanan extends StatefulWidget {
  //Cekoutpesanan({super.key});
  Cekoutpesanan({super.key , required this.storeForm});
  StoreForm storeForm;
  // String gambar;
  // String idjenis;

  @override
  State<Cekoutpesanan> createState() => _Cekoutpesanan();
}


class _Cekoutpesanan extends State<Cekoutpesanan> {
// class Cekoutpesanan extends StatelessWidget {
//   Cekoutpesanan({
//     Key? key,
//   }) : super(key: key);
  String? harga;
  String? totalitem;
  var imgVariable;

  final _baseUrl = 'https://dev.tolongbeliin.com/api/transaction/listproduk';

  // At the beginning, we fetch the first 20 posts
  int _page = 0;
  // you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  final int _limit = 6;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List _posts = [];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      // final res =
      //     await http.get(Uri.parse("$_baseUrl?kategori_id=1&page=$_page&size=$_limit"));
      // setState(() {
      //   _posts = json.decode(res.body);
      // });
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var request = http.Request('GET', Uri.parse('$_baseUrl'));
      request.bodyFields = {
        'kategori_id': widget.storeForm.kategoriId.toString(),
        'page': '$_page',
        'size': '$_limit',
        'title': '',
        'id_header': widget.storeForm.storeId.toString(),
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        //print(await response.stream.bytesToString());

        var res = await response.stream.bytesToString();

        final fetchedPosts = json.decode(res);

        //print(json.decode(res));

        // _posts.addAll(fetchedPosts);
        //print(fetchedPosts['data']);

        if(fetchedPosts['status'].toString() == 'true') {

            //print(json.decode(fetchedPosts['data']));

            setState(() {
            _posts = fetchedPosts['data'];
            });

        }

        

        //print(json.decode(res));
      }
      else {
        //print(response.reasonPhrase);
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong 2');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        // final res =
        //     await http.get(Uri.parse("$_baseUrl?kategori_id=1&page=$_page&size=$_limit"));
        var headers = {
          'Content-Type': 'application/x-www-form-urlencoded'
        };
        var request = http.Request('GET', Uri.parse('$_baseUrl'));
        request.bodyFields = {
          'kategori_id': widget.storeForm.kategoriId.toString(),
          'page': '$_page',
          'size': '$_limit',
          'title': '',
          'id_header': widget.storeForm.storeId.toString(),
        };
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          //print(await response.stream.bytesToString());

          var res = await response.stream.bytesToString();

          //final List fetchedPosts = json.decode(res);

          //print(json.decode(res));

          // _posts.addAll(fetchedPosts);
          final fetchedPosts2 = json.decode(res);

          //print(json.decode(res));

          // _posts.addAll(fetchedPosts);

          if(fetchedPosts2['status'].toString() == 'true') {


              final List fetchedPosts = fetchedPosts2['data'];
              if (fetchedPosts.isNotEmpty) {
                setState(() {
                  _posts.addAll(fetchedPosts);
                });
              } else {
                // This means there is no more data
                // and therefore, we will not send another GET request
                setState(() {
                  _hasNextPage = false;
                });
              }

          }

          // final List fetchedPosts = json.decode(res);
          //   if (fetchedPosts.isNotEmpty) {
          //   setState(() {
          //     _posts.addAll(fetchedPosts);
          //   });
          //   } else {
          //     // This means there is no more data
          //     // and therefore, we will not send another GET request
          //     setState(() {
          //       _hasNextPage = false;
          //     });
          //   }

          //print(json.decode(res));
        }
        else {
           setState(() {
            _hasNextPage = false;
            });
        }

        
        
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  late ScrollController _controller;

  Future<http.Response> cekbasket(String onesignalID) {
  
    return http.post(
      Uri.parse('https://dev.tolongbeliin.com/api/transaction/listbasketheader'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idonesignal': onesignalID,
      }),
    );
  }

  getbasketitem() async {
      
      OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

      OneSignal.shared.setAppId("c768598b-2ee5-442d-8ec5-619e8033498c");

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      print(osUserID);

      http.Response response = await cekbasket(osUserID!);
      print(response.statusCode);
      final data = json.decode(response.body);
      if(data['status'].toString() == 'false') {
        
      }else if(response.statusCode != 200) {

      } else {


        setState(() {
            harga = data['data'][0]['totalhargapesanan'].toString();
            totalitem = data['data'][0]['jmlpesanan'].toString();
        });

        

      }

      //prosesLogin(context);

      //print(osUserID);
  }

  @override
  void initState() {
    super.initState();
    
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);

    getbasketitem();
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    imgVariable = NetworkImage(widget.storeForm.photoSrc.toString());
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xfff7f7fa),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          Pinned.fromPins(
            Pin(start: -42.0, end: -28.0),
            Pin(size: 309.0, start: -150.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff008037),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(260.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 106.0, start: 35.0),
            Pin(size: 19.0, start: 104.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff6dc720),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 7),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
                    ),
                    Pinned.fromPins(
                      Pin(size: 58.0, start: 10.0),
                      Pin(size: 10.0, middle: 0.5556),
                      child: Text(
                        'Super partner',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 9,
                          color: const Color(0xcc000000),
                        ),
                        softWrap: false,
                      ),
                    ),
                    Align(
                      alignment: Alignment(1.0, 0.111),
                      child: SizedBox(
                        width: 26.0,
                        height: 10.0,
                        child: Text(
                          'Snack',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 9,
                            color: const Color(0xcc000000),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 248.0, start: 38.0),
            Pin(size: 29.0, start: 73.0),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: Text(
                  widget.storeForm.name.toString(),
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 25,
                    color: const Color(0xcc000000),
                    shadows: [
                      Shadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 5),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  softWrap: false,
                )),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 91.0, start: 17.0),
            Pin(size: 70.0, middle: 0.6051),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 7),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, start: 6.9),
                  Pin(size: 32.1, middle: 0.4473),
                  child: SvgPicture.string(
                    _svg_l4z5wn,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment(1.0, -0.073),
                  child: SizedBox(
                    width: 49.0,
                    height: 29.0,
                    child: Text(
                      '5.0  ',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 25,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.007, 0.21),
            child: SizedBox(
              width: 87.0,
              height: 70.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 7),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 47.0, end: 3.0),
                    Pin(size: 19.0, middle: 0.549),
                    child: Text(
                      '1.0 km',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 53.0, end: 13.0),
                    Pin(size: 15.0, end: 4.0),
                    child: Text(
                      'Distance',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 13,
                        color: const Color(0xcc000000),
                        shadows: [
                          Shadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 5),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 87.0, end: 15.0),
            Pin(size: 70.0, middle: 0.6051),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 7),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(1.0, 0.36),
                  child: SizedBox(
                    width: 70.0,
                    height: 20.0,
                    child: Text(
                      '12k-25k  ',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 17,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-0.119, 0.192),
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ovo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 34.0, end: 44.0),
            Pin(size: 34.0, middle: 0.5835),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ovo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Pinned.fromPins(
          //   Pin(size: 99.0, start: 17.0),
          //   Pin(size: 99.0, middle: 0.77),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/ovo.png'),
          //         fit: BoxFit.cover,
          //       ),
          //       borderRadius: BorderRadius.circular(12.0),
          //     ),
          //   ),
          // ),
          // Align(
          //   alignment: Alignment(0.0, 0.54),
          //   child: Container(
          //     width: 99.0,
          //     height: 99.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/ovo.png'),
          //         fit: BoxFit.cover,
          //       ),
          //       borderRadius: BorderRadius.circular(12.0),
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 99.0, end: 16.0),
          //   Pin(size: 99.0, middle: 0.77),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/ovo.png'),
          //         fit: BoxFit.cover,
          //       ),
          //       borderRadius: BorderRadius.circular(12.0),
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 85.0, start: 24.0),
          //   Pin(size: 30.0, middle: 0.8095),
          //   child: Stack(
          //     children: <Widget>[
          //       Container(
          //         decoration: BoxDecoration(
          //           color: const Color(0xffffffff),
          //           borderRadius: BorderRadius.circular(16.0),
          //           boxShadow: [
          //             BoxShadow(
          //               color: const Color(0x29000000),
          //               offset: Offset(0, 7),
          //               blurRadius: 6,
          //             ),
          //           ],
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment(0.212, -1.0),
          //         child: SizedBox(
          //           width: 52.0,
          //           height: 12.0,
          //           child: Text(
          //             'Es campur ',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 10,
          //               color: const Color(0xcc000000),
          //             ),
          //             softWrap: false,
          //           ),
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(size: 49.0, middle: 0.5833),
          //         Pin(size: 12.0, end: 3.0),
          //         child: Text(
          //           'Rp. 12.000',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 10,
          //             color: const Color(0xcc000000),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Align(
          //   alignment: Alignment(0.007, 0.619),
          //   child: SizedBox(
          //     width: 85.0,
          //     height: 30.0,
          //     child: Stack(
          //       children: <Widget>[
          //         Container(
          //           decoration: BoxDecoration(
          //             color: const Color(0xffffffff),
          //             borderRadius: BorderRadius.circular(16.0),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: const Color(0x29000000),
          //                 offset: Offset(0, 7),
          //                 blurRadius: 6,
          //               ),
          //             ],
          //           ),
          //         ),
          //         Pinned.fromPins(
          //           Pin(start: 7.0, end: 4.0),
          //           Pin(size: 12.0, start: 2.0),
          //           child: Text(
          //             'Es buah nangka',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 10,
          //               color: const Color(0xcc000000),
          //             ),
          //             softWrap: false,
          //           ),
          //         ),
          //         Pinned.fromPins(
          //           Pin(size: 49.0, middle: 0.5833),
          //           Pin(size: 12.0, end: 3.0),
          //           child: Text(
          //             'Rp. 14.000',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 10,
          //               color: const Color(0xcc000000),
          //             ),
          //             softWrap: false,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 85.0, end: 22.0),
          //   Pin(size: 30.0, middle: 0.8095),
          //   child: Stack(
          //     children: <Widget>[
          //       Container(
          //         decoration: BoxDecoration(
          //           color: const Color(0xffffffff),
          //           borderRadius: BorderRadius.circular(16.0),
          //           boxShadow: [
          //             BoxShadow(
          //               color: const Color(0x29000000),
          //               offset: Offset(0, 7),
          //               blurRadius: 6,
          //             ),
          //           ],
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(size: 37.0, middle: 0.5625),
          //         Pin(size: 12.0, start: 3.0),
          //         child: Text(
          //           'Es teller',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 10,
          //             color: const Color(0xcc000000),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(size: 49.0, middle: 0.5833),
          //         Pin(size: 12.0, end: 3.0),
          //         child: Text(
          //           'Rp. 15.000',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 10,
          //             color: const Color(0xcc000000),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          _isFirstLoadRunning
          ? const Center(
              child: const CircularProgressIndicator(),
            )
          :
          (_isLoadMoreRunning == true) ?
          Align(
                      alignment: Alignment(-0.007, 0.554),
                      child: Container(
                        width: 99.0,
                        height: 99.0,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     image: const AssetImage('assets/ovo.png'),
                        //     fit: BoxFit.cover,
                        //   ),
                        //   borderRadius: BorderRadius.circular(12.0),
                        // ),
                        child: Center(
                              child: CircularProgressIndicator(),
                        ),
                      ),
                    )
          //  Padding(
          //             padding: EdgeInsets.only(top: 10, bottom: 40),
          //             child: Center(
          //               child: CircularProgressIndicator(),
          //             ),
          //           )
                    :
          Container(
            margin: EdgeInsets.only(top: 550),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: 
                [ 

                  Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        controller: _controller,
                        itemCount: _posts.length,
                        itemBuilder: (_, index) => 
                        GestureDetector(
                          onTap: () {
                            //print(_posts[index]['produk_foto'].toString());
                            ProductForm produkForm2 = ProductForm();

                                                            setState(() => {

                                                            produkForm2.produk_id = _posts[index]['produk_id'],
                                                            produkForm2.produk_nama = _posts[index]['produk_nama'],
                                                            produkForm2.produk_harga = _posts[index]['produk_harga'],
                                                            produkForm2.produk_stok = _posts[index]['produk_stok'],
                                                            produkForm2.produk_foto = _posts[index]['produk_foto'],

                                                            });
                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  
                                                              //ConfirmationOrder()
                                                              //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                                                              Carapesan1(storeForm: widget.storeForm,produkForm: produkForm2)
                                                              ),
                                                            );

                          },
                          child: Card(
                              margin: EdgeInsets.only(left: 25,bottom: 130),
                              color: const Color(0xfff7f7fa),
                              shadowColor: const Color(0xfff7f7fa),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child:
                              // ListTile(
                              //   title: Text(_posts[index]['produk_nama']),
                              //   subtitle: Text(_posts[index]['produk_harga']),
                              // ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                        
                                children: [
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //       image: const AssetImage('assets/ovo.png'),
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  //     borderRadius: BorderRadius.circular(12.0),
                                  //   ),
                                  // ),
                                  Image.network(
                                                            _posts[index]['produk_foto'].toString(),
                                                            width: 100,
                                                            height: 100,
                                                            fit: BoxFit.fitWidth,
                                                            errorBuilder: (ctx, o, n) {
                                                            //print(o);
                                                            return Image.asset(
                                                              'assets/tolong beliin.png',
                                                              width: 100,
                                                              fit: BoxFit.fitWidth,
                                                            );
                                                          },
                                                          ),
                                  // Image.asset('assets/ovo.png',fit: BoxFit.cover,height: 100,width: 100,),
                                  SizedBox(height: 0,),
                                  Center(
                                    child: Container(
                                      width: 85,
                                      height: 35,
                                      margin: EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(16.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x29000000),
                                            offset: Offset(0, 7),
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(' '+_posts[index]['produk_nama']+' \nRp. '+_posts[index]['produk_harga']+'',
                                                          style: TextStyle(
                                                fontFamily: 'Rubik',
                                                fontSize: 10,
                                                color: const Color(0xcc000000),),overflow: TextOverflow.clip
                                            ),
                                      )
                                    ),
                                  ),
                                  
                                ],
                              )
                              
                        
                              ),
                        ),
                      ),
                    ),

                  // when the _loadMore function is running
                  
                    // Align(
                    //   alignment: Alignment(-0.007, 0.554),
                    //   child: Container(
                    //     width: 99.0,
                    //     height: 99.0,
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: const AssetImage('assets/ovo.png'),
                    //         fit: BoxFit.cover,
                    //       ),
                    //       borderRadius: BorderRadius.circular(12.0),
                    //     ),
                    //     child: Center(
                    //           child: CircularProgressIndicator(),
                    //     ),
                    //   ),
                    // ),

                  // When nothing else to load
                  // if (_hasNextPage == false)
                  //   Container(
                  //     padding: const EdgeInsets.only(top: 15, bottom: 10),
                  //     color: Colors.transparent,
                  //     child: const Center(
                  //       child: Text('You have fetched all of the content'),
                  //     ),
                  //   ),
                ]
            ),
          ),
          Pinned.fromPins(
            Pin(start: 40.0, end: 39.0),
            Pin(size: 296.0, middle: 0.2597),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imgVariable,
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                      setState(){
                        imgVariable = AssetImage('assets/tolong beliin.png');
                      };
                  },
                  // (){
                  //   setState(){
                  //       imgVariable = AssetImage('assets/could_not_load_img.jpg');
                  //   };
                  // },
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 12.0, end: 9.0),
            Pin(size: 75.0, end: 10.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 7),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 23.0, start: 56.0),
            Pin(size: 12.0, end: 109.0),
            child: Text(
              'Back',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 10,
                color: const Color(0xcc3e88ff),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 29.3, start: 15.8),
            Pin(size: 29.3, end: 102.8),
            child: SvgPicture.string(
              _svg_vj6cij,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 30.0, end: 34.0),
            Pin(size: 47.0, end: 22.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  
                                                              //ConfirmationOrder()
                                                              //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                                                              Listpaymentgateway(storeForm: widget.storeForm,)
                                                              ),
                                                            );

              },
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff008900),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 7),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 121.0, start: 7.0),
                    Pin(size: 23.0, middle: 0.5),
                    child: Text(
                      'Basket '+totalitem.toString()+' Item',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 19,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 96.0, end: 9.0),
                    Pin(size: 23.0, middle: 0.5),
                    child: Text(
                      'Rp. '+harga.toString()+'',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 19,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_l4z5wn =
    '<svg viewBox="51.9 308.0 31.0 32.1" ><path transform="translate(48.94, 304.96)" d="M 18.48324966430664 3 C 9.927939414978027 3 3 10.18462562561035 3 19.037109375 C 3 27.88959503173828 9.927939414978027 35.07421875 18.48324966430664 35.07421875 C 27.05405807495117 35.07421875 33.99749755859375 27.88959503173828 33.99749755859375 19.037109375 C 33.99749755859375 10.18462562561035 27.05405807495117 3 18.48324966430664 3 Z M 25.05471992492676 28.65937423706055 L 18.49874877929688 24.56991195678711 L 11.94277667999268 28.65937423706055 L 13.67863655090332 20.94552612304688 L 7.897603988647461 15.76554203033447 L 15.52298927307129 15.09198379516602 L 18.49874877929688 7.811131954193115 L 21.47450828552246 15.0759449005127 L 29.09989356994629 15.74950218200684 L 23.31886291503906 20.92948913574219 L 25.05471801757812 28.65937423706055 Z" fill="#58cc1a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vj6cij =
    '<svg viewBox="15.8 680.0 29.3 29.3" ><path transform="translate(12.38, 676.63)" d="M 18 3.375 C 9.921093940734863 3.375 3.375 9.921093940734863 3.375 18 C 3.375 26.07890701293945 9.921093940734863 32.625 18 32.625 C 26.07890701293945 32.625 32.625 26.07890701293945 32.625 18 C 32.625 9.921092987060547 26.07890701293945 3.375 18 3.375 Z M 21.05156326293945 23.70234298706055 C 21.57890701293945 24.22968673706055 21.57890701293945 25.09453010559082 21.05156326293945 25.62187385559082 C 20.78437614440918 25.88906097412109 20.43984413146973 26.01562309265137 20.09531402587891 26.01562309265137 C 19.75078201293945 26.01562309265137 19.39921951293945 25.88202857971191 19.13203239440918 25.61484146118164 L 12.52265739440918 18.98437309265137 C 12.03750133514404 18.44999885559082 12.05156326293945 17.62734222412109 12.56484508514404 17.11406135559082 L 19.27265739440918 10.38515472412109 C 19.80000114440918 9.857810974121094 20.65781402587891 9.85077953338623 21.19218826293945 10.38515472412109 C 21.71953201293945 10.91249847412109 21.7265625 11.77031135559082 21.19218826293945 12.30468559265137 L 15.43359375 18 L 21.05156326293945 23.70234298706055 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
