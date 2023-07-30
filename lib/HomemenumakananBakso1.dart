import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tolongbeliin_costumer/Carapesan1.dart';
import 'package:tolongbeliin_costumer/Carapesan2.dart';
import 'package:tolongbeliin_costumer/Cekoutpesanan.dart';
import 'package:tolongbeliin_costumer/utils/Form.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class HomemenumakananBakso1 extends StatefulWidget {
  //Homemenumakanan1({super.key});
  HomemenumakananBakso1({super.key, required this.storeform, this.ispesan});
  final StoreForm storeform;
  bool? ispesan;

  @override
  State<HomemenumakananBakso1> createState() => _HomemenumakananBakso1();
}

class _HomemenumakananBakso1 extends State<HomemenumakananBakso1> {
// class HomemenumakananBakso1 extends StatelessWidget {
//   HomemenumakananBakso1({
//     Key? key,
//   }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
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
        'kategori_id': widget.storeform.kategoriId.toString(),
        'page': '$_page',
        'size': '$_limit',
        'title': '',
        'id_header': widget.storeform.storeId.toString(),
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
          'kategori_id': widget.storeform.kategoriId.toString(),
          'page': '$_page',
          'size': '$_limit',
          'title': '',
          'id_header': widget.storeform.storeId.toString(),
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

  // @override
  // void initState() {
  //   super.initState();
  //   imgVariable = NetworkImage(widget.storeform.photoSrc.toString());
  //   print(widget.storeform.name);
  // }



