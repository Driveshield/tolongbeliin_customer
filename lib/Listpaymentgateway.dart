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
import 'package:tolongbeliin_costumer/Maps.dart';
import 'package:tolongbeliin_costumer/utils/Form.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';


class Listpaymentgateway extends StatefulWidget {
  //Listpaymentgateway({super.key});
  Listpaymentgateway({super.key, required this.storeForm, this.useralamatForm});
  StoreForm storeForm;
  UserAlamatForm? useralamatForm;
  // String gambar;
  // String idjenis;

  @override
  State<Listpaymentgateway> createState() => _Listpaymentgateway();
}


class _Listpaymentgateway extends State<Listpaymentgateway> {

  bool loading = false;
  List<ListPesananHeaderForm> pesananbasketheader = [];

  @override
  void initState() {
    super.initState();

    getdetailpesanan();
    

  }


  getdetailpesanan () async {
      OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

      OneSignal.shared.setAppId("c768598b-2ee5-442d-8ec5-619e8033498c");

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;
      setState(() => loading = true);

      try {

        http.Response response = await getlistbasket(osUserID!);
      //print(response.statusCode);
      final data = json.decode(response.body);
      //print(data);
      if(data['status'].toString() == 'false') {
        String errorMessage = data['message'];

        setState(() => loading = false);
      }else if(response.statusCode != 200) {

        String errorMessage = data['message'];
        setState(() => loading = false);

        // ArtSweetAlert.show(
        //                       context: context,
        //                       artDialogArgs: ArtDialogArgs(
        //                           type: ArtSweetAlertType.info,
        //                           title: "Error!",
        //                           text: errorMessage));

      }
      else {
        //print(data['data'].length);
        setState(() => loading = false);
        if(data['data'].length > 0)
        {

          for(var i=0; i <= (data['data'].length - 1); i++)
          {

            print(data['data'][i]['note_produk'].toString());

            // int idtrx =  int.parse(data['data'][i]['id_transaction_header'].toString());
            // int idcust = int.parse(data['data'][i]['id_customer'].toString());
            // int idDriver = int.parse(data['data'][i]['id_driver'].toString());
            // String inputdatecust = data['data'][i]['input_date'].toString(); 
            // String inputdatedriver = data['data'][i]['input_datedriver'].toString(); 
            // int idstatus = int.parse(data['data'][i]['id_transaction_status'].toString()); 
            // String ketstatus = data['data'][i]['ket_transaction_status'].toString(); 
            // int idalamatcust = int.parse(data['data'][i]['id_alamat_customer'].toString()); 
            // int jmlpesanan = int.parse(data['data'][i]['jumlah'].toString());
            // int totalharga = int.parse(data['data'][i]['totalharga_produk'].toString()); 
            // int idpembayaran = int.parse(data['data'][i]['id_pembayaran'].toString()); 
            // String produknama = data['data'][i]['namaprodukk'].toString();

            setState(() {

              pesananbasketheader.add(ListPesananHeaderForm(
              int.parse(data['data'][i]['id_transaction_header'].toString()), 
              int.parse(data['data'][i]['id_customer'].toString()), 
              null, null, null, null, null, null, 
              int.parse(data['data'][i]['jumlah'].toString()), 
              int.parse(data['data'][i]['totalharga_produk'].toString()), null, 
              data['data'][i]['namaprodukk'].toString(),
              data['data'][i]['fotoprodukk'].toString(),
              int.parse(data['data'][i]['totalhargapesanan'].toString())
              ));
              
            });
            

          }

          

        }else{


          
        }

        //print(pesananbasketheader.length);
        
      }
        
      } catch (e) {

        // ArtSweetAlert.show(
        //                       context: context,
        //                       artDialogArgs: ArtDialogArgs(
        //                           type: ArtSweetAlertType.info,
        //                           title: "Error!",
        //                           text: "Silahkan Cek Koneksi Internet Anda"));
        
      }




  }

