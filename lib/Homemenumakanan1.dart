import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:tolongbeliin_costumer/Cekoutpesanan.dart';
import 'package:tolongbeliin_costumer/HomemenumakananBakso1.dart';
import 'package:tolongbeliin_costumer/Homemenumakananescampus5.dart';
import 'package:tolongbeliin_costumer/Homemenumakanangorengan1.dart';
import 'package:tolongbeliin_costumer/Listpaymentgateway.dart';
import 'package:tolongbeliin_costumer/utils/Form.dart';

class Homemenumakanan1 extends StatefulWidget {
  //Homemenumakanan1({super.key});
  Homemenumakanan1({super.key, required this.jenis, required this.gambar, required this.idjenis, this.ispesan});
  String jenis;
  String gambar;
  String idjenis;
  bool? ispesan;

  @override
  State<Homemenumakanan1> createState() => _Homemenumakanan1();
}

class _Homemenumakanan1 extends State<Homemenumakanan1> {
// class Homemenumakanan1 extends StatelessWidget {
//   Homemenumakanan1({
//     Key? key,
//   }) : super(key: key);
final _baseUrl = 'https://dev.tolongbeliin.com/api/transaction/listprodukheader';

  // At the beginning, we fetch the first 20 posts
  int _page = 0;
  // you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  final int _limit = 10;

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
        'kategori_id': widget.idjenis,
        'page': '$_page',
        'size': '$_limit',
        'title': ''
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
        print(response.reasonPhrase);
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
          'kategori_id': widget.idjenis,
          'page': '$_page',
          'size': '$_limit',
          'title': ''
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