  @override
  Widget build(BuildContext context) {

    imgVariable = NetworkImage(widget.storeform.photoSrc.toString());
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
            Pin(start: 20.0, end: -28.0),
            Pin(size: 410.0, start: -150.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.arrow_back_ios_new),
                    backgroundColor: Colors.green[900],
                  ),
                 SizedBox(width: 5,),
                 Text(
                     "Back",

                   style: TextStyle(
              fontSize: 20.5,
              fontFamily: 'Poppins-Bold',
              // fontWeight: FontWeight.bold,
              color: Colors.black
          ),
                 )
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 106.0, start: 34.0),
            Pin(size: 19.0, start: 109.0),
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
            Pin(size: 212.0, start: 31.0),
            Pin(size: 29.0, start: 78.0),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: Text(
                  widget.storeform.name.toString(),
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
            Pin(size: 91.0, start: 16.0),
            Pin(size: 70.0, middle: 0.6119),
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
                    _svg_gmr50,
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
                      '4.5  ',
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
            alignment: Alignment(0.0, 0.224),
            child: SizedBox(
              width: 87.0,
              height: 70.0,
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
                      Pinned.fromPins(
                        Pin(size: 44.0, end: 3.0),
                        Pin(size: 19.0, middle: 0.549),
                        child: Text(
                          '500m',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 16,
                            color: const Color(0xcc000000),
                          ),
                          softWrap: false,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Pinned.fromPins(
                          Pin(size: 59.0, end: 13.0),
                          Pin(size: 15.0, end: 4.0),
                          child: Text(
                            'Distances',
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
                      ),
                    ],
                  ),
                  Pinned.fromPins(
                    Pin(size: 30.0, start: 7.0),
                    Pin(size: 30.0, middle: 0.425),
                    child: Icon(
                        Icons.location_on,
                      color: Colors.red,
                    ),
                    // child: Container(
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: const AssetImage('assets/sports.png'),
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 87.0, end: 16.0),
            Pin(size: 70.0, middle: 0.6146),
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
                Pinned.fromPins(
                  Pin(size: 34.0, middle: 0.4528),
                  Pin(size: 34.0, start: 3.0),
                  child: Icon(
                    Icons.price_change,
                    color: Colors.green,
                  ),
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: const AssetImage('assets/ovo.png'),
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
          // Pinned.fromPins(
          //   Pin(size: 99.0, start: 16.0),
          //   Pin(size: 99.0, middle: 0.777),
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
          //   Pin(size: 99.0, end: 17.0),
          //   Pin(size: 99.0, middle: 0.777),
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
                                                              Carapesan1(storeForm: widget.storeform,produkForm: produkForm2,ispesan: widget.ispesan,)
                                                              ),
                                                            );

                          },
                          child: Card(
                              margin: EdgeInsets.only(left: 25,bottom: 110),
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
                                                            fit: BoxFit.fill,
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

          // Pinned.fromPins(
          //   Pin(size: 85.0, start: 23.0),
          //   Pin(size: 30.0, middle: 0.8159),
          //   child: Stack(
          //     children: <Widget>[
          //       Stack(
          //         children: <Widget>[
          //           Container(
          //             decoration: BoxDecoration(
          //               color: const Color(0xffffffff),
          //               borderRadius: BorderRadius.circular(16.0),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: const Color(0x29000000),
          //                   offset: Offset(0, 7),
          //                   blurRadius: 6,
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Pinned.fromPins(
          //             Pin(size: 59.0, end: 12.0),
          //             Pin(size: 12.0, start: 0.0),
          //             child: Text(
          //               'Bakso gamin',
          //               style: TextStyle(
          //                 fontFamily: 'Rubik',
          //                 fontSize: 10,
          //                 color: const Color(0xcc000000),
          //               ),
          //               softWrap: false,
          //             ),
          //           ),
          //           Pinned.fromPins(
          //             Pin(size: 49.0, middle: 0.5833),
          //             Pin(size: 12.0, end: 3.0),
          //             child: Text(
          //               'Rp. 12.000',
          //               style: TextStyle(
          //                 fontFamily: 'Rubik',
          //                 fontSize: 10,
          //                 color: const Color(0xcc000000),
          //               ),
          //               softWrap: false,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // Align(
          //   alignment: Alignment(0.0, 0.632),
          //   child: SizedBox(
          //     width: 85.0,
          //     height: 30.0,
          //     child: Stack(
          //       children: <Widget>[
          //         Stack(
          //           children: <Widget>[
          //             Container(
          //               decoration: BoxDecoration(
          //                 color: const Color(0xffffffff),
          //                 borderRadius: BorderRadius.circular(16.0),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: const Color(0x29000000),
          //                     offset: Offset(0, 7),
          //                     blurRadius: 6,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             Pinned.fromPins(
          //               Pin(start: 12.0, end: 9.0),
          //               Pin(size: 12.0, start: 0.0),
          //               child: Text(
          //                 'Bakso isi telur',
          //                 style: TextStyle(
          //                   fontFamily: 'Rubik',
          //                   fontSize: 10,
          //                   color: const Color(0xcc000000),
          //                 ),
          //                 softWrap: false,
          //               ),
          //             ),
          //             Pinned.fromPins(
          //               Pin(size: 49.0, middle: 0.5833),
          //               Pin(size: 12.0, end: 3.0),
          //               child: Text(
          //                 'Rp. 14.000',
          //                 style: TextStyle(
          //                   fontFamily: 'Rubik',
          //                   fontSize: 10,
          //                   color: const Color(0xcc000000),
          //                 ),
          //                 softWrap: false,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 85.0, end: 23.0),
          //   Pin(size: 30.0, middle: 0.8159),
          //   child: Stack(
          //     children: <Widget>[
          //       Stack(
          //         children: <Widget>[
          //           Container(
          //             decoration: BoxDecoration(
          //               color: const Color(0xffffffff),
          //               borderRadius: BorderRadius.circular(16.0),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: const Color(0x29000000),
          //                   offset: Offset(0, 7),
          //                   blurRadius: 6,
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Pinned.fromPins(
          //             Pin(start: 6.0, end: 4.0),
          //             Pin(size: 12.0, start: 3.0),
          //             child: Text(
          //               'Bakso isi daging',
          //               style: TextStyle(
          //                 fontFamily: 'Rubik',
          //                 fontSize: 10,
          //                 color: const Color(0xcc000000),
          //               ),
          //               softWrap: false,
          //             ),
          //           ),
          //           Pinned.fromPins(
          //             Pin(size: 49.0, middle: 0.5833),
          //             Pin(size: 12.0, end: 3.0),
          //             child: Text(
          //               'Rp. 15.000',
          //               style: TextStyle(
          //                 fontFamily: 'Rubik',
          //                 fontSize: 10,
          //                 color: const Color(0xcc000000),
          //               ),
          //               softWrap: false,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 40.0),
            Pin(size: 297.0, middle: 0.2641),
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
            Pin(size: 227.0, start: 8.0),
            Pin(size: 30.0, end: 55.0),
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
                    Align(
                      alignment: Alignment(-0.107, 0.0),
                      child: SizedBox(
                        width: 77.0,
                        height: 20.0,
                        child: Text(
                          'Komentar',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 17,
                            color: const Color(0xcc707070),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ],
                ),
                Pinned.fromPins(
                  Pin(size: 29.0, end: 6.0),
                  Pin(start: 2.7, end: 2.7),
                  child: SvgPicture.string(
                    _svg_rph8o0,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 121.0, end: 12.0),
            Pin(size: 30.0, end: 55.0),
            child: Stack(
              children: <Widget>[
                Stack(
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
                        Pinned.fromPins(
                          Pin(size: 72.0, start: 6.0),
                          Pin(size: 20.0, middle: 0.5),
                          child: Text(
                            'Penilaian',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 17,
                              color: const Color(0xcc707070),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Pinned.fromPins(
                  Pin(size: 22.1, end: 6.0),
                  Pin(start: 4.2, end: 4.2),
                  child: SvgPicture.string(
                    _svg_uyolv,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),

          // Pinned.fromPins(
          //   Pin(size: 113.0, middle: 0.5),
          //   Pin(size: 27.0, end: 13.0),
          //   child: Stack(
          //     children: <Widget>[
          //       Container(
          //         decoration: BoxDecoration(
          //           color: const Color(0xfffda53e),
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
          //       // Container(
          //       //   decoration: BoxDecoration(
          //       //     color: const Color(0xfffda53e),
          //       //     borderRadius: BorderRadius.circular(16.0),
          //       //     boxShadow: [
          //       //       BoxShadow(
          //       //         color: const Color(0x29000000),
          //       //         offset: Offset(0, 7),
          //       //         blurRadius: 6,
          //       //       ),
          //       //     ],
          //       //   ),
          //       // ),
          //       // Pinned.fromPins(
          //       //   Pin(start: 12.0, end: 14.0),
          //       //   Pin(size: 10.0, middle: 0.5294),
          //       //   child: Text(
          //       //     'Pesan Order location',
          //       //     style: TextStyle(
          //       //       fontFamily: 'Rubik',
          //       //       fontSize: 9,
          //       //       color: const Color(0xcc000000),
          //       //     ),
          //       //     softWrap: false,
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),

          // Pinned.fromPins(
          //   Pin(size: 23.0, start: 56.0),
          //   Pin(size: 12.0, end: 103.0),
          //   child: Text(
          //     'Back',
          //     style: TextStyle(
          //       fontFamily: 'Rubik',
          //       fontSize: 10,
          //       color: const Color(0xcc3e88ff),
          //     ),
          //     softWrap: false,
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 29.3, start: 15.8),
          //   Pin(size: 29.3, end: 94.8),
          //   child: SvgPicture.string(
          //     _svg_vj6cij,
          //     allowDrawingOutsideViewBox: true,
          //     fit: BoxFit.fill,
          //   ),
          // ),


        ],
      ),
    );
  }
}

const String _svg_gmr50 =
    '<svg viewBox="51.9 308.0 31.0 32.1" ><path transform="translate(48.94, 304.96)" d="M 18.48324966430664 3 C 9.927939414978027 3 3 10.18462562561035 3 19.037109375 C 3 27.88959503173828 9.927939414978027 35.07421875 18.48324966430664 35.07421875 C 27.05405807495117 35.07421875 33.99749755859375 27.88959503173828 33.99749755859375 19.037109375 C 33.99749755859375 10.18462562561035 27.05405807495117 3 18.48324966430664 3 Z M 25.05471992492676 28.65937423706055 L 18.49874877929688 24.56991195678711 L 11.94277667999268 28.65937423706055 L 13.67863655090332 20.94552612304688 L 7.897603988647461 15.76554203033447 L 15.52298927307129 15.09198379516602 L 18.49874877929688 7.811131954193115 L 21.47450828552246 15.0759449005127 L 29.09989356994629 15.74950218200684 L 23.31886291503906 20.92948913574219 L 25.05471801757812 28.65937423706055 Z" fill="#cccc1a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rph8o0 =
    '<svg viewBox="203.0 729.7 29.0 24.7" ><path transform="translate(202.96, 727.42)" d="M 14.521728515625 2.25 C 6.50074291229248 2.25 0 7.374194622039795 0 13.6982536315918 C 0 16.42822074890137 1.213925838470459 18.92702293395996 3.233353614807129 20.89193916320801 C 2.524284839630127 23.66593742370605 0.1531588435173035 26.13722038269043 0.124796099960804 26.16473960876465 C 0 26.29133224487305 -0.03403531014919281 26.47846412658691 0.03970784693956375 26.64358329772949 C 0.1134510040283203 26.80870246887207 0.2722824215888977 26.90777587890625 0.4538040161132812 26.90777587890625 C 4.214704990386963 26.90777587890625 7.033962249755859 25.15751457214355 8.429409980773926 24.0787353515625 C 10.28433322906494 24.75572395324707 12.34346961975098 25.14650535583496 14.521728515625 25.14650535583496 C 22.54271507263184 25.14650535583496 29.04345703125 20.02231216430664 29.04345703125 13.6982536315918 C 29.04345703125 7.374193668365479 22.54271507263184 2.25 14.521728515625 2.25 Z M 7.2608642578125 15.45952320098877 C 6.256823062896729 15.45952320098877 5.445648193359375 14.67245578765869 5.445648193359375 13.6982536315918 C 5.445648193359375 12.72405052185059 6.256823062896729 11.93698406219482 7.2608642578125 11.93698406219482 C 8.26490592956543 11.93698406219482 9.076080322265625 12.72405052185059 9.076080322265625 13.6982536315918 C 9.076080322265625 14.67245578765869 8.26490592956543 15.45952320098877 7.2608642578125 15.45952320098877 Z M 14.521728515625 15.45952320098877 C 13.51768684387207 15.45952320098877 12.70651245117188 14.67245578765869 12.70651245117188 13.6982536315918 C 12.70651245117188 12.72405052185059 13.51768684387207 11.93698406219482 14.521728515625 11.93698406219482 C 15.52577018737793 11.93698406219482 16.33694458007812 12.72405052185059 16.33694458007812 13.6982536315918 C 16.33694458007812 14.67245578765869 15.52577018737793 15.45952320098877 14.521728515625 15.45952320098877 Z M 21.7825927734375 15.45952320098877 C 20.77855110168457 15.45952320098877 19.96737670898438 14.67245578765869 19.96737670898438 13.6982536315918 C 19.96737670898438 12.72405052185059 20.77855110168457 11.93698406219482 21.7825927734375 11.93698406219482 C 22.78663444519043 11.93698406219482 23.59780883789062 12.72405052185059 23.59780883789062 13.6982536315918 C 23.59780883789062 14.67245578765869 22.78663444519043 15.45952320098877 21.7825927734375 15.45952320098877 Z" fill="#8d8d8d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uyolv =
    '<svg viewBox="337.9 731.2 22.1 21.7" ><path transform="translate(334.9, 728.17)" d="M 14.04116344451904 3.000000238418579 C 7.940339088439941 3.000000238418579 3 7.853461265563965 3 13.83361911773682 C 3 19.81377601623535 7.940339088439941 24.667236328125 14.04116344451904 24.667236328125 C 20.15303802490234 24.667236328125 25.10443115234375 19.81377601623535 25.10443115234375 13.83361911773682 C 25.10443115234375 7.853461265563965 20.15303802490234 3.000000238418579 14.04116344451904 3.000000238418579 Z M 18.72730255126953 20.33378791809082 L 14.05221557617188 17.57121658325195 L 9.377127647399902 20.33378791809082 L 10.61497592926025 15.1228199005127 L 6.492499351501465 11.62356281280518 L 11.93019008636475 11.16855144500732 L 14.05221557617188 6.25008487701416 L 16.17424011230469 11.15771579742432 L 21.61193084716797 11.61272716522217 L 17.48945617675781 15.11198616027832 L 18.7273006439209 20.33378791809082 Z" fill="#0e9347" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vj6cij =
    '<svg viewBox="15.8 680.0 29.3 29.3" ><path transform="translate(12.38, 676.63)" d="M 18 3.375 C 9.921093940734863 3.375 3.375 9.921093940734863 3.375 18 C 3.375 26.07890701293945 9.921093940734863 32.625 18 32.625 C 26.07890701293945 32.625 32.625 26.07890701293945 32.625 18 C 32.625 9.921092987060547 26.07890701293945 3.375 18 3.375 Z M 21.05156326293945 23.70234298706055 C 21.57890701293945 24.22968673706055 21.57890701293945 25.09453010559082 21.05156326293945 25.62187385559082 C 20.78437614440918 25.88906097412109 20.43984413146973 26.01562309265137 20.09531402587891 26.01562309265137 C 19.75078201293945 26.01562309265137 19.39921951293945 25.88202857971191 19.13203239440918 25.61484146118164 L 12.52265739440918 18.98437309265137 C 12.03750133514404 18.44999885559082 12.05156326293945 17.62734222412109 12.56484508514404 17.11406135559082 L 19.27265739440918 10.38515472412109 C 19.80000114440918 9.857810974121094 20.65781402587891 9.85077953338623 21.19218826293945 10.38515472412109 C 21.71953201293945 10.91249847412109 21.7265625 11.77031135559082 21.19218826293945 12.30468559265137 L 15.43359375 18 L 21.05156326293945 23.70234298706055 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