  Future<http.Response> getlistbasket(String onesignalID) {
    return http.post(
      Uri.parse('https://dev.tolongbeliin.com/api/transaction/listpesananbasketdetail'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idonesignal': onesignalID,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Pin(start: 11.0, end: 26.0),
            Pin(size: 134.0, middle: 0.2021),
            child: GestureDetector(
              onTap: () {
                Dialog.fullscreen(
                  child: Text("data"),
                );
              },
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
                    Pin(start: 15.0, end: 12.0),
                    Pin(size: 49.0, middle: 0.7294),
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
                    Pin(size: 68.0, middle: 0.1889),
                    Pin(size: 29.0, start: 16.0),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 25,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.487, -0.357),
                    child: SizedBox(
                      width: 139.0,
                      height: 19.0,
                      child: Text(
                        (widget.useralamatForm == null ) ? '' : widget.useralamatForm!.alamatlengkap.toString(),
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 16,
                          color: const Color(0xcc000000),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 111.0, start: 50.0),
                    Pin(size: 19.0, middle: 0.6783),
                    child: Text(
                      (widget.useralamatForm == null ) ? '' : widget.useralamatForm!.alamatket.toString(),
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: const Color(0xcc949494),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 29.0, end: 26.0),
                    Pin(size: 19.0, middle: 0.6783),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 11.0, end: 26.0),
            Pin(size: 134.0, middle: 0.2021),
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
                  Pin(start: 15.0, end: 12.0),
                  Pin(size: 49.0, middle: 0.7294),
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
                  Pin(size: 68.0, middle: 0.1889),
                  Pin(size: 29.0, start: 16.0),
                  child: Text(
                    '',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 25,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.287, -0.107),
                  child: SizedBox(
                    width: screen.width / 1.4,
                    height: 19.0,
                    child: Text(
                      (widget.useralamatForm == null ) ? '' : widget.useralamatForm!.alamatlengkap.toString(),
                      style: TextStyle(
                        overflow: TextOverflow.fade,
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 311.0, start: 30.0),
                  Pin(size: 19.0, middle: 0.6783),
                  child: Text(
                    (widget.useralamatForm == null ) ? '' : widget.useralamatForm!.alamatket.toString(),
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc949494),
                    ),
                    softWrap: false,
                  ),
                ),
                GestureDetector(
                  onTap: () {

                      Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  
                                                              //ConfirmationOrder()
                                                              //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                                                              MapsScreen(storeForm: widget.storeForm)
                                                              //Cekoutpesanan()
                                                              ),
                                                            );
                  },
                  child: Pinned.fromPins(
                    Pin(size: 29.0, end: 26.0),
                    Pin(size: 19.0, middle: 0.6783),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Pinned.fromPins(
          //   Pin(start: 11.0, end: 26.0),
          //   Pin(size: 350.0, middle: 0.6132),
          //   child: 
            
          // ),
          Container(
          margin: EdgeInsets.only(top: screen.height / 2.7, left: 15, right: 25),
          height: screen.height / 2.4,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 25,top: 10,bottom: 0),
                child: Text(
                  'Order Summary',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    color: const Color(0xcc000000),
              
                  ),
                  softWrap: true,
                ),
              ),  
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: screen.width,
                  height: screen.height / 3.4,
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      Positioned(
                        child: SizedBox(
                         width: screen.width,
                          child: ListView(
                             shrinkWrap: false,
                             semanticChildCount: 0,
                             dragStartBehavior: DragStartBehavior.start,
                             primary: false,
                             reverse: false,
                             children: [
                               if(loading == true) ...[
                                   Center(
                                     child: CircularProgressIndicator(),
                                   )
                               ]else ...[
                                   if(pesananbasketheader.length > 0 ) ...[
                                       for (var j = 0;
                                         j < pesananbasketheader.length;
                                         j++) ...[
                                                     
                                           // Text(pesananbasketheader[j].produknama),
                                            
                                           Card(
                                             borderOnForeground: false,
                                             semanticContainer: false,
                                             shadowColor: Colors.white,
                                             surfaceTintColor: Colors.white,
                                             // shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                             elevation: 0,
                                             margin: const EdgeInsets.symmetric(
                                                 vertical: 4.0, horizontal: 5),
                                             child: ListTile(
                                               style: ListTileStyle.drawer,
                                               tileColor: Colors.white,
                                               hoverColor: Colors.white,
                                               title: Text(""+pesananbasketheader[j].jmlpesanan.toString()+"x "+pesananbasketheader[j].produknama.toString()+"",style: TextStyle(
                                                      fontFamily: 'Rubik',
                                                      fontSize: 16,
                                                      color: const Color(0xcc000000),)),
                                               // subtitle: Text(pesananbasketheader[j].totalharga.toString()),
                                               leading: Image.network(
                                                 pesananbasketheader[j].fotoproduk.toString(),
                                                 width: 50,
                                                 filterQuality: FilterQuality.high,
                                                 
                                                 fit: BoxFit.cover,
                                                 errorBuilder: (ctx, o, n) {
                                                 //print(o);
                                                 return Image.asset(
                                                   'assets/tolong beliin.png',
                                                   width: 100,
                                                   fit: BoxFit.fitWidth,
                                                 );
                                               },
                                               ),
                                               trailing: Text("Rp. "+pesananbasketheader[j].totalharga.toString()+"",style: TextStyle(
                                                      fontFamily: 'Rubik',
                                                      fontSize: 16,
                                                      color: const Color(0xcc000000),)),

                                             ),
                                           ),
                                            
                                         ],
                                         Card(
                                             elevation: 0,
                                             margin: const EdgeInsets.symmetric(
                                                 vertical: 4.0, horizontal: 5),
                                             child: ListTile(
                                               // title: Text("Total"),
                                               // subtitle: Text(pesananbasketheader[j].totalharga.toString()),
                                               leading: Text("Subtotal",style: TextStyle(
                                                      fontFamily: 'Rubik',
                                                      fontSize: 16,
                                                      color: const Color(0xcc000000),)),
                                               trailing: Text("Rp. "+pesananbasketheader[0].totalhargaproduk.toString()+"",style: TextStyle(
                                                      fontFamily: 'Rubik',
                                                      fontSize: 16,
                                                      color: const Color(0xcc000000),)),

                                             ),
                                           ),
                                   ],
                                   
                               ]
                             ],
                                            ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              
                // // when the _loadMore function is running
                //         if (_isLoadMoreRunning == true)
                //           const Padding(
                //             padding: EdgeInsets.only(top: 10, bottom: 40),
                //             child: Center(
                //               child: CircularProgressIndicator(),
                //             ),
                //           ),
                
                //         // When nothing else to load
                //         if (_hasNextPage == false)
                //           Container(
                //             padding: const EdgeInsets.only(top: 30, bottom: 40),
                //             color: Colors.amber,
                //             child: const Center(
                //               child: Text('You have fetched all of the content'),
                //             ),
                //           ),
            ],
          ),
            ),
          
          Pinned.fromPins(
            Pin(start: 11.0, end: 26.0),
            Pin(size: 68.0, end: 88.0),
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
                  Pin(size: 112.0, start: 15.0),
                  Pin(size: 19.0, start: 9.0),
                  child: Text(
                    'Payment detail',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: const Color(0xcc000000),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          // Pinned.fromPins(
          //   Pin(size: 145.0, start: 18.0),
          //   Pin(size: 36.0, middle: 0.7848),
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
          //         Pin(size: 61.0, end: 15.0),
          //         Pin(size: 12.0, middle: 0.5),
          //         child: Text(
          //           'Rp.1.000.000',
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
          //   Pin(size: 145.0, start: 18.0),
          //   Pin(size: 36.0, end: 119.0),
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
          //         alignment: Alignment(0.5, 0.0),
          //         child: SizedBox(
          //           width: 53.0,
          //           height: 12.0,
          //           child: Text(
          //             'Rp.100.000',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 10,
          //               color: const Color(0xcc000000),
          //             ),
          //             softWrap: false,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 145.0, end: 53.0),
          //   Pin(size: 36.0, middle: 0.7848),
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
          //         alignment: Alignment(0.423, 0.0),
          //         child: SizedBox(
          //           width: 48.0,
          //           height: 12.0,
          //           child: Text(
          //             'Rp.50.000',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 10,
          //               color: const Color(0xcc000000),
          //             ),
          //             softWrap: false,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 145.0, end: 53.0),
          //   Pin(size: 36.0, end: 119.0),
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
          //         alignment: Alignment(0.014, 0.0),
          //         child: SizedBox(
          //           width: 72.0,
          //           height: 12.0,
          //           child: Text(
          //             'Virtual Account',
          //             style: TextStyle(
          //               fontFamily: 'Rubik',
          //               fontSize: 10,
          //               color: const Color(0xcc000000),
          //             ),
          //             softWrap: false,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          
          Pinned.fromPins(
            Pin(size: 30.0, start: 26.0),
            Pin(size: 30.0, middle: 0.1957),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/map.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 12.0, end: 26.0),
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
            Pin(size: 23.0, start: 52.3),
            Pin(size: 12.0, start: 40.8),
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
            Pin(size: 29.3, start: 12.0),
            Pin(size: 29.3, start: 29.8),
            child: SvgPicture.string(
              _svg_o2n5,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 127.0, middle: 0.5),
            Pin(size: 43.0, end: 22.0),
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
                  Pin(start: 14.0, end: 13.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Place order',
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
          // Pinned.fromPins(
          //   Pin(size: 53.0, start: 29.0),
          //   Pin(size: 53.0, middle: 0.4242),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/ovo.png'),
          //         fit: BoxFit.cover,
          //       ),
          //       borderRadius: BorderRadius.circular(16.0),
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 53.0, start: 29.0),
          //   Pin(size: 53.0, middle: 0.5138),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/ovo.png'),
          //         fit: BoxFit.cover,
          //       ),
          //       borderRadius: BorderRadius.circular(16.0),
          //     ),
          //   ),
          // ),
          // Align(
          //   alignment: Alignment(-0.505, -0.146),
          //   child: SizedBox(
          //     width: 88.0,
          //     height: 30.0,
          //     child: Stack(
          //       children: <Widget>[
          //         Container(
          //           decoration: BoxDecoration(
          //             color: const Color(0xffffffff),
          //             borderRadius: BorderRadius.circular(1.0),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: const Color(0x29000000),
          //                 offset: Offset(0, 7),
          //                 blurRadius: 6,
          //               ),
          //             ],
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment(0.056, 0.0),
          //           child: SizedBox(
          //             width: 52.0,
          //             height: 12.0,
          //             child: Text(
          //               'Es campur ',
          //               style: TextStyle(
          //                 fontFamily: 'Rubik',
          //                 fontSize: 10,
          //                 color: const Color(0xcc000000),
          //               ),
          //               softWrap: false,
          //             ),
          //           ),
          //         ),
          //         Pinned.fromPins(
          //           Pin(size: 10.0, start: 3.0),
          //           Pin(size: 12.0, middle: 0.5),
          //           child: Text(
          //             '1x',
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
          // Align(
          //   alignment: Alignment(-0.505, 0.028),
          //   child: SizedBox(
          //     width: 88.0,
          //     height: 30.0,
          //     child: Stack(
          //       children: <Widget>[
          //         Container(
          //           decoration: BoxDecoration(
          //             color: const Color(0xffffffff),
          //             borderRadius: BorderRadius.circular(1.0),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: const Color(0x29000000),
          //                 offset: Offset(0, 7),
          //                 blurRadius: 6,
          //               ),
          //             ],
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment(1.0, -0.1),
          //           child: SizedBox(
          //             width: 69.0,
          //             height: 10.0,
          //             child: Text(
          //               'Es buah nangka ',
          //               style: TextStyle(
          //                 fontFamily: 'Rubik',
          //                 fontSize: 9,
          //                 color: const Color(0xcc000000),
          //               ),
          //               softWrap: false,
          //             ),
          //           ),
          //         ),
          //         Pinned.fromPins(
          //           Pin(size: 10.0, start: 3.0),
          //           Pin(size: 12.0, middle: 0.5),
          //           child: Text(
          //             '1x',
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
          //   Pin(size: 69.0, end: 53.0),
          //   Pin(size: 17.0, middle: 0.4314),
          //   child: Text(
          //     'Rp. 12.000',
          //     style: TextStyle(
          //       fontFamily: 'Rubik',
          //       fontSize: 14,
          //       color: const Color(0xcc000000),
          //     ),
          //     softWrap: false,
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 69.0, end: 53.0),
          //   Pin(size: 17.0, middle: 0.522),
          //   child: Text(
          //     'Rp. 14.000',
          //     style: TextStyle(
          //       fontFamily: 'Rubik',
          //       fontSize: 14,
          //       color: const Color(0xcc000000),
          //     ),
          //     softWrap: false,
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 71.0, end: 51.0),
          //   Pin(size: 17.0, middle: 0.5824),
          //   child: Text(
          //     'Rp. 26.000',
          //     style: TextStyle(
          //       fontFamily: 'Rubik',
          //       fontSize: 14,
          //       color: const Color(0xcc000000),
          //     ),
          //     softWrap: false,
          //   ),
          // ),
          // Align(
          //   alignment: Alignment(0.622, 0.208),
          //   child: SizedBox(
          //     width: 63.0,
          //     height: 17.0,
          //     child: Text(
          //       'Rp. 3.000',
          //       style: TextStyle(
          //         fontFamily: 'Rubik',
          //         fontSize: 14,
          //         color: const Color(0xcc000000),
          //       ),
          //       softWrap: false,
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 70.0, end: 48.0),
          //   Pin(size: 17.0, middle: 0.6566),
          //   child: Text(
          //     'Rp. 29.000',
          //     style: TextStyle(
          //       fontFamily: 'Rubik',
          //       fontSize: 14,
          //       color: const Color(0xcc000000),
          //     ),
          //     softWrap: false,
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 55.0, start: 37.0),
          //   Pin(size: 17.0, middle: 0.5824),
          //   child: Text(
          //     'Subtotal',
          //     style: TextStyle(
          //       fontFamily: 'Rubik',
          //       fontSize: 14,
          //       color: const Color(0xcc000000),
          //     ),
          //     softWrap: false,
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 55.0, start: 37.0),
          //   Pin(size: 17.0, middle: 0.6566),
          //   child: Text(
          //     'Subtotal',
          //     style: TextStyle(
          //       fontFamily: 'Rubik',
          //       fontSize: 14,
          //       color: const Color(0xcc000000),
          //     ),
          //     softWrap: false,
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 76.0, start: 37.0),
          //   Pin(size: 17.0, middle: 0.6088),
          //   child: Text(
          //     'Delivery fee',
          //     style: TextStyle(
          //       fontFamily: 'Rubik',
          //       fontSize: 14,
          //       color: const Color(0xcc008900),
          //     ),
          //     softWrap: false,
          //   ),
          // ),
          
          // Pinned.fromPins(
          //   Pin(size: 58.0, start: 24.0),
          //   Pin(size: 24.0, middle: 0.7805),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/ovo.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 59.0, start: 24.0),
          //   Pin(size: 12.0, end: 131.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/ovo.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
          // Align(
          //   alignment: Alignment(0.157, 0.555),
          //   child: Container(
          //     width: 57.0,
          //     height: 16.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/ovo.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