  Future <void> ceksudahpesan (context,String idmerhant, StoreForm storeformm)  async {

      OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

      OneSignal.shared.setAppId("c768598b-2ee5-442d-8ec5-619e8033498c");

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      //prosesLogin(context);

      print(osUserID);

      http.Response response = await apiceksudahpesan(osUserID!,idmerhant);

      final data = json.decode(response.body);
      if(data['status'].toString() == 'false') {

        Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  
                                                              //ConfirmationOrder()
                                                              //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                                                                HomemenumakananBakso1(storeform: storeformm,ispesan: widget.ispesan,)
                                                              //Cekoutpesanan()
                                                              ),
                                                            );

      }else if(response.statusCode != 200) {

        Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  
                                                              //ConfirmationOrder()
                                                              //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                                                                HomemenumakananBakso1(storeform: storeformm,ispesan: widget.ispesan,)
                                                              //Cekoutpesanan()
                                                              ),
                                                            );

      }else {

        if(data['data'].length > 0)
        {
           Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  //ConfirmationOrder()
                  //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                    Cekoutpesanan(storeForm: storeformm,)
              ),
        );

        }else{
          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  
                                                              //ConfirmationOrder()
                                                              //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                                                                HomemenumakananBakso1(storeform: storeformm,ispesan: widget.ispesan,)
                                                              //Cekoutpesanan()
                                                              ),
                                                            );
        }

      }

      

  }

  Future<http.Response> apiceksudahpesan(String onesignalID, String idmerchant) {
    return http.post(
      Uri.parse('https://dev.tolongbeliin.com/api/customer/cekadabasket'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idonesignal': onesignalID,
        'idmerchant': idmerchant,
      }),
    );
  }


  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Pin(size: 3.0, end: 14.0),
            Pin(size: 19.0, start: 78.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 3.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x808f9bbc),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 3.0, middle: 0.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x808f9bbc),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 3.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x808f9bbc),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
              ],
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
            Pin(start: 27.0, end: 33.0),
            Pin(size: 40.0, start: 50.0),
            child: Container(
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
          ),
          Pinned.fromPins(
            Pin(size: 63.0, middle: 0.2596),
            Pin(size: 17.0, start: 61.0),
            child: Text(
              'Cari disini',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: const Color(0xcc7a7f89),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 92.0, end: 92.0),
            Pin(size: 83.0, start: 106.0),
            child: Container(
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
          ),
          Pinned.fromPins(
            Pin(size: 17.0, start: 38.0),
            Pin(size: 17.0, start: 61.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ovo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 26.0, middle: 0.7163),
            Pin(size: 26.0, start: 135.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        border: Border.all(
                            width: 3.0, color: const Color(0xff008037)),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff008037),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff008037)),
                  ),
                  margin: EdgeInsets.all(5.0),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 15.0, middle: 0.8083),
            Pin(size: 15.0, start: 63.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ovo.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 17.0, end: 44.0),
            Pin(size: 17.0, start: 62.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ovo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          
          _isFirstLoadRunning
          ? const Center(
              child: const CircularProgressIndicator(),
            )
          :
          Container(
            margin: EdgeInsets.only(top: 200),
            child: Column(
          
              children: 
                [ 
                  Expanded(
                      child: ListView.builder(
                        controller: _controller,
                        itemCount: _posts.length,
                        itemBuilder: (_, index) => 
                        Card(
                            color: const Color(0xfff7f7fa),
                            shadowColor: const Color(0xfff7f7fa),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.network(
                                                          _posts[index]['foto'].toString(),
                                                          width: 100,
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
                                  title: Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Row(
                                            children: 
                                            [
                                              Text(
                                                    _posts[index]['nama_toko'].toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'Rubik',
                                                      fontSize: 17,
                                                      color: const Color(0xcc000000),
                                                    ),
                                                    softWrap: false,
                                                  ),
                                                  SizedBox(width: 5,),
                                                  SvgPicture.string(
                                                      _svg_ld72dn,
                                                      allowDrawingOutsideViewBox: true,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    SizedBox(width: 3,),
                                                    Text(
                                                    '4.5  ',
                                                    style: TextStyle(
                                                      fontFamily: 'Rubik',
                                                      fontSize: 10,
                                                      color: const Color(0xcc000000),
                                                    ),
                                                    )
                                            ]
                                          ),
                                          ),
                                  subtitle: Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                              width: 13.0,
                                                              height: 13.0,
                                                              decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                  image: const AssetImage('assets/ovo.png'),
                                                                  fit: BoxFit.fill,
                                                                ),
                                                              ),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Text(
                                                        '500m, Pick up',
                                                        style: TextStyle(
                                                          fontFamily: 'Rubik',
                                                          fontSize: 9,
                                                          color: const Color(0xcc000000),
                                                        ),
                                                        softWrap: false,
                                                      ),
                                                      
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                      // Text(
                                                      //   'Rp. '+_posts[index]['produk_harga'].toString()+'',
                                                      //   style: TextStyle(
                                                      //     fontFamily: 'Rubik',
                                                      //     fontSize: 12,
                                                      //     color: const Color(0xcc000000),
                                                      //   ),
                                                      //   softWrap: false,
                                                      // ),
                                                SizedBox(height: 10,),
                                                SvgPicture.string(
                                                  width: 200,
                                                  _svg_fvqsfk,
                                                  allowDrawingOutsideViewBox: true,
                                                  fit: BoxFit.contain,
                                                ),
                                                SizedBox(height: 10,),
                                                SizedBox(
                                                    width: 60.0,
                                                    height: 19.0,
                                                    child: Stack(
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
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                           // print(_posts[index]['prod_id']);
                                                            StoreForm storeForm2 = StoreForm();

                                                            setState(() => {

                                                            storeForm2.storeId = _posts[index]['prod_id'],
                                                            storeForm2.address = _posts[index]['alamat_toko'],
                                                            storeForm2.name = _posts[index]['nama_toko'],
                                                            storeForm2.coordinate = _posts[index]['coordinate'],
                                                            storeForm2.photoSrc = _posts[index]['foto'],
                                                            storeForm2.userId = _posts[index]['fk_user_id'],
                                                            storeForm2.kategoriId = _posts[index]['kategori_id'],

                                                            });

                                                            ceksudahpesan(context,_posts[index]['prod_id'].toString(),storeForm2);

                                                            //print(storeForm2.storeId);

                                                            
                                                          },
                                                          child: Align(
                                                            alignment: Alignment(-0.048, 0.111),
                                                            child: SizedBox(
                                                              width: 39.0,
                                                              height: 10.0,
                                                              child: Text(
                                                                'See more',
                                                                style: TextStyle(
                                                                  fontFamily: 'Rubik',
                                                                  fontSize: 9,
                                                                  color: const Color(0xcc000000),
                                                                ),
                                                                softWrap: false,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ]
                                            ),
                                  ),
                                ),
                                
                                ButtonBar(
                                  alignment: MainAxisAlignment.start,
                                  children: [
                                    // FlatButton(
                                    //   textColor: const Color(0xFF6200EE),
                                    //   onPressed: () {
                                    //     // Perform some action
                                    //   },
                                    //   child: const Text('ACTION 1'),
                                    // ),
                                    // FlatButton(
                                    //   textColor: const Color(0xFF6200EE),
                                    //   onPressed: () {
                                    //     // Perform some action
                                    //   },
                                    //   child: const Text('ACTION 2'),
                                    // ),
                                  ],
                                ),
                                // Image.asset('assets/card-sample-image.jpg'),
                                // Image.asset('assets/card-sample-image-2.jpg'),
                              ],
                            ),
                          ),
                      ),
                    ),

                  // when the _loadMore function is running
                  if (_isLoadMoreRunning == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),

                  // When nothing else to load
                  if (_hasNextPage == false)
                    Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      color: Colors.transparent,
                      child: const Center(
                        child: Text('You have fetched all of the content'),
                      ),
                    ),
                ]
            ),
          ),


          // SingleChildScrollView(


          // ),
          // Pinned.fromPins(
          //   Pin(size: 331.0, end: 50.0),
          //   Pin(size: 72.0, middle: 0.3189),
          //   child: Stack(
          //     children: <Widget>[

          //       Pinned.fromPins(
          //         Pin(size: 76.0, start: 0.0),
          //         Pin(size: 77.0, middle: 0.3048),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //               image: const AssetImage('assets/ovo.png'),
          //               fit: BoxFit.cover,
          //             ),
          //             borderRadius: BorderRadius.circular(12.0),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: const Color(0x29000000),
          //                 offset: Offset(0, 6),
          //                 blurRadius: 6,
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
                // Pinned.fromPins(
                //   Pin(size: 49.0, start: 12.0),
                //   Pin(size: 19.0, middle: 1.297),
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
                //         Pin(size: 15.4, start: 3.0),
                //         Pin(start: 2.0, end: 2.0),
                //         child: SvgPicture.string(
                //           _svg_ld72dn,
                //           allowDrawingOutsideViewBox: true,
                //           fit: BoxFit.fill,
                //         ),
                //       ),
                //       Pinned.fromPins(
                //         Pin(size: 19.0, end: 7.0),
                //         Pin(size: 12.0, middle: 0.5714),
                //         child: Text(
                //           '4.5  ',
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
                

          //       Pinned.fromPins(
          //         Pin(start: 120.0, end: 0.0),
          //         Pin(size: 20.0, start: 0.0),
          //         child: Text(
          //           'Gorengan Bang Haji Saeful',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 17,
          //             color: const Color(0xcc000000),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(start: 150.0, end: 0.0),
          //         Pin(size: 20.0, start: 25.0),
          //         child: Text(
          //           '500m, Pick up',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 9,
          //             color: const Color(0xcc000000),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
                
          //       Pinned.fromPins(
          //         Pin(start: 120.0, end: 1.0),
          //         Pin(size: 1.0, middle: 0.6056),
          //         child: SvgPicture.string(
          //           width: 100,
          //           _svg_fvqsfk,
          //           allowDrawingOutsideViewBox: true,
          //           fit: BoxFit.contain,
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment(-0.198, -0.186),
          //         child: Container(
          //           width: 13.0,
          //           height: 13.0,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //               image: const AssetImage('assets/ovo.png'),
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment(-0.113, 1.0),
          //         child: SizedBox(
          //           width: 60.0,
          //           height: 19.0,
          //           child: Stack(
          //             children: <Widget>[
          //               Container(
          //                 decoration: BoxDecoration(
          //                   color: const Color(0xff6dc720),
          //                   borderRadius: BorderRadius.circular(16.0),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: const Color(0x29000000),
          //                       offset: Offset(0, 7),
          //                       blurRadius: 6,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Align(
          //                 alignment: Alignment(-0.048, 0.111),
          //                 child: SizedBox(
          //                   width: 39.0,
          //                   height: 10.0,
          //                   child: Text(
          //                     'See more',
          //                     style: TextStyle(
          //                       fontFamily: 'Rubik',
          //                       fontSize: 9,
          //                       color: const Color(0xcc000000),
          //                     ),
          //                     softWrap: false,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          
          
          
          // Pinned.fromPins(
          //   Pin(size: 209.0, end: 52.0),
          //   Pin(size: 72.0, middle: 0.4932),
          //   child: Stack(
          //     children: <Widget>[
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: SizedBox(
          //           width: 145.0,
          //           height: 20.0,
          //           child: Text(
          //             'Bakso Bang Kumis',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 17,
          //               color: const Color(0xcc000000),
          //             ),
          //             softWrap: false,
          //           ),
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(size: 54.0, start: 16.0),
          //         Pin(size: 10.0, middle: 0.4355),
          //         child: Text(
          //           '1 Km, Pick up',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 9,
          //             color: const Color(0xcc000000),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(start: 0.0, end: 0.0),
          //         Pin(size: 1.0, middle: 0.6056),
          //         child: SvgPicture.string(
          //           _svg_fvqsfk,
          //           allowDrawingOutsideViewBox: true,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment(-1.0, -0.186),
          //         child: Container(
          //           width: 13.0,
          //           height: 13.0,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //               image: const AssetImage('assets/ovo.png'),
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment(-0.101, 1.0),
          //         child: SizedBox(
          //           width: 60.0,
          //           height: 19.0,
          //           child: Stack(
          //             children: <Widget>[
          //               Container(
          //                 decoration: BoxDecoration(
          //                   color: const Color(0xff6dc720),
          //                   borderRadius: BorderRadius.circular(16.0),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: const Color(0x29000000),
          //                       offset: Offset(0, 7),
          //                       blurRadius: 6,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Align(
          //                 alignment: Alignment(-0.048, 0.111),
          //                 child: SizedBox(
          //                   width: 39.0,
          //                   height: 10.0,
          //                   child: Text(
          //                     'See more',
          //                     style: TextStyle(
          //                       fontFamily: 'Rubik',
          //                       fontSize: 9,
          //                       color: const Color(0xcc000000),
          //                     ),
          //                     softWrap: false,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 209.0, end: 52.0),
          //   Pin(size: 72.0, middle: 0.6676),
          //   child: Stack(
          //     children: <Widget>[
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: SizedBox(
          //           width: 168.0,
          //           height: 20.0,
          //           child: Text(
          //             'Es Campur Bang sam',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 17,
          //               color: const Color(0xcc000000),
          //             ),
          //             softWrap: false,
          //           ),
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(size: 60.0, start: 16.0),
          //         Pin(size: 10.0, middle: 0.4355),
          //         child: Text(
          //           '500m, Pick up',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 9,
          //             color: const Color(0xcc000000),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(start: 0.0, end: 0.0),
          //         Pin(size: 1.0, middle: 0.6056),
          //         child: SvgPicture.string(
          //           _svg_fvqsfk,
          //           allowDrawingOutsideViewBox: true,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment(-1.0, -0.186),
          //         child: Container(
          //           width: 13.0,
          //           height: 13.0,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //               image: const AssetImage('assets/ovo.png'),
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment(-0.101, 1.0),
          //         child: SizedBox(
          //           width: 60.0,
          //           height: 19.0,
          //           child: Stack(
          //             children: <Widget>[
          //               Container(
          //                 decoration: BoxDecoration(
          //                   color: const Color(0xff6dc720),
          //                   borderRadius: BorderRadius.circular(16.0),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: const Color(0x29000000),
          //                       offset: Offset(0, 7),
          //                       blurRadius: 6,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Align(
          //                 alignment: Alignment(-0.048, 0.111),
          //                 child: SizedBox(
          //                   width: 39.0,
          //                   height: 10.0,
          //                   child: Text(
          //                     'See more',
          //                     style: TextStyle(
          //                       fontFamily: 'Rubik',
          //                       fontSize: 9,
          //                       color: const Color(0xcc000000),
          //                     ),
          //                     softWrap: false,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 77.0, start: 31.0),
          //   Pin(size: 77.0, middle: 0.4898),
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
          //   Pin(size: 77.0, start: 31.0),
          //   Pin(size: 77.0, middle: 0.6626),
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
          //   Pin(size: 49.0, start: 45.0),
          //   Pin(size: 19.0, middle: 0.5372),
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
          //         Pin(size: 15.4, start: 3.0),
          //         Pin(start: 2.0, end: 2.0),
          //         child: SvgPicture.string(
          //           _svg_ut1wl0,
          //           allowDrawingOutsideViewBox: true,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(size: 19.0, end: 7.0),
          //         Pin(size: 12.0, middle: 0.5714),
          //         child: Text(
          //           '5.0  ',
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
          // Pinned.fromPins(
          //   Pin(size: 49.0, start: 45.0),
          //   Pin(size: 19.0, middle: 0.6999),
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
          //         Pin(size: 15.4, start: 3.0),
          //         Pin(start: 2.0, end: 2.0),
          //         child: SvgPicture.string(
          //           _svg_ut1wl0,
          //           allowDrawingOutsideViewBox: true,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(size: 19.0, end: 7.0),
          //         Pin(size: 12.0, middle: 0.5714),
          //         child: Text(
          //           '5.0  ',
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
          // Pinned.fromPins(
          //   Pin(size: 77.0, start: 31.0),
          //   Pin(size: 77.0, end: 111.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/ovo.png'),
          //         fit: BoxFit.cover,
          //         colorFilter: new ColorFilter.mode(
          //             Colors.black.withOpacity(1.0), BlendMode.dstIn),
          //       ),
          //       borderRadius: BorderRadius.circular(12.0),
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 49.0, start: 45.0),
          //   Pin(size: 19.0, end: 101.0),
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
          //         Pin(size: 15.4, start: 3.0),
          //         Pin(start: 2.0, end: 2.0),
          //         child: SvgPicture.string(
          //           _svg_ut1wl0,
          //           allowDrawingOutsideViewBox: true,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(size: 19.0, end: 7.0),
          //         Pin(size: 12.0, middle: 0.5714),
          //         child: Text(
          //           '5.0  ',
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
          // Pinned.fromPins(
          //   Pin(size: 211.0, end: 50.0),
          //   Pin(size: 72.0, end: 117.0),
          //   child: Stack(
          //     children: <Widget>[
          //       Pinned.fromPins(
          //         Pin(start: 0.0, end: 0.0),
          //         Pin(size: 20.0, start: 0.0),
          //         child: Text(
          //           'Tahu sumedang Bungseng',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 17,
          //             color: const Color(0xcc000000),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(size: 54.0, start: 16.0),
          //         Pin(size: 10.0, middle: 0.4355),
          //         child: Text(
          //           '50m, Pick up',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 9,
          //             color: const Color(0xcc000000),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
          //       Pinned.fromPins(
          //         Pin(start: 0.0, end: 2.0),
          //         Pin(size: 1.0, middle: 0.6056),
          //         child: SvgPicture.string(
          //           _svg_fvqsfk,
          //           allowDrawingOutsideViewBox: true,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment(-1.0, -0.186),
          //         child: Container(
          //           width: 13.0,
          //           height: 13.0,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //               image: const AssetImage('assets/ovo.png'),
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment(-0.113, 1.0),
          //         child: SizedBox(
          //           width: 60.0,
          //           height: 19.0,
          //           child: Stack(
          //             children: <Widget>[
          //               Container(
          //                 decoration: BoxDecoration(
          //                   color: const Color(0xff6dc720),
          //                   borderRadius: BorderRadius.circular(16.0),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: const Color(0x29000000),
          //                       offset: Offset(0, 7),
          //                       blurRadius: 6,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Align(
          //                 alignment: Alignment(-0.048, 0.111),
          //                 child: SizedBox(
          //                   width: 39.0,
          //                   height: 10.0,
          //                   child: Text(
          //                     'See more',
          //                     style: TextStyle(
          //                       fontFamily: 'Rubik',
          //                       fontSize: 9,
          //                       color: const Color(0xcc000000),
          //                     ),
          //                     softWrap: false,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Align(
            alignment: Alignment(-0.425, -0.681),
            child: Container(
              width: 40.0,
              height: 40.0,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: const AssetImage('assets/ovo.png'),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              child: SvgPicture.string(
                  widget.gambar,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 95.0, middle: 0.5467),
            Pin(size: 22.0, start: 137.0),
            child: Text(
              '${widget.jenis.toString().toUpperCase()}',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 18,
                color: const Color(0xff000b22),
                shadows: [
                  Shadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 7),
                    blurRadius: 6,
                  )
                ],
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 29.3, start: 31.0),
            Pin(size: 29.3, middle: 0.2082),
            child: SvgPicture.string(
              _svg_gqsdf,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment(-0.642, -0.57),
            child: SizedBox(
              width: 23.0,
              height: 12.0,
              child: Text(
                'Back',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 10,
                  color: const Color(0xcc008037),
                ),
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ld72dn =
    '<svg viewBox="48.0 293.0 15.4 15.0" ><path transform="translate(45.0, 290.0)" d="M 10.67092514038086 3 C 6.43233585357666 3 3 6.360000133514404 3 10.5 C 3 14.63999938964844 6.43233585357666 18 10.67092514038086 18 C 14.91719341278076 18 18.35720825195312 14.64000034332275 18.35720825195312 10.5 C 18.35720825195312 6.359999656677246 14.91719341278076 3 10.67092514038086 3 Z M 13.92665386199951 15 L 10.67860412597656 13.08749961853027 L 7.430554389953613 15 L 8.290557861328125 11.39249992370605 L 5.426438808441162 8.970000267028809 L 9.204312324523926 8.655000686645508 L 10.67860412597656 5.25 L 12.1528959274292 8.647500038146973 L 15.93076992034912 8.962499618530273 L 13.06665134429932 11.38500022888184 L 13.9266529083252 15 Z" fill="#ccbf1a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fvqsfk =
    '<svg viewBox="114.0 279.0 209.0 1.0" ><path transform="translate(114.0, 279.0)" d="M 0 0 L 209 0" fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ut1wl0 =
    '<svg viewBox="48.0 293.0 15.4 15.0" ><path transform="translate(45.0, 290.0)" d="M 10.67092514038086 3 C 6.43233585357666 3 3 6.360000133514404 3 10.5 C 3 14.63999938964844 6.43233585357666 18 10.67092514038086 18 C 14.91719341278076 18 18.35720825195312 14.64000034332275 18.35720825195312 10.5 C 18.35720825195312 6.359999656677246 14.91719341278076 3 10.67092514038086 3 Z M 13.92665386199951 15 L 10.67860412597656 13.08749961853027 L 7.430554389953613 15 L 8.290557861328125 11.39249992370605 L 5.426438808441162 8.970000267028809 L 9.204312324523926 8.655000686645508 L 10.67860412597656 5.25 L 12.1528959274292 8.647500038146973 L 15.93076992034912 8.962499618530273 L 13.06665134429932 11.38500022888184 L 13.9266529083252 15 Z" fill="#58cc1a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gqsdf =
    '<svg viewBox="31.0 163.0 29.3 29.3" ><path transform="translate(27.63, 159.63)" d="M 18 3.375 C 9.921093940734863 3.375 3.375 9.921093940734863 3.375 18 C 3.375 26.07890701293945 9.921093940734863 32.625 18 32.625 C 26.07890701293945 32.625 32.625 26.07890701293945 32.625 18 C 32.625 9.921092987060547 26.07890701293945 3.375 18 3.375 Z M 21.05156326293945 23.70234298706055 C 21.57890701293945 24.22968673706055 21.57890701293945 25.09453010559082 21.05156326293945 25.62187385559082 C 20.78437614440918 25.88906097412109 20.43984413146973 26.01562309265137 20.09531402587891 26.01562309265137 C 19.75078201293945 26.01562309265137 19.39921951293945 25.88202857971191 19.13203239440918 25.61484146118164 L 12.52265739440918 18.98437309265137 C 12.03750133514404 18.44999885559082 12.05156326293945 17.62734222412109 12.56484508514404 17.11406135559082 L 19.27265739440918 10.38515472412109 C 19.80000114440918 9.857810974121094 20.65781402587891 9.85077953338623 21.19218826293945 10.38515472412109 C 21.71953201293945 10.91249847412109 21.7265625 11.77031135559082 21.19218826293945 12.30468559265137 L 15.43359375 18 L 21.05156326293945 23.70234298706055 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