const String _svg_o2n5 =
    '<svg viewBox="12.0 29.8 29.3 29.3" ><path transform="translate(8.63, 26.38)" d="M 18 3.375 C 9.921093940734863 3.375 3.375 9.921093940734863 3.375 18 C 3.375 26.07890701293945 9.921093940734863 32.625 18 32.625 C 26.07890701293945 32.625 32.625 26.07890701293945 32.625 18 C 32.625 9.921092987060547 26.07890701293945 3.375 18 3.375 Z M 21.05156326293945 23.70234298706055 C 21.57890701293945 24.22968673706055 21.57890701293945 25.09453010559082 21.05156326293945 25.62187385559082 C 20.78437614440918 25.88906097412109 20.43984413146973 26.01562309265137 20.09531402587891 26.01562309265137 C 19.75078201293945 26.01562309265137 19.39921951293945 25.88202857971191 19.13203239440918 25.61484146118164 L 12.52265739440918 18.98437309265137 C 12.03750133514404 18.44999885559082 12.05156326293945 17.62734222412109 12.56484508514404 17.11406135559082 L 19.27265739440918 10.38515472412109 C 19.80000114440918 9.857810974121094 20.65781402587891 9.85077953338623 21.19218826293945 10.38515472412109 C 21.71953201293945 10.91249847412109 21.7265625 11.77031135559082 21.19218826293945 12.30468559265137 L 15.43359375 18 L 21.05156326293945 23.70234298706055 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
